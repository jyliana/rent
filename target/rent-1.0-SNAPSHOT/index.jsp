<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rental cars - Wellcome page</title>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

<%--<form action="hello-form">--%>
<%--    <input name="login">--%>
<%--    <input type="submit" value="Send">--%>
<%--</form>--%>
<%--<hr>--%>
<%--<hr>--%>
<script>
    function isEmail() {
        var str = document.getElementById("email").value;
        var status = document.getElementById("status");
        var re = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i;
        if (re.test(str)) status.innerHTML = "Адрес правильный";
        else status.innerHTML = "Адрес неверный";
        if (isEmpty(str)) status.innerHTML = "Поле пустое";
    }

    function isEmpty(str) {
        return (str == null) || (str.length == 0);
    }
</script>

<form action="process.jsp">
    <h2><%= "Registration:" %>
    </h2>
    <%= "Please enter your credentials: " %><br>
    <input type="text" name="name" value="Name" onclick="this.value=''"/></br>
    <input type="text" name="email" value="Email" onclick="this.value=''"/></br>
    <input type="password" name="pass" value="Password" onclick="this.value=''"/></br>
    <input type="submit" formmethod="post" value="Register"/>
</form>

</body>
</html>