package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.dao.AdminDAO;
import iuh.fit.vistalhotelwebsite.dao.CustomerDAO;
import iuh.fit.vistalhotelwebsite.dao.EmployeeDAO;
import iuh.fit.vistalhotelwebsite.model.Admin;
import iuh.fit.vistalhotelwebsite.model.Customer;
import iuh.fit.vistalhotelwebsite.model.Employee;
import iuh.fit.vistalhotelwebsite.model.User;
import iuh.fit.vistalhotelwebsite.model.enums.UserRole;
import iuh.fit.vistalhotelwebsite.util.PasswordUtil;
import iuh.fit.vistalhotelwebsite.util.ValidationUtil;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AdminDAO adminDAO;
    private EmployeeDAO employeeDAO;
    private CustomerDAO customerDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        adminDAO = new AdminDAO();
        employeeDAO = new EmployeeDAO();
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("1".equals(req.getParameter("registered"))) {
            req.setAttribute("success", "Đăng ký thành công. Vui lòng đăng nhập.");
        }
        req.getRequestDispatcher("views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String credential = req.getParameter("email");
        String password = req.getParameter("password");

        if (credential != null) credential = credential.trim();
        if (password != null) password = password.trim();

        if (ValidationUtil.isNullOrEmpty(credential) || ValidationUtil.isNullOrEmpty(password)) {
            forwardError(req, resp, "Vui lòng nhập đầy đủ thông tin đăng nhập");
            return;
        }

        String email = ValidationUtil.isValidEmail(credential) ? credential : null;
        String phone = email == null && ValidationUtil.isValidPhone(credential) ? credential : null;
        String userName = (email == null && phone == null) ? credential : null;

        User foundUser = findUser(email, phone, userName);
        boolean verified = foundUser != null && PasswordUtil.verifyPassword(password, foundUser.getPassword());

        if (!verified) {
            forwardError(req, resp, "Thông tin đăng nhập không chính xác");
            return;
        }

        // Set session
        HttpSession session = req.getSession(true);
        session.setAttribute("currentUser", foundUser);
        session.setAttribute("role", foundUser.getUserRole());

        // Redirect by role
        UserRole role = foundUser.getUserRole();
        if (role == UserRole.ADMIN) {
            resp.sendRedirect(req.getContextPath() + "/views/admin/dashboard.jsp");
        } else if (role == UserRole.EMPLOYEE) {
            resp.sendRedirect(req.getContextPath() + "/views/information/InfomationMagager.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/customer/home.jsp");
        }
    }

    private void forwardError(HttpServletRequest req, HttpServletResponse resp, String message) throws ServletException, IOException {
        req.setAttribute("error", message);
        req.getRequestDispatcher("views/auth/login.jsp").forward(req, resp);
    }

    // Find user by email, phone, or username across all roles
    private User findUser(String email, String phone, String userName) {
        // Admin
        Admin admin = null;
        if (email != null) admin = adminDAO.findByEmail(email);
        else if (phone != null) admin = adminDAO.findByPhone(phone);
        else if (userName != null) admin = adminDAO.findByUserName(userName);
        if (admin != null) return admin;

        // Employee
        Employee employee = null;
        if (email != null) employee = employeeDAO.findByEmail(email);
        else if (phone != null) employee = employeeDAO.findByPhone(phone);
        else if (userName != null) employee = employeeDAO.findByUserName(userName);
        if (employee != null) return employee;

        // Customer
        Customer customer = null;
        if (email != null) customer = customerDAO.findByEmail(email);
        else if (phone != null) customer = customerDAO.findByPhone(phone);
        else if (userName != null) customer = customerDAO.findByUserName(userName);
        return customer;
    }
}
