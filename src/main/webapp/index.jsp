<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rental cars - Welcome page</title>
</head>
<body>

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

<form action="controller">
    <h2><%= "Log in:" %>
    </h2>
    <input type="hidden" name="command" value="logInUser">
    <input type="text" name="name" value="Name" onclick="this.value=''"/></br>
    <input type="password" name="pass" value="Password" onclick="this.value=''"/></br>
    <input type="submit" formmethod="post" value="Log in"/>
</form>
</br>

Don't have an account?
<form action="process.jsp">
    <button>Sign up</button>
</form>

</body>
</html>