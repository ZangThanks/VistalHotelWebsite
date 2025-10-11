package iuh.fit.vistalhotelwebsite.servlet;

import com.google.gson.JsonObject;
import iuh.fit.vistalhotelwebsite.dao.CustomerDAO;
import iuh.fit.vistalhotelwebsite.model.Customer;
import iuh.fit.vistalhotelwebsite.model.enums.MemberShipLevel;
import iuh.fit.vistalhotelwebsite.model.enums.UserRole;
import iuh.fit.vistalhotelwebsite.service.NotifierService;
import iuh.fit.vistalhotelwebsite.util.GenerateIDUtil;
import iuh.fit.vistalhotelwebsite.util.OAuthUtil;
import iuh.fit.vistalhotelwebsite.util.PasswordUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet("/facebook-callback")
public class FacebookCallbackServlet extends HttpServlet {
    private CustomerDAO customerDAO;
    private NotifierService notifier;

    @Override public void init() {
        customerDAO = new CustomerDAO();
        notifier = (NotifierService) getServletContext().getAttribute("notifier");
    }

    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        String error = req.getParameter("error");
        String state = req.getParameter("state");

        if (error != null) { resp.sendRedirect(req.getContextPath()+"/login?error=access_denied"); return; }
        if (!OAuthUtil.validateState(session, "oauth_fb_state", state)) {
            resp.sendRedirect(req.getContextPath()+"/login?error=invalid_state"); return;
        }
        if (code == null || code.isBlank()) { resp.sendRedirect(req.getContextPath()+"/login?error=invalid_code"); return; }

        try {
            JsonObject tokens = OAuthUtil.getFacebookTokens(code);
            String accessToken = tokens.has("access_token") ? tokens.get("access_token").getAsString() : null;
            if (accessToken == null) { resp.sendRedirect(req.getContextPath()+"/login?error=token_error"); return; }

            Map<String,String> u = OAuthUtil.getFacebookUserInfo(accessToken);
            String email = u.get("email");
            String name  = u.get("name");
            String fid   = u.get("id");
            if (email == null || email.isBlank()) email = "fb_"+fid+"@vista.local";

            boolean isNew = false;

            Customer c = customerDAO.findByEmail(email);
            if (c == null) {
                isNew = true;
                c = new Customer();
                c.setId(GenerateIDUtil.generateId("C", 8));
                c.setUserName(email);
                c.setFullName(name != null ? name : "Facebook User");
                c.setEmail(email);
                c.setPassword(PasswordUtil.hashPassword(UUID.randomUUID().toString()));
                c.setUserRole(UserRole.CUSTOMER);
                c.setMemberShipLevel(MemberShipLevel.BRONZE);
                if (!customerDAO.create(c)) {
                    resp.sendRedirect(req.getContextPath()+"/login?error=registration_failed");
                    return;
                }
            }

            session.setAttribute("currentUser", c);
            session.setAttribute("role", UserRole.CUSTOMER);
            session.setAttribute("loginMethod", "facebook");

            // Gửi thông báo
            if (notifier != null) {
                if (isNew) notifier.sendWelcome(c);
                else notifier.sendWelcomeBack(c);
            }

            resp.sendRedirect(req.getContextPath()+"/views/customer/home.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            resp.sendRedirect(req.getContextPath()+"/login?error=unknown_error");
        }
    }
}
