package com.controller;

import com.dao.ReservationDAO;
import com.model.Reservation;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/reservations")
public class ReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session and check user role
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"Admin".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get all reservations
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> reservations = dao.getAllReservations();

            // Pass to JSP
            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("viewReservations.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
