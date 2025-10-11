package iuh.fit.vistalhotelwebsite.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Lớp tiện ích (utility class) để xử lý các hoạt động liên quan đến mật khẩu.
 * Sử dụng thư viện jBCrypt để băm và xác minh mật khẩu.
 * Lớp này được đánh dấu là {@code final} và có một constructor riêng tư để ngăn chặn việc kế thừa hoặc khởi tạo.
 */
public final class PasswordUtil {

    /**
     * Constructor riêng tư để ngăn việc khởi tạo đối tượng từ bên ngoài.
     */
    private PasswordUtil() {}

    /**
     * Băm một mật khẩu dạng văn bản thô sử dụng thuật toán BCrypt.
     * Phương thức này sẽ tạo ra một "salt" ngẫu nhiên và kết hợp nó với mật khẩu trước khi băm.
     *
     * @param plainPassword Mật khẩu dạng văn bản thô cần được băm.
     * @return Một chuỗi đại diện cho mật khẩu đã được băm (bao gồm cả salt).
     */
    public static String hashPassword(String plainPassword) {
        // Tham số thứ hai (workload) của gensalt là log_rounds, giá trị từ 10-12 thường được khuyến nghị.
        String salt = BCrypt.gensalt(10);
        return BCrypt.hashpw(plainPassword, salt);
    }

    /**
     * Xác minh một mật khẩu dạng văn bản thô có khớp với một mật khẩu đã được băm hay không.
     *
     * @param plainPassword Mật khẩu dạng văn bản thô cần kiểm tra (ví dụ: mật khẩu người dùng nhập vào).
     * @param hashedPassword Mật khẩu đã được băm trước đó (ví dụ: mật khẩu lưu trong cơ sở dữ liệu).
     * @return {@code true} nếu mật khẩu khớp, và {@code false} nếu ngược lại.
     */
    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}