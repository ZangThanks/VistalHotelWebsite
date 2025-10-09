package iuh.fit.vistalhotelwebsite.util;

import org.mindrot.jbcrypt.BCrypt;

public final class PasswordUtil {

    private PasswordUtil() {}

    // Hash a plain text password
    public static String hashPassword(String plainPassword) {
        String salt = BCrypt.gensalt(10);
        return BCrypt.hashpw(plainPassword, salt);
    }

    // Verify a plain text password against a hashed password
    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}



