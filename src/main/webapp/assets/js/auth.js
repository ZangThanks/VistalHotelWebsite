/**
 * Handles UI interactions and form behaviors for authentication pages
 * (login, register, forgot password, verify code, reset password).
 *
 * @file auth.js
 * @author Vista
 * @description
 *  - Quản lý hiển thị lỗi/clear lỗi theo input.
 *  - Đếm ngược thời gian hiệu lực mã xác nhận.
 *  - Ràng buộc/validate client-side cho các form.
 */

/** @type {number | undefined} - ID của interval đếm ngược hiện tại. */
let timerInterval;

/**
 * Bắt đầu bộ đếm ngược cho mã xác nhận (mặc định 120 giây).
 * Tự cập nhật text của phần tử có id `timer`. Khi hết thời gian,
 * dừng interval và tô đỏ thông báo.
 *
 * @param {number} [seconds=120] - Số giây đếm ngược.
 * @returns {void}
 */
function startTimer(seconds = 120) {
    let timeLeft = seconds;
    const timer = document.getElementById("timer");
    if (!timer) return;

    clearInterval(timerInterval);
    timer.classList.remove("text-red-400");

    timerInterval = setInterval(() => {
        const minutes = Math.floor(timeLeft / 60);
        const sec = String(timeLeft % 60).padStart(2, "0");
        timer.textContent = `Thời gian còn lại: ${minutes}:${sec}s`;

        if (timeLeft-- <= 0) {
            clearInterval(timerInterval);
            timer.textContent = "Mã xác nhận đã hết hạn";
            timer.classList.add("text-red-400");
        }
    }, 1000);
}

/**
 * Dừng bộ đếm ngược hiện tại (nếu có).
 * @returns {void}
 */
function clearTimer() {
    if (timerInterval) clearInterval(timerInterval);
}

/**
 * Hiển thị lỗi cho một input cụ thể:
 * - Thêm class border đỏ và animation “rung” ngắn.
 * - Gán message vào `<span id="${fieldId}Error">`.
 *
 * @param {string} fieldId - id của input.
 * @param {string} message - thông điệp lỗi cần hiển thị.
 * @returns {void}
 */
function showError(fieldId, message) {
    const input = document.getElementById(fieldId);
    const errorSpan = document.getElementById(fieldId + "Error");

    if (input) {
        input.classList.add("error", "!border-red-500");

        // Restart shake animation
        input.style.animation = "none";
        // Force reflow để reset animation
        // eslint-disable-next-line no-unused-expressions
        input.offsetHeight;
        input.style.animation = null;
    }

    if (errorSpan) errorSpan.textContent = message;
}

/**
 * Xóa toàn bộ thông báo lỗi & viền lỗi trên form hiện tại.
 * (Áp dụng cho các input có class `.input-field` và các span có id kết thúc bằng `Error`.)
 * @returns {void}
 */
function clearErrors() {
    document
        .querySelectorAll(".input-field")
        .forEach((i) => i.classList.remove("error", "!border-red-500"));
    document
        .querySelectorAll('[id$="Error"]')
        .forEach((e) => (e.textContent = ""));
}

/**
 * Bật/tắt hiển thị mật khẩu của một input.
 *
 * @param {string} inputId - id của input type password cần toggle.
 * @param {HTMLElement} icon - phần tử icon (FontAwesome) để đổi class con mắt.
 * @returns {void}
 */
function togglePassword(inputId, icon) {
    const input = document.getElementById(inputId);
    if (!input) return;

    const isHidden = input.type === "password";
    input.type = isHidden ? "text" : "password";
    icon.classList.toggle("fa-eye");
    icon.classList.toggle("fa-eye-slash");
}

/**
 * Gắn listeners validate & submit cho tất cả form trên trang auth.
 * Sử dụng các hàm validation toàn cục được export bởi `validation.js`:
 *  - isEmpty, isEmailOrPhone, isValidPassword, isPasswordMatch
 *
 * @returns {void}
 */
