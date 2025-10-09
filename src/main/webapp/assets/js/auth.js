//  Description: Handles UI interactions and form behaviors for
//  authentication pages (login, register, forgot, reset)

// Timer for verification code
let timerInterval;

// Start countdown for verification code (default: 120 seconds)
function startTimer() {
    let timeLeft = 120; // 2 minutes
    const timer = document.getElementById("timer");
    if (!timer) return;

    clearInterval(timerInterval);
    timer.classList.remove("text-red-400");

    timerInterval = setInterval(() => {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = String(timeLeft % 60).padStart(2, "0");
        timer.textContent = `Thời gian còn lại: ${minutes}:${seconds}s`;

        if (timeLeft-- <= 0) {
            clearInterval(timerInterval);
            timer.textContent = "Mã xác nhận đã hết hạn";
            timer.classList.add("text-red-400");
        }
    }, 1000);
}

// Stop countdown timer
function clearTimer() {
    if (timerInterval) clearInterval(timerInterval);
}

// UI Error Handling
// - ID of the input field
// - Error message
function showError(fieldId, message) {
    const input = document.getElementById(fieldId);
    const errorSpan = document.getElementById(fieldId + "Error");

    if (input) {
        input.classList.add("error", "!border-red-500");

        // Restart shake animation
        input.style.animation = "none";
        input.offsetHeight; // force reflow
        input.style.animation = null;
    }

    if (errorSpan) errorSpan.textContent = message;
}

// Clear all error messages and borders
function clearErrors() {
    document.querySelectorAll(".input-field").forEach((i) =>
        i.classList.remove("error", "!border-red-500")
    );
    document.querySelectorAll('[id$="Error"]').forEach((e) => (e.textContent = ""));
}

// Password visibility toggle
function togglePassword(inputId, icon) {
    const input = document.getElementById(inputId);
    if (!input) return;

    const isHidden = input.type === "password";
    input.type = isHidden ? "text" : "password";
    icon.classList.toggle("fa-eye");
    icon.classList.toggle("fa-eye-slash");
}

// Form Validators
function initializeFormListeners() {
    // Login Form
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
        loginForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const email = document.getElementById("email");
            const password = document.getElementById("password");

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

    // Register Form
    const registerForm = document.getElementById("registerForm");
    if (registerForm) {
        registerForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const fullName = document.getElementById("fullName");
            const email = document.getElementById("email");
            const password = document.getElementById("password");
            const confirmPassword = document.getElementById("confirmPassword");

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

    // Forgot Password Form
    const forgotForm = document.getElementById("forgotForm");
    if (forgotForm) {
        forgotForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const emailOrPhone = document.getElementById("forgotEmail");
            const recaptcha = document.getElementById("recaptcha");

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

    // Verify Code Form
    const verifyForm = document.getElementById("verifyForm");
    if (verifyForm) {
        verifyForm.addEventListener("submit", (e) => {
            clearErrors();
            const code = document.getElementById("confirmationCode");

            if (isEmpty(code.value)) {
                e.preventDefault();
                showError("confirmationCode", "Vui lòng nhập mã xác nhận");
            } else if (code.value.length !== 6) {
                e.preventDefault();
                showError("confirmationCode", "Mã xác nhận phải có 6 chữ số");
            }
        });
    }

    // Reset Password Form
    const resetForm = document.getElementById("resetForm");
    if (resetForm) {
        resetForm.addEventListener("submit", (e) => {
            clearErrors();
            let valid = true;

            const newPw = document.getElementById("newPassword");
            const confirmPw = document.getElementById("confirmPassword");

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

    // Clear errors when typing
    document.querySelectorAll(".input-field").forEach((input) => {
        input.addEventListener("input", () => {
            input.classList.remove("error", "!border-red-500");
            const err = document.getElementById(input.id + "Error");
            if (err) err.textContent = "";
        });
    });
}

// Initialize on DOM Ready
document.addEventListener("DOMContentLoaded", () => {
    initializeFormListeners();

    const timer = document.getElementById("timer");
    if (timer) startTimer();
});
