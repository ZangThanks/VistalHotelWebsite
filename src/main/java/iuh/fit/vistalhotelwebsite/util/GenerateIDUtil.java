package iuh.fit.vistalhotelwebsite.util;

import java.util.UUID;

public class GenerateIDUtil {

    // Generate a unique ID with a given prefix and length
    public static String generateId(String prefix, int length) {
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        return prefix + uuid.substring(0, Math.min(length, uuid.length()));
    }

}
