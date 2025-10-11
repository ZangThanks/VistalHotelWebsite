package iuh.fit.vistalhotelwebsite.util;

import iuh.fit.vistalhotelwebsite.config.OAuthConfig;

/**
 * Lớp tiện ích (Utility) hỗ trợ gửi tin nhắn SMS đến người dùng.
 */
public class SmsService {

    /**
     * Gửi tin nhắn SMS đến số điện thoại người nhận.
     * @param toPhone Số điện thoại người nhận (phải bao gồm mã quốc gia, ví dụ: +84901234567).
     * @param content Nội dung tin nhắn cần gửi.
     * @return {@code true} nếu gửi thành công hoặc log được ra console,
     *         {@code false} nếu xảy ra lỗi trong quá trình gửi.
     */
    public static boolean send(String toPhone, String content) {
        try {
            String sid   = OAuthConfig.env("TWILIO_SID", "");
            String token = OAuthConfig.env("TWILIO_TOKEN", "");
            String from  = OAuthConfig.env("TWILIO_FROM", "");

            // Nếu chưa cấu hình Twilio, chỉ in log ra console để debug
            if (sid.isBlank() || token.isBlank() || from.isBlank()) {
                System.out.println("[SMS] -> " + toPhone + " | " + content);
                return true;
            }

            // Nếu muốn sử dụng Twilio thật, bỏ comment đoạn dưới và thêm dependency:
            /*
            com.twilio.Twilio.init(sid, token);
            com.twilio.rest.api.v2010.account.Message.creator(
                new com.twilio.type.PhoneNumber(toPhone),
                new com.twilio.type.PhoneNumber(from),
                content
            ).create();
            */
            System.out.println("[SMS/Twilio] -> " + toPhone + " | " + content);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false; // Không chặn luồng, chỉ ghi log lỗi
        }
    }

    /**
     * Gửi tin nhắn chào mừng khi người dùng đăng ký tài khoản mới.
     * @param phone Số điện thoại người nhận.
     * @param name  Tên người dùng (nếu có).
     */
    public static void sendWelcome(String phone, String name) {
        send(phone, "Vista Hotel: Chao mung " + (name != null ? name : "") + " da dang ky!");
    }

    /**
     * Gửi tin nhắn chào mừng khi người dùng đăng nhập trở lại hệ thống.
     * @param phone Số điện thoại người nhận.
     * @param name  Tên người dùng (nếu có).
     */
    public static void sendWelcomeBack(String phone, String name) {
        send(phone, "Vista Hotel: Chao mung " + (name != null ? name : "") + " tro lai!");
    }

    /**
     * Gửi mã OTP xác thực khi người dùng quên mật khẩu.
     * @param phone Số điện thoại người nhận.
     * @param code  Mã OTP gồm 6 chữ số.
     */
    public static void sendOtp(String phone, String code) {
        send(phone, "Vista Hotel OTP: " + code + " (het han trong 2 phut).");
    }

    /**
     * Gửi thông báo khi người dùng đổi mật khẩu thành công.
     * @param phone Số điện thoại người nhận.
     */
    public static void sendPasswordChanged(String phone) {
        send(phone, "Vista Hotel: Mat khau cua ban da duoc thay doi. "
                + "Neu khong phai ban, hay lien he ho tro ngay.");
    }
}
