package iuh.fit.vistalhotelwebsite.util;

import jakarta.servlet.ServletContext;

/**
 * Lớp tiện ích để truy xuất các giá trị cấu hình từ nhiều nguồn khác nhau một cách thống nhất.
 */
public class ConfigUtil {

    private static ServletContext ctx;

    private ConfigUtil() {}

    /**
     * Khởi tạo lớp tiện ích với {@code ServletContext} của ứng dụng.
     * Phương thức này PHẢI được gọi một lần khi ứng dụng web bắt đầu (ví dụ, trong phương thức
     * {@code contextInitialized} của một {@code ServletContextListener}) để lớp có thể
     * đọc các tham số cấu hình từ file {@code web.xml}.
     *
     * @param c Đối tượng {@code ServletContext} của ứng dụng web.
     */
    public static void init(ServletContext c) {
        ctx = c;
    }

    /**
     * Lấy một giá trị cấu hình dựa trên khóa (key) được cung cấp, với một giá trị mặc định.
     * @param key Khóa (tên) của giá trị cấu hình cần tìm.
     * @param def Giá trị mặc định sẽ được trả về nếu không tìm thấy khóa ở bất kỳ nguồn nào.
     * @return Giá trị cấu hình tìm được, hoặc giá trị mặc định nếu không tìm thấy.
     */
    public static String get(String key, String def) {
        // 1. Ưu tiên cao nhất: Biến môi trường hệ thống
        String v = System.getenv(key);
        if (v != null && !v.isBlank()) {
            return v;
        }
        // 2. Ưu tiên thứ hai: Thuộc tính hệ thống JVM
        v = System.getProperty(key);
        if (v != null && !v.isBlank()) {
            return v;
        }
        // 3. Ưu tiên thứ ba: Tham số trong web.xml
        if (ctx != null) {
            String p = ctx.getInitParameter(key);
            if (p != null && !p.isBlank()) {
                return p;
            }
        }
        // 4. Nếu không tìm thấy, trả về giá trị mặc định
        return def;
    }
}