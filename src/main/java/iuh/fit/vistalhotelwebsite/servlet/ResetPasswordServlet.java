package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.dao.*;
import iuh.fit.vistalhotelwebsite.model.*;
import iuh.fit.vistalhotelwebsite.service.NotifierService;
import iuh.fit.vistalhotelwebsite.util.PasswordUtil;
import iuh.fit.vistalhotelwebsite.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    private AdminDAO adminDAO;
    private EmployeeDAO employeeDAO;
    private CustomerDAO customerDAO;
    private NotifierService notifier;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
        employeeDAO = new EmployeeDAO();
        customerDAO = new CustomerDAO();
        notifier = (NotifierService) getServletContext().getAttribute("notifier");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/auth/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String newPw = req.getParameter("newPassword");
        String confirmPw = req.getParameter("confirmPassword");

        // Validate input fields
        if (ValidationUtil.isNullOrEmpty(newPw) || ValidationUtil.isNullOrEmpty(confirmPw)) {
            forwardError(req, resp, "Vui lòng nhập đầy đủ thông tin");
            return;
        }

        if (!ValidationUtil.isValidPassword(newPw)) {
            forwardError(req, resp, "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt");
            return;
        }

        if (!newPw.equals(confirmPw)) {
            forwardError(req, resp, "Mật khẩu xác nhận không khớp");
            return;
        }

        // Check session validity
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("verifyUser") == null) {
            forwardError(req, resp, "Phiên xác thực đã hết hạn. Vui lòng thử lại.");
            return;
        }

        User user = (User) session.getAttribute("verifyUser");

        if (user == null) {
            forwardError(req, resp, "Không tìm thấy thông tin người dùng.");
            return;
        }

        // Update password
        String hashed = PasswordUtil.hashPassword(newPw);
        boolean ok = updateUserPassword(user, hashed);

        if (!ok) {
            forwardError(req, resp, "Cập nhật mật khẩu thất bại. Vui lòng thử lại.");
            return;
        }

        // Thông báo đổi mật khẩu
        if (notifier != null) notifier.notifyPasswordChanged(user);

        // Clear session and redirect
        session.invalidate();
        req.setAttribute("success", "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.");
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }

    // Update user password by role
    private boolean updateUserPassword(User user, String hashed) {
        try {
            switch (user.getUserRole()) {
                case ADMIN -> {
                    Admin admin = (Admin) user;
                    admin.setPassword(hashed);
                    return adminDAO.update(admin);
                }
                case EMPLOYEE -> {
                    Employee emp = (Employee) user;
                    emp.setPassword(hashed);
                    return employeeDAO.update(emp);
                }
                case CUSTOMER -> {
                    Customer cus = (Customer) user;
                    cus.setPassword(hashed);
                    return customerDAO.update(cus);
                }
                default -> {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void forwardError(HttpServletRequest req, HttpServletResponse resp, String msg)
            throws ServletException, IOException {
        req.setAttribute("error", msg);
        req.getRequestDispatcher("/views/auth/reset-password.jsp").forward(req, resp);
    }
}
