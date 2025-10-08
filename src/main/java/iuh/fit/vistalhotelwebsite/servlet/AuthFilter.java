package iuh.fit.vistalhotelwebsite.servlet;

import iuh.fit.vistalhotelwebsite.model.User;
import iuh.fit.vistalhotelwebsite.model.enums.UserRole;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({"/views/customer/*", "/views/information/*", "/views/admin/*"})
public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession(false);
        User currentUser = session != null ? (User) session.getAttribute("currentUser") : null;

        String uri = req.getRequestURI();

        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        UserRole role = currentUser.getUserRole();

        boolean accessingAdminArea = uri.contains("/views/information/") || uri.contains("/views/admin/");
        boolean accessingCustomerArea = uri.contains("/views/customer/");

        if (accessingAdminArea && !(role == UserRole.ADMIN || role == UserRole.EMPLOYEE)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        if (accessingCustomerArea && !(role == UserRole.CUSTOMER)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
