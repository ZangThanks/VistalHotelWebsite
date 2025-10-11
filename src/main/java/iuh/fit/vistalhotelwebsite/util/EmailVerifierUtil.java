package iuh.fit.vistalhotelwebsite.util;

import iuh.fit.vistalhotelwebsite.config.OAuthConfig;

import javax.naming.Context;
import javax.naming.directory.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.*;

/**
 * Lớp tiện ích để xác minh khả năng nhận email (deliverability) của một địa chỉ email.
 * Lớp này thực hiện một "kiểm tra sâu" (deep check) bằng cách kết nối trực tiếp đến máy chủ mail
 * của tên miền và hỏi xem địa chỉ email đó có tồn tại hay không, thay vì chỉ kiểm tra định dạng.
 */
public class EmailVerifierUtil {

    public enum Result {
        DELIVERABLE,
        UNDELIVERABLE,
        UNKNOWN
    }

    /**
     * Kiểm tra khả năng nhận thư của một địa chỉ email.
     *
     * @param email Địa chỉ email cần kiểm tra.
     * @return Một trong ba kết quả: {@link Result#DELIVERABLE}, {@link Result#UNDELIVERABLE}, hoặc {@link Result#UNKNOWN}.
     */
    public static Result checkDeliverable(String email) {
        try {
            // Bước 0: Kiểm tra định dạng cơ bản
            if (!ValidationUtil.isValidEmail(email)) {
                return Result.UNDELIVERABLE;
            }

            // Bước 1: Tra cứu bản ghi MX
            String domain = email.substring(email.indexOf('@') + 1);
            List<String> mxHosts = lookupMX(domain);
            if (mxHosts.isEmpty()) {
                return Result.UNDELIVERABLE; // Không tìm thấy máy chủ mail cho tên miền này
            }

            // Bước 2: Thử kết nối SMTP tới từng máy chủ mail
            String helo = OAuthConfig.env("EMAIL_VERIFIER_HELO", "vistahotel.local");
            String from = OAuthConfig.env("EMAIL_VERIFIER_FROM", "no-reply@vistahotel.local");
            int connectTimeout = Integer.parseInt(OAuthConfig.env("EMAIL_VERIFIER_CONNECT_TIMEOUT_MS", "3000"));
            int readTimeout = Integer.parseInt(OAuthConfig.env("EMAIL_VERIFIER_READ_TIMEOUT_MS", "3000"));

            for (String host : mxHosts) {
                Result r = trySmtp(host, 25, helo, from, email, connectTimeout, readTimeout);
                // Trả về ngay khi có kết quả rõ ràng (DELIVERABLE hoặc UNDELIVERABLE)
                if (r != Result.UNKNOWN) {
                    return r;
                }
            }
            // Nếu đã thử hết các máy chủ mà vẫn không xác định được
            return Result.UNKNOWN;
        } catch (Exception e) {
            // Bất kỳ lỗi ngoại lệ nào cũng được coi là không xác định được
            return Result.UNKNOWN;
        }
    }

    /**
     * Tra cứu các bản ghi MX (Mail Exchange) cho một tên miền cụ thể bằng JNDI.
     *
     * @param domain Tên miền cần tra cứu (ví dụ: "gmail.com").
     * @return Danh sách các máy chủ mail (hostname). Nếu không tìm thấy bản ghi MX,
     * nó sẽ trả về chính tên miền đó như một giải pháp thay thế (fallback). Trả về danh sách rỗng nếu có lỗi.
     */
    private static List<String> lookupMX(String domain) {
        try {
            Hashtable<String, String> env = new Hashtable<>();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.dns.DnsContextFactory");
            DirContext ctx = new InitialDirContext(env);
            Attributes attrs = ctx.getAttributes(domain, new String[]{"MX"});
            Attribute attr = attrs.get("MX");
            List<String> hosts = new ArrayList<>();
            if (attr != null) {
                for (int i = 0; i < attr.size(); i++) {
                    String[] parts = attr.get(i).toString().split("\\s+");
                    String host = parts[parts.length - 1];
                    if (host.endsWith(".")) {
                        host = host.substring(0, host.length() - 1);
                    }
                    hosts.add(host);
                }
            }
            // Fallback: nếu không có bản ghi MX, máy chủ mail có thể chính là tên miền
            if (hosts.isEmpty()) {
                hosts.add(domain);
            }
            return hosts;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    /**
     * Cố gắng thực hiện một phiên giao tiếp SMTP ngắn để kiểm tra một địa chỉ email.
     *
     * @param host           Hostname của máy chủ SMTP.
     * @param port           Cổng kết nối (thường là 25).
     * @param helo           Tên miền để gửi trong lệnh HELO.
     * @param from           Địa chỉ email người gửi.
     * @param to             Địa chỉ email người nhận (cần kiểm tra).
     * @param connectTimeout Thời gian chờ kết nối (ms).
     * @param readTimeout    Thời gian chờ đọc dữ liệu (ms).
     * @return Kết quả dựa trên phản hồi của máy chủ SMTP cho lệnh RCPT TO.
     */
    private static Result trySmtp(String host, int port, String helo, String from, String to,
                                  int connectTimeout, int readTimeout) {
        try (Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress(host, port), connectTimeout);
            socket.setSoTimeout(readTimeout);

            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            OutputStream out = socket.getOutputStream();

            if (!readCode(in, 220)) return Result.UNKNOWN; // Chờ welcome message
            write(out, "HELO " + helo + "\r\n");
            if (!readCode(in, 250)) return Result.UNKNOWN;
            write(out, "MAIL FROM:<" + from + ">\r\n");
            if (!readCode(in, 250)) return Result.UNKNOWN;
            write(out, "RCPT TO:<" + to + ">\r\n");
            String line = in.readLine();
            if (line == null) return Result.UNKNOWN;

            // Phân tích phản hồi cho RCPT TO
            if (line.startsWith("250") || line.startsWith("251")) return Result.DELIVERABLE;
            if (line.startsWith("550") || line.startsWith("551") || line.startsWith("553")) return Result.UNDELIVERABLE;

            // Các mã khác (4xx, 5xx khác) được coi là không xác định
            return Result.UNKNOWN;
        } catch (Exception e) {
            return Result.UNKNOWN;
        }
    }

    /**
     * Đọc một dòng từ BufferedReader và kiểm tra xem nó có bắt đầu bằng mã trạng thái mong đợi không.
     */
    private static boolean readCode(BufferedReader in, int expected) throws Exception {
        String line = in.readLine();
        return line != null && line.startsWith(String.valueOf(expected));
    }

    /**
     * Gửi một chuỗi dữ liệu (lệnh SMTP) tới OutputStream.
     */
    private static void write(OutputStream out, String data) throws Exception {
        out.write(data.getBytes());
        out.flush();
    }
}