<%@ page import="com.example.rent.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<p>
    User
        <% String name = (String)session.getAttribute("name"); %>
        <%=name %>
    was successfully registered, you can login now.
<p>
<hr>
<a href="index.jsp">Back</a>

</body>
</html>
