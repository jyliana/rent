<html>
<head>
    <%@include file="header.jsp" %>
    <title>Add a car</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>

<section id="registerlogin">
    <div class="card z-depth-3">
        <div class="card-panel center teal lighten-1">
            <span class="card-title white-text">Adding a car:</span>
        </div>
        <form class="form" action="controller">
            <input type="hidden" name="command" value="addCar">
            <div class="input-field">
                <input type="text" name="brand" placeholder="Brand" onclick="this.value=''" required/></br>
            </div>
            <div class="input-field">
                <input type="text" name="model" placeholder="Model" onclick="this.value=''" required/></br>
            </div>
            <div class="input-field">
                <select class="browser-default" name="carclass">
                    <option selected disabled value="0">Class</option>
                    <option value="0">Entry</option>
                    <option value="1">Business</option>
                    <option value="2">Premium</option>
                </select>
            </div>
            <div class="input-field">
                <input type="text" name="price" placeholder="Price for a day" onclick="this.value=''" required/></br>
            </div>
            <div class="center">
                <input type="submit" class="btn-large teal lighten-1" formmethod="post" value="Add a car"/>
                <p>
                    <a href="javascript:history.back()">Go Back</a>
            </div>
        </form>
    </div>
</section>
<script src="js/materialize.js"></script>
</body>
</html>
