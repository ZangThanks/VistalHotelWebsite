package iuh.fit.vistalhotelwebsite.util;

/**
 * Lớp tiện ích (Utility) hỗ trợ kiểm tra tính hợp lệ của dữ liệu đầu vào người dùng.
 */
public class ValidationUtil {

    /**
     * @param value Chuỗi cần kiểm tra.
     * @return {@code true} nếu chuỗi null hoặc rỗng, ngược lại {@code false}.
     *
     * Ví dụ:
     * ValidationUtil.isNullOrEmpty("   "); // true
     * ValidationUtil.isNullOrEmpty("abc"); // false
     */
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Dựa trên regex cơ bản: {@code ^[^@\s]+@[^@\s]+\.[^@\s]+$}
     *
     * @param email Địa chỉ email cần kiểm tra.
     * @return {@code true} nếu đúng định dạng email, ngược lại {@code false}.
     *
     * Ví dụ:
     * ValidationUtil.isValidEmail("user@gmail.com"); // true
     * ValidationUtil.isValidEmail("user@domain");    // false
     */
    public static boolean isValidEmail(String email) {
        if (isNullOrEmpty(email)) return false;
        return email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");
    }

    /**
     * @param phone Số điện thoại cần kiểm tra.
     * @return {@code true} nếu hợp lệ, ngược lại {@code false}.
     *
     * Ví dụ:
     * ValidationUtil.isValidPhone("0912345678");  // true
     * ValidationUtil.isValidPhone("123abc456");   // false
     */
    public static boolean isValidPhone(String phone) {
        if (isNullOrEmpty(phone)) return false;
        return phone.matches("^[0-9]{9,12}$");
    }

    /**
     * @param password Mật khẩu cần kiểm tra.
     * @return {@code true} nếu mật khẩu mạnh, ngược lại {@code false}.
     *
     * Ví dụ:
     * ValidationUtil.isValidPassword("Aa@12345"); // true
     * ValidationUtil.isValidPassword("abc123");   // false
     */
    public static boolean isValidPassword(String password) {
        if (isNullOrEmpty(password)) return false;

        // Regex kiểm tra các điều kiện của mật khẩu mạnh
        return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
    }

}
