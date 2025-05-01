package com.controller;

import com.dao.BookDAO;
import com.model.Book;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/addBook")
public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");

        // ✅ Server-side validation
        if (title == null || title.trim().isEmpty() || author == null || author.trim().isEmpty()) {
            request.setAttribute("error", "Title and Author are required.");
            request.getRequestDispatcher("addBook.jsp").forward(request, response);
            return;
        }

        // Save the book
        Book book = new Book();
        book.setTitle(title.trim());
        book.setAuthor(author.trim());
        book.setStatus("Available");

        BookDAO dao = new BookDAO();
        dao.addBook(book);

        response.sendRedirect("dashboard.jsp");
    }
}
