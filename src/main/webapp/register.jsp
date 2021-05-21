<html>
<head>
    <%@include file="header.jsp" %>
    <title>Sign up page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>

<section id="registerlogin">
    <div class="card z-depth-3">
        <div class="card-panel center teal lighten-1">
            <span class="card-title white-text">Registration:</span>
        </div>
        <form class="form" action="controller">
            <input type="hidden" name="command" value="registrationUser">
            <div class="input-field">
                <input type="text" name="name" onclick="this.value=''" required/></br>
                <label>Name</label>
            </div>
            <div class="input-field">
                <input type="email" name="email" onclick="this.value=''" required/></br>
                <label>Email</label>
            </div>
            <div class="input-field">
                <input type="password" name="pass" onclick="this.value=''" required/></br>
                <label>Password</label>
            </div>
            <div class="center">
                <input type="submit" class="btn-large teal lighten-1" formmethod="post" value="Register"/>
                <p>
                    <a href="index.jsp">Back</a>
            </div>


        </form>
    </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
