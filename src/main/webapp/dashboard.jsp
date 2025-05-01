<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
        }
        .menu {
            margin: 20px 0;
        }
        .menu a {
            display: inline-block;
            margin-right: 10px;
            padding: 8px 16px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .menu a:hover {
            background-color: #2980b9;
        }
        .logout {
            float: right;
            background-color: #f44336;
        }
        .logout:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Welcome, <%= user.getUsername() %> [<%= user.getRole() %>]</h2>

    <div class="menu">
        <% if ("Student".equals(user.getRole())) { %>
        <a href="searchBook.jsp">Search & Reserve Books</a>
        <% } else if ("Admin".equals(user.getRole())) { %>
        <a href="addBook.jsp">Add Books</a>
        <a href="reservations">View Reservations</a>
        <% } %>
        <a href="logout" class="logout">Logout</a>
    </div>
</div>
</body>
</html>
