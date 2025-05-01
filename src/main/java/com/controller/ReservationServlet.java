package com.controller;

import com.dao.ReservationDAO;
import com.model.Reservation;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.sql.SQLException;

@WebServlet(name = "ReservationServlet", value = "/reserve")
public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        com.model.User user = (com.model.User) session.getAttribute("user");
        int studentId = user.getId(); // ✅ Use session-based student ID
        String studentName = request.getParameter("studentName");
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        Reservation reservation = new Reservation();
        reservation.setStudentName(studentName);
        reservation.setStudentId(studentId);
        reservation.setBookId(bookId);
        reservation.setReservationDate(new Timestamp(System.currentTimeMillis()));

        ReservationDAO dao = new ReservationDAO();
        try {
            dao.reserveBook(reservation);
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

