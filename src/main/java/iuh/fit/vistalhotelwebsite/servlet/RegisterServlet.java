package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.dao.CustomerDAO;
import iuh.fit.vistalhotelwebsite.model.Customer;
import iuh.fit.vistalhotelwebsite.model.enums.MemberShipLevel;
import iuh.fit.vistalhotelwebsite.model.enums.UserRole;
import iuh.fit.vistalhotelwebsite.util.GenerateIDUtil;
import iuh.fit.vistalhotelwebsite.util.PasswordUtil;
import iuh.fit.vistalhotelwebsite.util.ValidationUtil;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String fullName = req.getParameter("fullName");
        String emailOrPhone = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (ValidationUtil.isNullOrEmpty(fullName) || ValidationUtil.isNullOrEmpty(emailOrPhone) || ValidationUtil.isNullOrEmpty(password) || ValidationUtil.isNullOrEmpty(confirmPassword)) {
            forwardError(req, resp, "Vui lòng điền đầy đủ thông tin");
            return;
        }

        String email = ValidationUtil.isValidEmail(emailOrPhone) ? emailOrPhone : null;
        String phone = email == null ? emailOrPhone : null;

        if (email != null && !ValidationUtil.isValidEmail(email)) {
            forwardError(req, resp, "Email không hợp lệ! (vd: example@domain.com)");
            return;
        }

        if (phone != null && !ValidationUtil.isValidPhone(phone)) {
            forwardError(req, resp, "Số điện thoại không hợp lệ! (9-12 chữ số)");
            return;
        }

        if (email != null && customerDAO.findByEmail(email) != null) {
            forwardError(req, resp, "Email đã được sử dụng");
            return;
        }
        if (phone != null && customerDAO.findByPhone(phone) != null) {
            forwardError(req, resp, "Số điện thoại đã được sử dụng");
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            forwardError(req, resp, "Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ hoa, chữ thường số và ký tự đặc biệt!");
        }

        if (!password.equals(confirmPassword)) {
            forwardError(req, resp, "Mật khẩu xác nhận không khớp");
            return;
        }

        Customer customer = new Customer();
        customer.setId(GenerateIDUtil.generateId("C", 8));
        customer.setUserName(email != null ? email : phone);
        customer.setFullName(fullName);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setPassword(PasswordUtil.hashPassword(password));
        customer.setAddress("");
        customer.setUserRole(UserRole.CUSTOMER);
        customer.setBirthDate((LocalDate) null);
        customer.setGender(null);
        customer.setLoyaltyPoints(0);
        customer.setMemberShipLevel(MemberShipLevel.BRONZE);

        boolean created = customerDAO.create(customer);
        if (!created) {
            forwardError(req, resp, "Đăng ký thất bại. Vui lòng thử lại");
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/login?registered=1");
    }

    private void forwardError(HttpServletRequest req, HttpServletResponse resp, String message) throws ServletException, IOException {
        req.setAttribute("error", message);
        req.getRequestDispatcher("views/auth/register.jsp").forward(req, resp);
    }
}
