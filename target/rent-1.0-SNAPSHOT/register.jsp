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
                <input type="text" name="name" placeholder="Name" onclick="this.value=''" required/></br>
            </div>
            <div class="input-field">
                <input type="email" name="email" placeholder="Email" onclick="this.value=''" required/></br>
            </div>
            <div class="input-field">
                <input type="password" name="pass" placeholder="Password" onclick="this.value=''" required/></br>
            </div>
            <div class="center">
                <input type="submit" class="btn-large teal lighten-1" formmethod="post" value="Register"/>
                <p>
                    <a href="javascript:history.back()">Go Back</a>
            </div>

        </form>
    </div>
</section>
<script src="js/materialize.js"></script>
</body>
</html>
