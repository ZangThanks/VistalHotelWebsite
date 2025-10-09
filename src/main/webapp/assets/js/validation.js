//  Description: Centralized client-side validation logic

// Check if a value is null, undefined, or empty after trimming.
function isEmpty(value) {
    return !value || value.trim().length === 0;
}

// Check if the given string is a valid email format.
function isValidEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}

// Check if the given string is a valid Vietnamese phone number (9–12 digits).
function isValidPhone(phone) {
    const regex = /^[0-9]{9,12}$/;
    return regex.test(phone);
}

// Check if the given string is a strong password:
// - At least 8 characters
// - Contains uppercase, lowercase, digit, and special char
function isValidPassword(password) {
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return regex.test(password);
}

// Check if two passwords match exactly.
function isPasswordMatch(pw, confirmPw) {
    return pw === confirmPw;
}

// Check if an input looks like an email or phone number.
function isEmailOrPhone(value) {
    return isValidEmail(value) || isValidPhone(value);
}

// Export functions
window.isEmpty = isEmpty;
window.isValidEmail = isValidEmail;
window.isValidPhone = isValidPhone;
window.isValidPassword = isValidPassword;
window.isPasswordMatch = isPasswordMatch;
window.isEmailOrPhone = isEmailOrPhone;
