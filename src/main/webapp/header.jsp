<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="resources/style.css">

<div class="container row">
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#">Cars</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">About</a></li>

            <li>
                <form class="row g-3" action="controller">
                    <%--                <button type="button" class="btn-large teal lighten-1">Login</button>--%>
                    <%--            <li><input type="submit" class="waves-effect waves-light btn" formmethod="post"--%>
                    <%--                       value="Log in"/></li>--%>
            <li>
                <button type="submit" class="waves-effect waves-light btn" formmethod="post">Log in</button>
                <input type="hidden" name="command" value="logInUser"></li>
            <li><input type="text" name="name" placeholder="  Enter name" onclick="this.value=''" required/></li>
            <li><input type="password" name="pass" placeholder="  Enter password" onclick="this.value=''" required/>
            </li>
            </form>
            </li>
            <li>
                <form class="row" action="register.jsp">
                    <%--                    <input type="submit" class="waves-effect waves-light btn" value="Sign up"/>--%>
                    <button type="submit" class="waves-effect waves-light btn">Sign up</button>
                </form>
            </li>
        </ul>
    </nav>
</div>