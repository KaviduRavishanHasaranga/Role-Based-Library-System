<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Available Books</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Available Books</h1>
    <table class="book-list">
        <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td class="status-${book.status eq 'Available' ? 'available' : 'reserved'}">
                        ${book.status}
                </td>
                <td>
                    <c:if test="${book.status == 'Available'}">
                        <a href="reserveForm.jsp?bookId=${book.id}" class="btn">Reserve</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="nav-links">
        <a href="searchBook.jsp">Back to Search</a>
    </div>
</div>
</body>
</html>