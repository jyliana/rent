<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rental cars</title>
    <link href="resources/style.css" rel="stylesheet">
</head>
<body>

<form action="controller">
    <h2><%= "Log in:" %>
    </h2>
    <input type="hidden" name="command" value="logInUser">
    <input type="text" name="name" value="Name" placeholder="Enter name" onclick="this.value=''"
           required/></br>
    <input type="password" name="pass" value="Password" placeholder="Enter password" onclick="this.value=''"
           required/></br>
    <input type="submit" formmethod="post" value="Log in"/>

</form>
</br>

Don't have an account?
<form action="register.jsp">
    <button>Sign up</button>
</form>

</body>
</html>