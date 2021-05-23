<html>
<head>
    <%@include file="header.jsp" %>
    <title>Main page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>
<div class="container row">
    <div class="col m2 s12">
        <div class="admin-left-area">
            <div class="profile-card">
                <div class="image-card">
                    <img src="img/male.png" alt="" sizes="" srcset="">
                </div>
                <div class="name-card">
                    <span class="welcome">Welcome,</span>
                    <span class="user-name">
                        <% String name = (String) session.getAttribute("name"); %>
                    <%=name %></span>
                </div>
            </div>
            <div class="sidebar-menu">
                <div class="menu-item">
                    <ul>
                        <li><a href="">Book a car</a></li>
                        <li><a href="">Enter your data</a></li>
                        <li><a href="">Payments</a></li>
                    </ul>
                </div>
            </div>
            <div class="bottom-action">
                <div class="bottom-item">
                    <ul>
                        <li><a href="">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="col m10 s12">
        <ul>
            <li>List of cars</li>
        </ul>
    </div>
</div>
</body>
</html>
