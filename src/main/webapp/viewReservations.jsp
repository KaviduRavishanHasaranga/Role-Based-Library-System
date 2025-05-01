<%@ page import="java.util.List" %>
<%@ page import="com.model.Reservation" %>
<%@ page import="com.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Book Reservations</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h2>All Book Reservations</h2>

    <table border="1">
        <tr>
            <th>Reservation ID</th>
            <th>Student Name</th>
            <th>Student ID</th>
            <th>Book ID</th>
            <th>Reservation Date</th>
        </tr>
        <% if (reservations != null && !reservations.isEmpty()) {
            for (Reservation r : reservations) { %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getStudentName() %></td>
            <td><%= r.getStudentId() %></td>
            <td><%= r.getBookId() %></td>
            <td><%= r.getReservationDate() %></td>
        </tr>
        <% }
        } else { %>
        <tr><td colspan="5">No reservations found.</td></tr>
        <% } %>
    </table>

    <br/>
    <div class="navbar">
        <a href="dashboard.jsp">Back to Dashboard</a>
        <a href="logout">Logout</a>
    </div>
</div>

</body>
</html>
