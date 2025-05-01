<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.BookDAO" %>
<%@ page import="com.model.Book" %>
<%@ page import="java.sql.*, com.dao.BookDAO" %>

<%
    String q = request.getParameter("q");
    List<Book> books = new BookDAO().searchBooks(q);
%>

<table border="1">
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Action</th>
    </tr>
    <% for (Book b : books) { %>
    <tr>
        <td><%= b.getTitle() %>
        </td>
        <td><%= b.getAuthor() %>
        </td>
        <td><a href="reserveForm.jsp?bookId=<%= b.getId() %>">Reserve</a></td>
    </tr>
    <% } %>
</table>

