<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign up page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="resources/style.css" rel="stylesheet">
    <style>
        #adminlogin {
            position: absolute;
            width: 350px;
            height: 500px;
            padding: 20px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .form {
            padding: 20px;
        }
    </style>
</head>
<body>

<section id="adminlogin">
    <div class="card z-depth-3">
        <div class="card-panel center light-blue darken3">
            <span class="card-title">Registration:</span>
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
                <input type="submit" class="btn-large light-blue darken3" formmethod="post" value="Register"/>
                <p>
                    <a href="index.jsp">Back</a>
            </div>


        </form>
    </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
