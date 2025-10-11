/**
 * Centralized client-side validation logic for auth forms.
 *
 * @file validation.js
 * @description Cung cấp các hàm kiểm tra hợp lệ cơ bản cho email, số điện thoại,
 * mật khẩu… dùng lại trên các form đăng nhập/đăng ký/quên mật khẩu.
 * Tất cả hàm đều thuần (pure), không có side-effect.
 */

/**
 * Kiểm tra giá trị rỗng (null/undefined/chuỗi trắng).
 * @param {string | null | undefined} value - Giá trị cần kiểm tra.
 * @returns {boolean} true nếu rỗng sau khi trim; ngược lại false.
 * @example
 * isEmpty('   '); // true
 * isEmpty('abc'); // false
 */
function isEmpty(value) {
    return !value || value.trim().length === 0;
}

/**
 * Kiểm tra định dạng email cơ bản.
 * @param {string} email - Chuỗi email cần kiểm tra.
 * @returns {boolean} true nếu chuỗi khớp mẫu email; ngược lại false.
 * @example
 * isValidEmail('a@b.com'); // true
 * isValidEmail('a@b');     // false
 */
function isValidEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}

/**
 * Kiểm tra số điện thoại Việt Nam theo yêu cầu: 9–12 chữ số.
 * (Không xử lý prefix +84/0 nâng cao; dùng cho bước lọc đầu vào nhanh.)
 * @param {string} phone - Chuỗi số điện thoại cần kiểm tra.
 * @returns {boolean} true nếu hợp lệ; ngược lại false.
 * @example
 * isValidPhone('0912345678'); // true
 * isValidPhone('123');        // false
 */
function isValidPhone(phone) {
    const regex = /^[0-9]{9,12}$/;
    return regex.test(phone);
}

/**
 * Kiểm tra độ mạnh mật khẩu:
 * - Tối thiểu 8 ký tự
 * - Có chữ thường, chữ hoa, chữ số và ký tự đặc biệt
 * @param {string} password - Mật khẩu cần kiểm tra.
 * @returns {boolean} true nếu đạt yêu cầu; ngược lại false.
 * @example
 * isValidPassword('Aa@12345'); // true
 * isValidPassword('abcdefg');  // false
 */
function isValidPassword(password) {
    const regex =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return regex.test(password);
}

/**
 * So khớp mật khẩu và phần xác nhận.
 * @param {string} pw - Mật khẩu.
 * @param {string} confirmPw - Mật khẩu xác nhận.
 * @returns {boolean} true nếu trùng khớp; ngược lại false.
 * @example
 * isPasswordMatch('abc', 'abc'); // true
 */
function isPasswordMatch(pw, confirmPw) {
    return pw === confirmPw;
}

/**
 * Kiểm tra chuỗi đầu vào là email hoặc số điện thoại hợp lệ.
 * @param {string} value - Giá trị cần kiểm tra.
 * @returns {boolean} true nếu là email hoặc số điện thoại hợp lệ; ngược lại false.
 * @example
 * isEmailOrPhone('a@b.com');   // true
 * isEmailOrPhone('0912345678'); // true
 * isEmailOrPhone('abc');        // false
 */
function isEmailOrPhone(value) {
    return isValidEmail(value) || isValidPhone(value);
}

// Export to window (dùng trực tiếp trong JSP/HTML)
window.isEmpty = isEmpty;
window.isValidEmail = isValidEmail;
window.isValidPhone = isValidPhone;
window.isValidPassword = isValidPassword;
window.isPasswordMatch = isPasswordMatch;
window.isEmailOrPhone = isEmailOrPhone;
