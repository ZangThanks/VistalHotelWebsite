package iuh.fit.vistalhotelwebsite.util;

/**
 * Lớp tiện ích (Utility class) hỗ trợ thao tác nhanh với chuỗi (String).
 */
public final class StringUtil {

    private StringUtil() {}

    /**
     * Kiểm tra xem chuỗi có tồn tại giá trị hợp lệ hay không.
     * @param s Chuỗi cần kiểm tra.
     * @return {@code true} nếu chuỗi có giá trị, ngược lại {@code false}.
     *
     * Ví dụ:
     * StringUtil.has("Vista");     // true
     * StringUtil.has("   ");       // false
     * StringUtil.has(null);        // false
     */
    public static boolean has(String s) {
        return s != null && !s.isBlank();
    }
}
