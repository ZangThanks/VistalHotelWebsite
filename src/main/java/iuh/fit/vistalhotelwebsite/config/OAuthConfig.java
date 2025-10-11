package iuh.fit.vistalhotelwebsite.config;

import jakarta.servlet.ServletContext;
import java.io.InputStream;
import java.util.Properties;

public class OAuthConfig {
    private static ServletContext ctx;
    private static final Properties props = new Properties();
    private static boolean loaded = false;

    public static void init(ServletContext servletContext) {
        ctx = servletContext;
        loadProps();
    }

    private static synchronized void loadProps() {
        if (loaded) return;
        try (InputStream in = OAuthConfig.class.getClassLoader()
                .getResourceAsStream("oauth.properties")) {
            if (in != null) props.load(in);
        } catch (Exception ignored) {}
        loaded = true;
    }

    private static String fromProps(String key) {
        loadProps();
        String v = props.getProperty(key);
        return (v != null && !v.isBlank()) ? v : null;
    }

    // Prioritize: ENV -> -D system property -> web.xml -> oauth.properties -> default
    public static String env(String key, String def) {
        String v = System.getenv(key);
        if (v != null && !v.isBlank()) return v;
        v = System.getProperty(key); // support -DKEY=VALUE (Tomcat Monitor/IDE)
        if (v != null && !v.isBlank()) return v;
        if (ctx != null) {
            String p = ctx.getInitParameter(key);
            if (p != null && !p.isBlank()) return p;
        }
        v = fromProps(key);
        return v != null ? v : def;
    }

    // GOOGLE
    public static String GOOGLE_CLIENT_ID()     { return env("GOOGLE_CLIENT_ID", ""); }
    public static String GOOGLE_CLIENT_SECRET() { return env("GOOGLE_CLIENT_SECRET", ""); }
    public static String GOOGLE_REDIRECT_URI()  { return env("GOOGLE_REDIRECT_URI", "http://localhost:8080/vista-hotel/google-callback"); }
    public static String GOOGLE_AUTH_URL()      { return "https://accounts.google.com/o/oauth2/v2/auth"; }
    public static String GOOGLE_TOKEN_URL()     { return "https://oauth2.googleapis.com/token"; }
    public static String GOOGLE_USERINFO_URL()  { return "https://www.googleapis.com/oauth2/v3/userinfo"; }
    public static String GOOGLE_SCOPE()         { return "openid email profile"; }

    // FACEBOOK
    public static String FB_APP_ID()            { return env("FACEBOOK_APP_ID", ""); }
    public static String FB_APP_SECRET()        { return env("FACEBOOK_APP_SECRET", ""); }
    public static String FB_REDIRECT_URI()      { return env("FACEBOOK_REDIRECT_URI", "http://localhost:8080/vista-hotel/facebook-callback"); }
    public static String FB_AUTH_URL()          { return "https://www.facebook.com/v24.0/dialog/oauth"; }
    public static String FB_TOKEN_URL()         { return "https://graph.facebook.com/v24.0/oauth/access_token"; }
    public static String FB_USERINFO_URL()      { return "https://graph.facebook.com/v24.0/me"; }
    public static String FB_SCOPE()             { return "email,public_profile"; }
}
