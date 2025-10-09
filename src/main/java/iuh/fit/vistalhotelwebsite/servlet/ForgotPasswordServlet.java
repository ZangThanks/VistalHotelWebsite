package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.dao.*;
import iuh.fit.vistalhotelwebsite.model.*;
import iuh.fit.vistalhotelwebsite.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Random;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private AdminDAO adminDAO;
    private EmployeeDAO employeeDAO;
    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
        employeeDAO = new EmployeeDAO();
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);

        // Handle resend action
        if ("resend".equals(action) && session != null) {
            handleResendCode(req, resp, session);
            return;
        }

        req.setAttribute("step", "send");
        req.getRequestDispatcher("/views/auth/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        HttpSession session = req.getSession();

        if ("send".equals(action)) {
            handleSendCode(req, resp, session);
        } else if ("verify".equals(action)) {
            handleVerifyCode(req, resp, session);
        } else {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
        }
    }

    // Step 1: Send Code
    private void handleSendCode(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {

        String emailOrPhone = req.getParameter("emailOrPhone");

        if (ValidationUtil.isNullOrEmpty(emailOrPhone)) {
            forwardError(req, resp, "Vui lòng nhập email hoặc số điện thoại hợp lệ.", "send");
            return;
        }

        boolean isEmail = ValidationUtil.isValidEmail(emailOrPhone);
        boolean isPhone = ValidationUtil.isValidPhone(emailOrPhone);

        if (!isEmail && !isPhone) {
            forwardError(req, resp, "Định dạng email hoặc số điện thoại không hợp lệ.", "send");
            return;
        }

        User foundUser = findUserByEmailOrPhone(emailOrPhone);
        if (foundUser == null) {
            forwardError(req, resp, "Không tìm thấy tài khoản với thông tin: " + emailOrPhone, "send");
            return;
        }

        // Generate 6-digit code
        String code = String.format("%06d", new Random().nextInt(999999));
        System.out.println("[DEBUG] Mã xác nhận gửi đến " + emailOrPhone + ": " + code);

        // Save to session
        session.setAttribute("verifyCode", code);
        session.setAttribute("verifyEmail", emailOrPhone);
        session.setAttribute("verifyUser", foundUser);
        session.setAttribute("codeTimestamp", System.currentTimeMillis());

        req.setAttribute("success", "Mã xác nhận đã được gửi đến " + emailOrPhone);
        req.setAttribute("step", "verify");
        req.setAttribute("resetTimer", true); // Trigger timer reset
        req.getRequestDispatcher("/views/auth/forgot-password.jsp").forward(req, resp);
    }

    // Resend Code
    private void handleResendCode(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {

        String emailOrPhone = (String) session.getAttribute("verifyEmail");
        User foundUser = (User) session.getAttribute("verifyUser");

        if (emailOrPhone == null || foundUser == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        // Generate new code
        String code = String.format("%06d", new Random().nextInt(999999));
        System.out.println("[DEBUG] Mã xác nhận MỚI gửi đến " + emailOrPhone + ": " + code);

        // Update session
        session.setAttribute("verifyCode", code);
        session.setAttribute("codeTimestamp", System.currentTimeMillis());

        req.setAttribute("success", "Mã xác nhận mới đã được gửi lại đến " + emailOrPhone);
        req.setAttribute("step", "verify");
        req.setAttribute("resetTimer", true); // Trigger timer reset
        req.getRequestDispatcher("/views/auth/forgot-password.jsp").forward(req, resp);
    }

    // Step 2: Verify Code
    private void handleVerifyCode(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {

        String inputCode = req.getParameter("confirmationCode");
        String realCode = (String) session.getAttribute("verifyCode");
        Long timestamp = (Long) session.getAttribute("codeTimestamp");

        if (ValidationUtil.isNullOrEmpty(inputCode)) {
            forwardError(req, resp, "Vui lòng nhập mã xác nhận.", "verify");
            return;
        }

        // Check if code expired (2 minutes = 120000 ms)
        if (timestamp != null && (System.currentTimeMillis() - timestamp) > 120000) {
            forwardError(req, resp, "Mã xác nhận đã hết hạn. Vui lòng gửi lại mã mới.", "verify");
            return;
        }

        if (realCode != null && inputCode.trim().equals(realCode)) {
            resp.sendRedirect(req.getContextPath() + "/reset-password");
        } else {
            forwardError(req, resp, "Mã xác nhận không đúng.", "verify");
        }
    }

    // Find user
    private User findUserByEmailOrPhone(String emailOrPhone) {
        if (ValidationUtil.isValidEmail(emailOrPhone)) {
            User user = adminDAO.findByEmail(emailOrPhone);
            if (user == null) user = employeeDAO.findByEmail(emailOrPhone);
            if (user == null) user = customerDAO.findByEmail(emailOrPhone);
            return user;
        }
        if (ValidationUtil.isValidPhone(emailOrPhone)) {
            User user = adminDAO.findByPhone(emailOrPhone);
            if (user == null) user = employeeDAO.findByPhone(emailOrPhone);
            if (user == null) user = customerDAO.findByPhone(emailOrPhone);
            return user;
        }
        return null;
    }

    // Forward error messages
    private void forwardError(HttpServletRequest req, HttpServletResponse resp, String message, String step)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        req.setAttribute("step", step);
        req.getRequestDispatcher("/views/auth/forgot-password.jsp").forward(req, resp);
    }
}