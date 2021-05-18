<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="controller">
    <h2><%= "Registration:" %>
    </h2>
    <%= "Please enter your credentials: " %><br>
    <input type="hidden" name="command" value="registrationUser">
    <input type="text" name="name" value="Name" onclick="this.value=''"/></br>
    <input type="text" name="email" value="Email" onclick="this.value=''"/></br>
    <input type="password" name="pass" value="Password" onclick="this.value=''"/></br>
    <input type="submit" formmethod="post" value="Register"/>
</form>
<hr>
<a href="index.jsp">Back</a>

</body>
</html>
