<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bookId = request.getParameter("bookId");
%>
<html>
<head>
    <title>Reserve Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Reserve Book</h1>
    <form action="reserve" method="post">
        <input type="hidden" name="bookId" value="<%= bookId %>" />

        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required/>

        <input type="submit" value="Reserve"/>
        <a href="searchBook.jsp" class="btn btn-cancel">Cancel</a>
    </form>
</div>
</body>
</html>
