<html>
<head>
    <%@include file="header.jsp" %>
    <title>Add a car</title>
    <link rel="stylesheet" href="resources/materialize.css">
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
            <div class="file-field input-field">
                <div class="btn">
                    <span>Image</span>
                    <input type="file" name="photo">
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
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
