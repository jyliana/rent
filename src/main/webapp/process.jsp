<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@page import="com.example.rent.db.dao.UserDao" %>
<%@ page import="com.example.rent.db.entity.User" %>
<jsp:useBean id="user" class="com.example.rent.db.entity.User"/>

<jsp:setProperty property="*" name="user"/>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    boolean status = UserDao.register(User.createUser(name, email, pass));
    if (status)
        System.out.print("You are successfully registered");

%>
</body>
</html>
