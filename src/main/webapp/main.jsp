<%--
  Created by IntelliJ IDEA.
  User: ilapina
  Date: 5/20/2021
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    Hi!
        <% String name = (String)session.getAttribute("name"); %>
        <%=name %>
    have been successfully authorized.
<p>
</body>
</html>
