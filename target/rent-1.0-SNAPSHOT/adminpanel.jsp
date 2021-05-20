<%--
  Created by IntelliJ IDEA.
  User: miled
  Date: 5/20/2021
  Time: 11:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin panel</title>
</head>
<body>
Hi, <% String name = (String) session.getAttribute("name"); %>
<%=name %>
</body>
</html>
