package iuh.fit.vistalhotelwebsite.util;

/**
 * Utility class for validating user input (email, phone, password, etc.)
 * Commonly used across Servlets and Services.
 */
public class ValidationUtil {

    // Check if a string is null or empty
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    // Validate email format
    public static boolean isValidEmail(String email) {
        if (isNullOrEmpty(email)) return false;
        return email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");
    }

    // Validate phone number (Vietnam-style: 9–12 digits)
    public static boolean isValidPhone(String phone) {
        if (isNullOrEmpty(phone)) return false;
        return phone.matches("^[0-9]{9,12}$");
    }

    // Validate password (at least 6 chars, with upper/lower/number)
    public static boolean isValidPassword(String password) {
        if (isNullOrEmpty(password)) return false;

        // At least 8 chars, one uppercase, one lowercase, one digit, one special char
        return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
    }

}
