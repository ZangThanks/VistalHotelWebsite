package iuh.fit.vistalhotelwebsite.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import iuh.fit.vistalhotelwebsite.config.OAuthConfig;
import jakarta.servlet.http.HttpSession;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;


import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

public class OAuthUtil {
    private static final Gson gson = new Gson();

    // Common helpers
    public static String randomState(HttpSession session, String key) {
        String s = UUID.randomUUID().toString();
        session.setAttribute(key, s);
        return s;
    }
    public static boolean validateState(HttpSession session, String key, String incoming) {
        Object saved = session.getAttribute(key);
        session.removeAttribute(key);
        return saved != null && saved.equals(incoming);
    }
    private static String base64Url(byte[] bytes) {
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
    public static String codeChallengeS256(String verifier) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return base64Url(md.digest(verifier.getBytes(StandardCharsets.US_ASCII)));
        } catch (Exception e) { return null; }
    }

    // Google
    public static String getGoogleAuthorizationUrl(HttpSession session, String codeChallenge) {
        try {
            URIBuilder b = new URIBuilder(OAuthConfig.GOOGLE_AUTH_URL());
            b.addParameter("client_id", OAuthConfig.GOOGLE_CLIENT_ID());
            b.addParameter("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI());
            b.addParameter("response_type", "code");
            b.addParameter("scope", OAuthConfig.GOOGLE_SCOPE());
            b.addParameter("access_type", "offline");
            b.addParameter("prompt", "consent");
            b.addParameter("state", randomState(session, "oauth_google_state"));
            if (codeChallenge != null) {
                b.addParameter("code_challenge", codeChallenge);
                b.addParameter("code_challenge_method", "S256");
            }
            return b.build().toString();
        } catch (Exception e) { return null; }
    }

    public static JsonObject getGoogleTokens(String code, String codeVerifier) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpPost post = new HttpPost(OAuthConfig.GOOGLE_TOKEN_URL());
            List<BasicNameValuePair> form = new ArrayList<>();
            form.add(new BasicNameValuePair("code", code));
            form.add(new BasicNameValuePair("client_id", OAuthConfig.GOOGLE_CLIENT_ID()));
            form.add(new BasicNameValuePair("client_secret", OAuthConfig.GOOGLE_CLIENT_SECRET()));
            form.add(new BasicNameValuePair("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI()));
            form.add(new BasicNameValuePair("grant_type", "authorization_code"));
            if (codeVerifier != null) form.add(new BasicNameValuePair("code_verifier", codeVerifier));
            post.setEntity(new UrlEncodedFormEntity(form, StandardCharsets.UTF_8));
            HttpResponse res = client.execute(post);
            return gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
        }
    }

    public static Map<String, String> getGoogleUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpGet get = new HttpGet(OAuthConfig.GOOGLE_USERINFO_URL());
            get.setHeader("Authorization", "Bearer " + accessToken);
            HttpResponse res = client.execute(get);
            JsonObject u = gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
            Map<String,String> data = new HashMap<>();
            data.put("sub", u.has("sub") ? u.get("sub").getAsString() : null);
            data.put("email", u.has("email") ? u.get("email").getAsString() : null);
            data.put("name", u.has("name") ? u.get("name").getAsString() : null);
            data.put("picture", u.has("picture") ? u.get("picture").getAsString() : null);
            data.put("email_verified", u.has("email_verified") ? String.valueOf(u.get("email_verified").getAsBoolean()) : null);
            return data;
        }
    }

    // Facebook
    public static String getFacebookAuthorizationUrl(HttpSession session) {
        try {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_AUTH_URL());
            b.addParameter("client_id", OAuthConfig.FB_APP_ID());
            b.addParameter("redirect_uri", OAuthConfig.FB_REDIRECT_URI());
            b.addParameter("scope", OAuthConfig.FB_SCOPE());
            b.addParameter("response_type", "code");
            b.addParameter("state", randomState(session, "oauth_fb_state"));
            return b.build().toString();
        } catch (Exception e) { return null; }
    }

    public static JsonObject getFacebookTokens(String code) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_TOKEN_URL());
            b.addParameter("client_id", OAuthConfig.FB_APP_ID());
            b.addParameter("client_secret", OAuthConfig.FB_APP_SECRET());
            b.addParameter("redirect_uri", OAuthConfig.FB_REDIRECT_URI());
            b.addParameter("code", code);
            HttpResponse res = client.execute(new HttpGet(b.build()));
            return gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
        } catch (URISyntaxException e) { throw new IOException(e); }
    }

    private static String appsecretProof(String accessToken) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA256");
            hmac.init(new SecretKeySpec(OAuthConfig.FB_APP_SECRET().getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
            byte[] raw = hmac.doFinal(accessToken.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : raw) sb.append(String.format("%02x", b));
            return sb.toString();
        } catch (Exception e) { return null; }
    }

    public static Map<String, String> getFacebookUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_USERINFO_URL());
            b.addParameter("fields", "id,name,email,picture.type(large)");
            b.addParameter("access_token", accessToken);
            String proof = appsecretProof(accessToken);
            if (proof != null) b.addParameter("appsecret_proof", proof);
            HttpResponse res = client.execute(new HttpGet(b.build()));
            JsonObject u = gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);

            Map<String,String> data = new HashMap<>();
            data.put("id", u.has("id") ? u.get("id").getAsString() : null);
            data.put("email", u.has("email") ? u.get("email").getAsString() : null);
            data.put("name", u.has("name") ? u.get("name").getAsString() : null);
            if (u.has("picture") && u.get("picture").isJsonObject()) {
                JsonObject pic = u.getAsJsonObject("picture");
                if (pic.has("data") && pic.getAsJsonObject("data").has("url")) {
                    data.put("picture", pic.getAsJsonObject("data").get("url").getAsString());
                }
            }
            return data;
        } catch (URISyntaxException e) { throw new IOException(e); }
    }
}
