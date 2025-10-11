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
import org.apache.http.util.EntityUtils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

/**
 * Lớp tiện ích cung cấp các phương thức để xử lý quy trình đăng nhập OAuth 2.0 với Google và Facebook.
 * Bao gồm việc tạo URL ủy quyền, trao đổi mã xác thực để lấy token, và lấy thông tin người dùng từ nhà cung cấp dịch vụ.
 * Lớp này được thiết kế để sử dụng các phương thức tĩnh và không nên được khởi tạo.
 */
public class OAuthUtil {
    private static final Gson gson = new Gson();

    /**
     * Constructor riêng tư để ngăn việc khởi tạo đối tượng của lớp tiện ích này.
     */
    private OAuthUtil() {}

    // PHƯƠNG THỨC HỖ TRỢ CHUNG (COMMON HELPERS)
    /**
     * Tạo một giá trị 'state' ngẫu nhiên, duy nhất và lưu vào session.
     * Giá trị này được dùng để chống lại tấn công Cross-Site Request Forgery (CSRF)
     * bằng cách so sánh giá trị này với tham số 'state' được trả về từ nhà cung cấp OAuth.
     *
     * @param session Đối tượng HttpSession để lưu trữ state.
     * @param key     Khóa (key) để lưu giá trị state trong session.
     * @return Chuỗi state ngẫu nhiên đã được tạo.
     */
    public static String randomState(HttpSession session, String key) {
        String s = UUID.randomUUID().toString();
        session.setAttribute(key, s);
        return s;
    }

    /**
     * Kiểm tra giá trị 'state' nhận về có khớp với giá trị đã lưu trong session hay không.
     * Sau khi kiểm tra, giá trị state sẽ bị xóa khỏi session để đảm bảo nó chỉ được sử dụng một lần.
     *
     * @param session  Đối tượng HttpSession chứa state đã lưu.
     * @param key      Khóa (key) của giá trị state trong session.
     * @param incoming Giá trị state nhận về từ callback của nhà cung cấp OAuth.
     * @return {@code true} nếu state hợp lệ và khớp, ngược lại là {@code false}.
     */
    public static boolean validateState(HttpSession session, String key, String incoming) {
        Object saved = session.getAttribute(key);
        session.removeAttribute(key);
        return saved != null && saved.equals(incoming);
    }

