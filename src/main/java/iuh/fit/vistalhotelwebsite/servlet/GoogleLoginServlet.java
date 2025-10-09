package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.util.OAuthUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/google-login")
public class GoogleLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String authUrl = OAuthUtil.getGoogleAuthorizationUrl();
        if (authUrl != null) {
            resp.sendRedirect(authUrl);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login?error=oauth_config_error");
        }
    }
}
