package iuh.fit.vistalhotelwebsite.util;

import java.util.UUID;

/**
 * Lớp tiện ích để tạo ra các chuỗi ID (mã định danh) ngẫu nhiên và duy nhất.
 * Lớp này cung cấp các phương thức tĩnh để tạo ID dựa trên UUID (Universally Unique Identifier),
 * cho phép tùy chỉnh tiền tố và độ dài để phù hợp với các yêu cầu khác nhau trong hệ thống
 * (ví dụ: mã khách hàng, mã đơn hàng, mã phòng).
 */
public class GenerateIDUtil {

    /**
     * Constructor riêng tư để ngăn việc khởi tạo đối tượng của lớp tiện ích này.
     */
    private GenerateIDUtil() {
    }

    /**
     * Tạo một chuỗi ID duy nhất với tiền tố và độ dài cho phần ngẫu nhiên được chỉ định.
     * Phương thức này sử dụng {@link UUID#randomUUID()} (UUID version 4) để đảm bảo tính ngẫu nhiên
     * và xác suất trùng lặp cực kỳ thấp. Chuỗi UUID sau đó được xử lý (loại bỏ gạch nối, chuyển thành chữ hoa)
     * và cắt theo độ dài yêu cầu trước khi ghép với tiền tố.
     *
     * @param prefix Tiền tố cho ID (ví dụ: "KH", "HD"). Chuỗi này sẽ được đặt ở đầu ID.
     * @param length Độ dài mong muốn cho phần ID ngẫu nhiên (phần đứng sau tiền tố).
     * Nếu độ dài yêu cầu lớn hơn độ dài tối đa của UUID (32),
     * độ dài tối đa sẽ được sử dụng để tránh lỗi.
     * @return Một chuỗi ID hoàn chỉnh có dạng {@code prefix + chuỗi_ngẫu_nhiên}.
     */
    public static String generateId(String prefix, int length) {
        // Tạo một UUID ngẫu nhiên, loại bỏ các dấu gạch nối và chuyển thành chữ hoa.
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();

        // Cắt chuỗi uuid theo độ dài yêu cầu và ghép với tiền tố.
        // Math.min được dùng để đảm bảo không cắt vượt quá độ dài của chuỗi uuid.
        return prefix + uuid.substring(0, Math.min(length, uuid.length()));
    }

}