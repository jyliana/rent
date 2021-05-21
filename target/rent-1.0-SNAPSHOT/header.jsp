<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,500,700" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="resources/style.css">
<link rel="icon" href="img/icon.png">

<div class="container row">
    <nav>
        <ul class="left hide-on-med-and-down">
            <li><a href="#">Home</a></li>
            <li><a href="#">Cars</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">About</a></li>

            <li>
                <form action="controller">
                    <%--                <button type="button" class="btn-large teal lighten-1">Login</button>--%>
            <li><input type="submit" class="waves-effect waves-light btn" formmethod="post" value="Log in"/>
                <input type="hidden" name="command" value="logInUser"></li>
            <li><input type="text" name="name" placeholder="  Enter name"
                       onclick="this.value=''"
                       required/></li>
            <li><input type="password" name="pass" placeholder="  Enter password"
                       onclick="this.value=''"
                       required/></li>
            </form></li>

            <li>
                <form action="register.jsp">
                    <input type="submit" class="waves-effect waves-light btn" value="Sign up"/>
                </form>
            </li>
        </ul>
    </nav>
</div>