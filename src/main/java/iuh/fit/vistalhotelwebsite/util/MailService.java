package iuh.fit.vistalhotelwebsite.util;

import iuh.fit.vistalhotelwebsite.config.OAuthConfig;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Lớp dịch vụ chịu trách nhiệm gửi email cho các hoạt động của ứng dụng.
 * Lớp này sử dụng một thread pool để gửi email một cách bất đồng bộ (asynchronously),
 * giúp tránh làm chặn luồng chính của ứng dụng trong khi chờ phản hồi từ máy chủ mail.
 * Cấu hình SMTP được lấy từ các biến môi trường.
 */
public class MailService {
    /**
     * Một thread pool cố định với 3 luồng để xử lý các tác vụ gửi email bất đồng bộ.
     * Việc sử dụng thread pool giúp giới hạn số lượng kết nối đồng thời đến máy chủ mail.
     */
    private static final ExecutorService POOL = Executors.newFixedThreadPool(3);

    /**
     * Khởi tạo và cấu hình một đối tượng {@link Session} của Jakarta Mail.
     * Phương thức này đọc các thông tin cần thiết như host, port, username, và password
     * từ các biến môi trường để thiết lập kết nối SMTP với xác thực.
     *
     * @return Một đối tượng {@code Session} đã được cấu hình sẵn sàng để sử dụng.
     */
    private static Session session() {
        String host = OAuthConfig.env("MAIL_HOST", "");
        int port = Integer.parseInt(OAuthConfig.env("MAIL_PORT", "587"));
        String user = OAuthConfig.env("MAIL_USERNAME", "");
        String pass = OAuthConfig.env("MAIL_PASSWORD", "");

        Properties p = new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", host);
        p.put("mail.smtp.port", String.valueOf(port));
        if (!host.isBlank()) p.put("mail.smtp.ssl.trust", host);

        return Session.getInstance(p, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
    }

    /**
     * Phương thức cốt lõi thực hiện việc gửi một email (đồng bộ - synchronous).
     * Phương thức này tạo một đối tượng {@link Message}, thiết lập người gửi, người nhận,
     *
     * @param to      Địa chỉ email của người nhận.
     * @param subject Tiêu đề của email.
     * @param html    Nội dung email dưới dạng chuỗi HTML, sử dụng mã hóa UTF-8.
     * @throws Exception Ném ra khi có lỗi trong quá trình tạo hoặc gửi email (ví dụ: {@link MessagingException}).
     */
    private static void send(String to, String subject, String html) throws Exception {
        String fromEmail = OAuthConfig.env("MAIL_FROM",
                OAuthConfig.env("MAIL_USERNAME", "no-reply@vistahotel.local"));
        String fromName = OAuthConfig.env("MAIL_FROM_NAME", "Vista Hotel");

        Message m = new MimeMessage(session());
        m.setFrom(new InternetAddress(fromEmail, fromName, "UTF-8"));
        m.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        m.setSubject(subject);
        m.setContent(html, "text/html; charset=UTF-8");
        Transport.send(m);
    }

    /**
     * Gửi một email một cách bất đồng bộ (asynchronously) sử dụng thread pool.
     * Tác vụ gửi email được đưa vào hàng đợi và thực thi trên một luồng riêng biệt.
     * Nếu có lỗi xảy ra trong quá trình gửi, lỗi sẽ được in ra console mà không làm gián đoạn luồng gọi.
     * Đây là phương thức chính được khuyến khích sử dụng từ bên ngoài lớp này.
     *
     * @param to      Địa chỉ email của người nhận.
     * @param subject Tiêu đề của email.
     * @param html    Nội dung email dưới dạng chuỗi HTML.
     */
    public static void sendAsync(String to, String subject, String html) {
        POOL.submit(() -> {
            try {
                send(to, subject, html);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    // === CÁC MẪU EMAIL (TEMPLATES) ===

    /**
     * Gửi email chào mừng người dùng mới đăng ký.
     *
     * @param to   Địa chỉ email của người dùng mới.
     * @param name Tên của người dùng để cá nhân hóa email (có thể là {@code null}).
     */
    public static void sendWelcome(String to, String name) {
        String sub = "Chào mừng đến Vista Hotel ✨";
        String body = """
                  <div style='font-family:system-ui,sans-serif'>
                    <h2>Xin chào %s,</h2>
                    <p>Chào mừng bạn đến với Vista Hotel! Chúc bạn có trải nghiệm tuyệt vời.</p>
                    <p>— Đội ngũ Vista Hotel</p>
                  </div>
                """.formatted(name != null ? name : "bạn");
        sendAsync(to, sub, body);
    }

    /**
     * Gửi email chào mừng người dùng quay trở lại sau khi đăng nhập.
     *
     * @param to   Địa chỉ email của người dùng.
     * @param name Tên của người dùng để cá nhân hóa email (có thể là {@code null}).
     */
    public static void sendWelcomeBack(String to, String name) {
        String sub = "Chào mừng trở lại 👋";
        String body = """
                  <div style='font-family:system-ui,sans-serif'>
                    <p>Rất vui được gặp lại %s! Bạn đã đăng nhập thành công.</p>
                  </div>
                """.formatted(name != null ? name : "");
        sendAsync(to, sub, body);
    }

    /**
     * Gửi email chứa mã xác thực một lần (OTP) để đặt lại mật khẩu.
     *
     * @param to   Địa chỉ email của người dùng yêu cầu đặt lại mật khẩu.
     * @param code Mã OTP được tạo ngẫu nhiên.
     */
    public static void sendOTP(String to, String code) {
        String sub = "Mã xác thực đặt lại mật khẩu";
        String body = """
                  <div style='font-family:system-ui,sans-serif'>
                    <p>Mã xác nhận của bạn là:</p>
                    <h2 style='letter-spacing:4px'>%s</h2>
                    <p>Mã có hiệu lực trong 2 phút.</p>
                  </div>
                """.formatted(code);
        sendAsync(to, sub, body);
    }

    /**
     * Gửi email thông báo cho người dùng rằng mật khẩu của họ đã được thay đổi thành công.
     *
     * @param to   Địa chỉ email của người dùng.
     * @param name Tên của người dùng (có thể là {@code null}).
     */
    public static void sendPasswordChanged(String to, String name) {
        String sub = "Mật khẩu của bạn đã được thay đổi";
        String body = """
                  <div style='font-family:system-ui,sans-serif'>
                    <p>Xin chào %s,</p>
                    <p>Mật khẩu tài khoản Vista Hotel của bạn vừa được cập nhật thành công.</p>
                    <p>Nếu không phải bạn thực hiện, vui lòng đổi lại mật khẩu ngay và liên hệ bộ phận hỗ trợ.</p>
                  </div>
                """.formatted(name != null ? name : "");
        sendAsync(to, sub, body);
    }
}