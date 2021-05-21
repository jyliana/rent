<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.User" %>
<%@ page import="com.example.rent.db.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet"href="resources/style.css" >
</head>
<body>
<nav>
    <div class="container">
        <a href="#" class="brand-logo">Admin panel</a>
        <ul class="right hide-on-med-and-down">
            <li><a href=""><i class="material-icons">notifications</i> </a></li>
            <li><a href=""><i class="material-icons">settings</i> </a></li>
            <li><a href=""><i class="material-icons">person</i> </a></li>
        </ul>

    </div>
</nav>
Hi, <% String name = (String) session.getAttribute("name"); %>
<%=name %>

<ul>
    <%
        List<User> users = UserDao.findAllUsers();
        if (users != null && !users.isEmpty()) {
            for (User login : users) {
                out.println("<li>" + login.getId() + " " + login.getLogin() + "</li>");
            }
        }
    %>
</ul>

</body>
</html>
