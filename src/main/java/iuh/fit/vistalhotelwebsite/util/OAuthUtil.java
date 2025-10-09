package iuh.fit.vistalhotelwebsite.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import iuh.fit.vistalhotelwebsite.config.OAuthConfig;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

public class OAuthUtil {

    private static final Gson gson = new Gson();

    // GOOGLE OAuth
    // Generate Google OAuth URL
    public static String getGoogleAuthorizationUrl() {
        try {
            URIBuilder builder = new URIBuilder(OAuthConfig.GOOGLE_AUTHORIZATION_URL);
            builder.addParameter("client_id", OAuthConfig.GOOGLE_CLIENT_ID);
            builder.addParameter("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI);
            builder.addParameter("response_type", "code");
            builder.addParameter("scope", OAuthConfig.GOOGLE_SCOPE);
            builder.addParameter("access_type", "offline");
            builder.addParameter("prompt", "consent");
            return builder.build().toString();
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Exchange authorization code for access token (Google)
    public static String getGoogleAccessToken(String code) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpPost post = new HttpPost(OAuthConfig.GOOGLE_TOKEN_URL);

            Map<String, String> params = new HashMap<>();
            params.put("code", code);
            params.put("client_id", OAuthConfig.GOOGLE_CLIENT_ID);
            params.put("client_secret", OAuthConfig.GOOGLE_CLIENT_SECRET);
            params.put("redirect_uri", OAuthConfig.GOOGLE_REDIRECT_URI);
            params.put("grant_type", "authorization_code");

            String json = gson.toJson(params);
            post.setEntity(new StringEntity(json));
            post.setHeader("Content-Type", "application/json");

            HttpResponse response = client.execute(post);
            String responseBody = EntityUtils.toString(response.getEntity());
            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);

            return jsonObject.has("access_token") ? jsonObject.get("access_token").getAsString() : null;
        }
    }

    // Get user info from Google
    public static Map<String, String> getGoogleUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder builder = new URIBuilder(OAuthConfig.GOOGLE_USER_INFO_URL);
            builder.addParameter("access_token", accessToken);

            HttpGet get = new HttpGet(builder.build());
            HttpResponse response = client.execute(get);
            String responseBody = EntityUtils.toString(response.getEntity());

            JsonObject userInfo = gson.fromJson(responseBody, JsonObject.class);

            Map<String, String> userData = new HashMap<>();
            userData.put("id", userInfo.has("id") ? userInfo.get("id").getAsString() : null);
            userData.put("email", userInfo.has("email") ? userInfo.get("email").getAsString() : null);
            userData.put("name", userInfo.has("name") ? userInfo.get("name").getAsString() : null);
            userData.put("picture", userInfo.has("picture") ? userInfo.get("picture").getAsString() : null);
            userData.put("verified_email", userInfo.has("verified_email") ? userInfo.get("verified_email").getAsString() : "false");

            return userData;
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }

    // FACEBOOK OAuth
    // Generate Facebook OAuth URL
    public static String getFacebookAuthorizationUrl() {
        try {
            URIBuilder builder = new URIBuilder(OAuthConfig.FACEBOOK_AUTHORIZATION_URL);
            builder.addParameter("client_id", OAuthConfig.FACEBOOK_APP_ID);
            builder.addParameter("redirect_uri", OAuthConfig.FACEBOOK_REDIRECT_URI);
            builder.addParameter("scope", OAuthConfig.FACEBOOK_SCOPE);
            builder.addParameter("response_type", "code");
            return builder.build().toString();
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Exchange authorization code for access token (Facebook)
    public static String getFacebookAccessToken(String code) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder builder = new URIBuilder(OAuthConfig.FACEBOOK_TOKEN_URL);
            builder.addParameter("client_id", OAuthConfig.FACEBOOK_APP_ID);
            builder.addParameter("client_secret", OAuthConfig.FACEBOOK_APP_SECRET);
            builder.addParameter("redirect_uri", OAuthConfig.FACEBOOK_REDIRECT_URI);
            builder.addParameter("code", code);

            HttpGet get = new HttpGet(builder.build());
            HttpResponse response = client.execute(get);
            String responseBody = EntityUtils.toString(response.getEntity());

            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
            return jsonObject.has("access_token") ? jsonObject.get("access_token").getAsString() : null;
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Get user info from Facebook
    public static Map<String, String> getFacebookUserInfo(String accessToken) throws IOException {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            URIBuilder builder = new URIBuilder(OAuthConfig.FACEBOOK_USER_INFO_URL);
            builder.addParameter("fields", "id,name,email,picture");
            builder.addParameter("access_token", accessToken);

            HttpGet get = new HttpGet(builder.build());
            HttpResponse response = client.execute(get);
            String responseBody = EntityUtils.toString(response.getEntity());

            JsonObject userInfo = gson.fromJson(responseBody, JsonObject.class);

            Map<String, String> userData = new HashMap<>();
            userData.put("id", userInfo.has("id") ? userInfo.get("id").getAsString() : null);
            userData.put("email", userInfo.has("email") ? userInfo.get("email").getAsString() : null);
            userData.put("name", userInfo.has("name") ? userInfo.get("name").getAsString() : null);

            if (userInfo.has("picture") && userInfo.get("picture").isJsonObject()) {
                JsonObject pictureObj = userInfo.getAsJsonObject("picture");
                if (pictureObj.has("data") && pictureObj.getAsJsonObject("data").has("url")) {
                    userData.put("picture", pictureObj.getAsJsonObject("data").get("url").getAsString());
                }
            }

            return userData;
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }
}