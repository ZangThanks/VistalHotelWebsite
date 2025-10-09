package iuh.fit.vistalhotelwebsite.config;

public class OAuthConfig {

    // Google OAuth Configuration
    public static final String GOOGLE_CLIENT_ID = "YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com";
    public static final String GOOGLE_CLIENT_SECRET = "YOUR_GOOGLE_CLIENT_SECRET";
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/vista-hotel/google-callback";
    public static final String GOOGLE_AUTHORIZATION_URL = "https://accounts.google.com/o/oauth2/v2/auth";
    public static final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
    public static final String GOOGLE_USER_INFO_URL = "https://www.googleapis.com/oauth2/v2/userinfo";
    public static final String GOOGLE_SCOPE = "openid email profile";

    // Facebook OAuth Configuration
    public static final String FACEBOOK_APP_ID = "YOUR_FACEBOOK_APP_ID";
    public static final String FACEBOOK_APP_SECRET = "YOUR_FACEBOOK_APP_SECRET";
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8080/vista-hotel/facebook-callback";
    public static final String FACEBOOK_AUTHORIZATION_URL = "https://www.facebook.com/v18.0/dialog/oauth";
    public static final String FACEBOOK_TOKEN_URL = "https://graph.facebook.com/v18.0/oauth/access_token";
    public static final String FACEBOOK_USER_INFO_URL = "https://graph.facebook.com/me";
    public static final String FACEBOOK_SCOPE = "email,public_profile";
}
