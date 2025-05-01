package com.controller.filter;

import com.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        boolean isAdminPage = uri.contains("addBook.jsp") || uri.contains("viewReservations.jsp");

        if (isAdminPage && (user == null || !"Admin".equals(user.getRole()))) {
            res.sendRedirect("login.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}
