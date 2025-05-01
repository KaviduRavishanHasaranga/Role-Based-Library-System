<%@ page import="com.model.User" %>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<div class="message"><%= error %></div>
<% } %>

<link rel="stylesheet" href="style.css">
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<h2>Add New Book</h2>
<form name="bookForm" onsubmit="return validateBookForm()" action="addBook" method="post">
    Title: <input type="text" name="title" required /><br/>
    Author: <input type="text" name="author" required /><br/>
    <input type="submit" value="Add Book" />
</form>