    /**
     * Mã hóa một mảng byte thành chuỗi Base64 URL-safe (không có padding).
     *
     * @param bytes Mảng byte cần mã hóa.
     * @return Chuỗi đã được mã hóa Base64 an toàn cho URL.
     */
    private static String base64Url(byte[] bytes) {
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

    /**
     * Tạo mã 'code_challenge' từ 'code_verifier' bằng thuật toán SHA-256 theo chuẩn PKCE.
     * PKCE (Proof Key for Code Exchange) là một cơ chế bảo mật bổ sung để ngăn chặn tấn công
     * đánh cắp mã ủy quyền (authorization code interception).
     *
     * @param verifier Chuỗi {@code code_verifier} ngẫu nhiên, có độ dài cao.
     * @return Chuỗi {@code code_challenge} đã được mã hóa, hoặc {@code null} nếu có lỗi.
     */
    public static String codeChallengeS256(String verifier) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(verifier.getBytes(StandardCharsets.US_ASCII));
            return base64Url(digest);
        } catch (Exception e) {
            return null;
        }
    }

    // TÍCH HỢP VỚI GOOGLE (GOOGLE INTEGRATION)
    /**
     * Xây dựng URL ủy quyền của Google để bắt đầu quy trình đăng nhập.
     *
     * @param session       Đối tượng HttpSession để tạo và lưu 'state'.
     * @param codeChallenge Mã {@code code_challenge} cho cơ chế PKCE (có thể là {@code null}).
     * @return URL hoàn chỉnh để chuyển hướng người dùng đến trang đăng nhập Google, hoặc {@code null} nếu có lỗi.
     */
    public static String getGoogleAuthorizationUrl(HttpSession session, String codeChallenge) {
        try {
            URIBuilder b = new URIBuilder(OAuthConfig.GOOGLE_AUTH_URL());
            b.addParameter("client_id", OAuthConfig.GOOGLE_CLIENT_ID());
            b.addParameter("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI());
            b.addParameter("response_type", "code");
            b.addParameter("scope", OAuthConfig.GOOGLE_SCOPE());
            b.addParameter("access_type", "offline"); // Yêu cầu refresh token
            b.addParameter("prompt", "consent"); // Luôn hiển thị màn hình chấp thuận
            b.addParameter("state", randomState(session, "oauth_google_state"));
            if (codeChallenge != null) {
                b.addParameter("code_challenge", codeChallenge);
                b.addParameter("code_challenge_method", "S256");
            }
            return b.build().toString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Gửi yêu cầu đến Google để trao đổi 'authorization code' lấy access token và refresh token.
     *
     * @param code         Mã ủy quyền nhận được từ Google sau khi người dùng đăng nhập thành công.
     * @param codeVerifier Mã {@code code_verifier} tương ứng với {@code code_challenge} đã gửi trước đó (nếu có).
     * @return Đối tượng JsonObject chứa các token (access_token, refresh_token, id_token, ...).
     * @throws IOException Nếu có lỗi mạng hoặc lỗi I/O xảy ra trong quá trình thực hiện yêu cầu.
     */
    public static JsonObject getGoogleTokens(String code, String codeVerifier) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpPost post = new HttpPost(OAuthConfig.GOOGLE_TOKEN_URL());
            List<BasicNameValuePair> form = new ArrayList<>();
            form.add(new BasicNameValuePair("code", code));
            form.add(new BasicNameValuePair("client_id", OAuthConfig.GOOGLE_CLIENT_ID()));
            form.add(new BasicNameValuePair("client_secret", OAuthConfig.GOOGLE_CLIENT_SECRET()));
            form.add(new BasicNameValuePair("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI()));
            form.add(new BasicNameValuePair("grant_type", "authorization_code"));
            if (codeVerifier != null) {
                form.add(new BasicNameValuePair("code_verifier", codeVerifier));
            }
            post.setEntity(new UrlEncodedFormEntity(form, StandardCharsets.UTF_8));
            HttpResponse res = client.execute(post);
            return gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
        }
    }

    /**
     * Lấy thông tin cơ bản của người dùng từ Google bằng access token.
     *
     * @param accessToken Access token hợp lệ nhận được từ {@link #getGoogleTokens(String, String)}.
     * @return Một {@code Map<String, String>} chứa thông tin người dùng (sub, email, name, picture, email_verified).
     * @throws IOException Nếu có lỗi mạng hoặc lỗi I/O xảy ra.
     */
    public static Map<String, String> getGoogleUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpGet get = new HttpGet(OAuthConfig.GOOGLE_USERINFO_URL());
            get.setHeader("Authorization", "Bearer " + accessToken);
            HttpResponse res = client.execute(get);
            JsonObject u = gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
            Map<String, String> data = new HashMap<>();
            data.put("sub", u.has("sub") ? u.get("sub").getAsString() : null);
            data.put("email", u.has("email") ? u.get("email").getAsString() : null);
            data.put("name", u.has("name") ? u.get("name").getAsString() : null);
            data.put("picture", u.has("picture") ? u.get("picture").getAsString() : null);
            data.put("email_verified", u.has("email_verified") ? String.valueOf(u.get("email_verified").getAsBoolean()) : null);
            return data;
        }
    }

    // TÍCH HỢP VỚI FACEBOOK (FACEBOOK INTEGRATION)
    /**
     * Xây dựng URL ủy quyền của Facebook để bắt đầu quy trình đăng nhập.
     *
     * @param session Đối tượng HttpSession để tạo và lưu 'state'.
     * @return URL hoàn chỉnh để chuyển hướng người dùng đến trang đăng nhập Facebook, hoặc {@code null} nếu có lỗi.
     */
    public static String getFacebookAuthorizationUrl(HttpSession session) {
        try {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_AUTH_URL());
            b.addParameter("client_id", OAuthConfig.FB_APP_ID());
            b.addParameter("redirect_uri", OAuthConfig.FB_REDIRECT_URI());
            b.addParameter("scope", OAuthConfig.FB_SCOPE());
            b.addParameter("response_type", "code");
            b.addParameter("state", randomState(session, "oauth_fb_state"));
            return b.build().toString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Gửi yêu cầu đến Facebook để trao đổi 'authorization code' lấy access token.
     *
     * @param code Mã ủy quyền nhận được từ Facebook sau khi người dùng đăng nhập thành công.
     * @return Đối tượng JsonObject chứa token (access_token, token_type, expires_in).
     * @throws IOException Nếu có lỗi mạng, I/O, hoặc lỗi cú pháp URI xảy ra.
     */
    public static JsonObject getFacebookTokens(String code) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_TOKEN_URL());
            b.addParameter("client_id", OAuthConfig.FB_APP_ID());
            b.addParameter("client_secret", OAuthConfig.FB_APP_SECRET());
            b.addParameter("redirect_uri", OAuthConfig.FB_REDIRECT_URI());
            b.addParameter("code", code);
            HttpResponse res = client.execute(new HttpGet(b.build()));
            return gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);
        } catch (URISyntaxException e) {
            throw new IOException(e);
        }
    }

    /**
     * Tạo chuỗi 'appsecret_proof' để tăng cường bảo mật cho các lời gọi API Facebook.
     * Đây là mã HMAC-SHA256 của access token, sử dụng App Secret làm khóa.
     * Nó chứng minh rằng lời gọi API đến từ một máy chủ đáng tin cậy.
     *
     * @param accessToken Access token của người dùng.
     * @return Chuỗi {@code appsecret_proof} đã được mã hóa, hoặc {@code null} nếu có lỗi.
     */
    private static String appsecretProof(String accessToken) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA256");
            hmac.init(new SecretKeySpec(OAuthConfig.FB_APP_SECRET().getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
            byte[] raw = hmac.doFinal(accessToken.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : raw) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Lấy thông tin cơ bản của người dùng từ Facebook bằng access token.
     *
     * @param accessToken Access token hợp lệ nhận được từ {@link #getFacebookTokens(String)}.
     * @return Một {@code Map<String, String>} chứa thông tin người dùng (id, name, email, picture).
     * @throws IOException Nếu có lỗi mạng, I/O, hoặc lỗi cú pháp URI xảy ra.
     */
    public static Map<String, String> getFacebookUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder b = new URIBuilder(OAuthConfig.FB_USERINFO_URL());
            b.addParameter("fields", "id,name,email,picture.type(large)");
            b.addParameter("access_token", accessToken);
            String proof = appsecretProof(accessToken);
            if (proof != null) {
                b.addParameter("appsecret_proof", proof);
            }
            HttpResponse res = client.execute(new HttpGet(b.build()));
            JsonObject u = gson.fromJson(EntityUtils.toString(res.getEntity()), JsonObject.class);

            Map<String, String> data = new HashMap<>();
            data.put("id", u.has("id") ? u.get("id").getAsString() : null);
            data.put("email", u.has("email") ? u.get("email").getAsString() : null);
            data.put("name", u.has("name") ? u.get("name").getAsString() : null);

            // Xử lý cấu trúc JSON lồng nhau của ảnh đại diện
            if (u.has("picture") && u.get("picture").isJsonObject()) {
                JsonObject pic = u.getAsJsonObject("picture");
                if (pic.has("data") && pic.get("data").isJsonObject() && pic.getAsJsonObject("data").has("url")) {
                    data.put("picture", pic.getAsJsonObject("data").get("url").getAsString());
                }
            }
            return data;
        } catch (URISyntaxException e) {
            throw new IOException(e);
        }
    }
}