package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.util.OAuthUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/facebook-login")
public class FacebookLoginServlet extends HttpServlet {
    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(true);
        String url = OAuthUtil.getFacebookAuthorizationUrl(session);
        resp.sendRedirect(url != null ? url : req.getContextPath()+"/login?error=oauth_config_error");
    }
}