function initializeFormListeners() {
    // ===== Login Form =====
    /** @type {HTMLFormElement | null} */
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
        loginForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const email = /** @type {HTMLInputElement} */ (document.getElementById("email"));
            const password = /** @type {HTMLInputElement} */ (document.getElementById("password"));

            if (isEmpty(email.value)) {
                showError("email", "Vui lòng nhập email hoặc số điện thoại");
                valid = false;
            } else if (!isEmailOrPhone(email.value)) {
                showError("email", "Email hoặc số điện thoại không hợp lệ");
                valid = false;
            }

            if (isEmpty(password.value)) {
                showError("password", "Vui lòng nhập mật khẩu");
                valid = false;
            }

            if (!valid) e.preventDefault();
        });
    }

    // ===== Register Form =====
    /** @type {HTMLFormElement | null} */
    const registerForm = document.getElementById("registerForm");
    if (registerForm) {
        registerForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const fullName = /** @type {HTMLInputElement} */ (document.getElementById("fullName"));
            const email = /** @type {HTMLInputElement} */ (document.getElementById("email"));
            const password = /** @type {HTMLInputElement} */ (document.getElementById("password"));
            const confirmPassword = /** @type {HTMLInputElement} */ (document.getElementById("confirmPassword"));

            if (isEmpty(fullName.value)) {
                showError("fullName", "Vui lòng nhập họ và tên");
                valid = false;
            }

            if (isEmpty(email.value)) {
                showError("email", "Vui lòng nhập email hoặc số điện thoại");
                valid = false;
            } else if (!isEmailOrPhone(email.value)) {
                showError("email", "Email hoặc số điện thoại không hợp lệ");
                valid = false;
            }

            if (isEmpty(password.value)) {
                showError("password", "Vui lòng nhập mật khẩu");
                valid = false;
            } else if (!isValidPassword(password.value)) {
                showError(
                    "password",
                    "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt"
                );
                valid = false;
            }

            if (isEmpty(confirmPassword.value)) {
                showError("confirmPassword", "Vui lòng xác nhận mật khẩu");
                valid = false;
            } else if (!isPasswordMatch(password.value, confirmPassword.value)) {
                showError("confirmPassword", "Mật khẩu xác nhận không khớp");
                valid = false;
            }

            if (!valid) e.preventDefault();
        });
    }

    // ===== Forgot Password Form (Gửi mã) =====
    /** @type {HTMLFormElement | null} */
    const forgotForm = document.getElementById("forgotForm");
    if (forgotForm) {
        forgotForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const emailOrPhone = /** @type {HTMLInputElement} */ (document.getElementById("forgotEmail"));
            const recaptcha = /** @type {HTMLInputElement | null} */ (document.getElementById("recaptcha"));

            if (isEmpty(emailOrPhone.value)) {
                showError("forgotEmail", "Vui lòng nhập email hoặc số điện thoại");
                valid = false;
            } else if (!isEmailOrPhone(emailOrPhone.value)) {
                showError("forgotEmail", "Email hoặc số điện thoại không hợp lệ");
                valid = false;
            }

            if (!recaptcha?.checked) {
                alert("Vui lòng xác nhận bạn không phải người máy");
                valid = false;
            }

            if (!valid) e.preventDefault();
        });
    }

    // ===== Verify Code Form =====
    /** @type {HTMLFormElement | null} */
    const verifyForm = document.getElementById("verifyForm");
    if (verifyForm) {
        verifyForm.addEventListener("submit", (e) => {
            clearErrors();
            const code = /** @type {HTMLInputElement} */ (document.getElementById("confirmationCode"));

            if (isEmpty(code.value)) {
                e.preventDefault();
                showError("confirmationCode", "Vui lòng nhập mã xác nhận");
            } else if (code.value.length !== 6) {
                e.preventDefault();
                showError("confirmationCode", "Mã xác nhận phải có 6 chữ số");
            }
        });
    }

    // ===== Reset Password Form =====
    /** @type {HTMLFormElement | null} */
    const resetForm = document.getElementById("resetForm");
    if (resetForm) {
        resetForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const newPw = /** @type {HTMLInputElement} */ (document.getElementById("newPassword"));
            const confirmPw = /** @type {HTMLInputElement} */ (document.getElementById("confirmPassword"));

            if (isEmpty(newPw.value)) {
                showError("newPassword", "Vui lòng nhập mật khẩu mới");
                valid = false;
            } else if (!isValidPassword(newPw.value)) {
                showError(
                    "newPassword",
                    "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt"
                );
                valid = false;
            }

            if (isEmpty(confirmPw.value)) {
                showError("confirmPassword", "Vui lòng xác nhận mật khẩu");
                valid = false;
            } else if (!isPasswordMatch(newPw.value, confirmPw.value)) {
                showError("confirmPassword", "Mật khẩu xác nhận không khớp");
                valid = false;
            }

            if (!valid) e.preventDefault();
        });
    }

    // Clear lỗi khi người dùng gõ lại
    document.querySelectorAll(".input-field").forEach((input) => {
        input.addEventListener("input", () => {
            input.classList.remove("error", "!border-red-500");
            const err = document.getElementById(input.id + "Error");
            if (err) err.textContent = "";
        });
    });
}

// Khởi tạo sau khi DOM sẵn sàng
document.addEventListener("DOMContentLoaded", () => {
    initializeFormListeners();

    const timer = document.getElementById("timer");
    if (timer) startTimer();
});
