package com.dao;

import com.model.Book;
import com.model.Reservation;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public void reserveBook(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (student_name, student_id, book_id, reservation_date) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, reservation.getStudentName());
            stmt.setInt(2, reservation.getStudentId()); // User ID should be INT
            stmt.setInt(3, reservation.getBookId());
            stmt.setTimestamp(4, reservation.getReservationDate());
            stmt.executeUpdate();
        }
    }

    //Get all available books
    public List<Book> getAvailableBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE status = 'Available'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setStatus(rs.getString("status"));
                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    // Get all reservations
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setStudentName(rs.getString("student_name"));
                r.setStudentId(rs.getInt("student_id"));
                r.setBookId(rs.getInt("book_id"));
                r.setReservationDate(rs.getTimestamp("reservation_date"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}