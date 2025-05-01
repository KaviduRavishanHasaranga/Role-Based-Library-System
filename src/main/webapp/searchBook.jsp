<%@ page import="java.util.List" %>
<%@ page import="com.model.Book" %>
<%@ page import="com.dao.BookDAO" %>
<%@ page import="com.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    BookDAO dao = new BookDAO();
    List<Book> books = dao.getAvailableBooks();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search & Reserve Books</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function searchBooks() {
            const query = document.getElementById("searchBox").value;
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById("results").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "ajax/liveSearch.jsp?q=" + encodeURIComponent(query), true);
            xhttp.send();
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Available Books</h2>

    <input type="text" id="searchBox" onkeyup="searchBooks()" placeholder="Type to search by title or author..."
           style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 6px; border: 1px solid #ccc;">

    <div id="results">
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
    </div>

    <br/>
    <div class="navbar">
        <a href="dashboard.jsp">Back to Dashboard</a>
        <a href="logout">Logout</a>
    </div>
</div>

</body>
</html>
