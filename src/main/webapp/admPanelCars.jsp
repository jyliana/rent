<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.Car" %>
<%@ page import="com.example.rent.db.CarDao" %>
<%@ page import="com.example.rent.model.CarClass" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <%@include file="header.jsp" %>
    <title>Admin panel</title>
    <link rel="stylesheet" href="resources/materialize.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>
<section class="body-wrapper">
    <div class="container row">
        <div class="col m2 s12">
            <div class="admin-left-area">
                <div class="profile-card">
                    <div class="image-card">
                        <img src="img/female.png" alt="" sizes="" srcset="">
                    </div>
                    <div class="name-card">
                        <span class="welcome">Welcome,</span>
                        <span class="admin-name">
                        <% String name = (String) session.getAttribute("name"); %>
                    <%=name %></span>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul>
                        <li><a href="admPanelUsers.jsp">User management</a></li>
                        <li><a href="admPanelCars.jsp">Add/Change car</a></li>
                    </ul>
                </div>
                <div class="bottom-action">
                    <ul>
                        <li><a href="">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col m10 s12">
            <div class="counter-block row">
                <div>
                    <span class="heading-title">Car management</span>
                </div>
                <div class="card col m4 s12">
                    <ul>
                        <form action="addcar.jsp">
                            <button type="submit" class="waves-effect waves-light btn">Add a car</button>
                        </form>
                    </ul>
                </div>
                <div class="item-table" id="items">
                    <table>
                        <tbody>
                        <tr>
                            <th>id</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Class</th>
                            <th></th>
                            <th>Price</th>
                            <th>Is booked</th>
                            <th></th>
                        </tr>
                        <% List<Car> cars = CarDao.findAllCars();
                            for (Car car : cars) {
                                out.println("<form class=\"form\" action=\"controller\" enctype=\"multipart/form-data\">\n" +
                                        "            <input type=\"hidden\" name=\"command\" value=\"updateCarInfo\">" +
                                        "<tr><td><input name=\"id\" value=" + car.getId() + "></input></td><td><input type=\"text\" name=\"brand\" value=" + car.getBrand() + "></input></td>" +
                                        "<td><input type=\"text\" name=\"model\" value=" + car.getModel() + "></input></td>" +
                                        "<td>" + CarClass.getCarClass(car).getName() + "</td><td><select class=\"browser-default\" name=\"carclass\">\n" +
                                        "<option selected disabled value=\"0\">Class</option>\n" +
                                        "<option value=\"0\">Entry</option>\n" +
                                        "<option value=\"1\">Business</option>\n" +
                                        "<option value=\"2\">Premium</option>\n" +
                                        "</select></td>" +
                                        "<td><input type=\"text\" name=\"price\" value=" + car.getPriceForDay() + "></input></td>" +
                                        "<td>" + car.getIsBooked() + "</td></td>" +
                                        "<td><input type=\"submit\" class=\"btn-large teal lighten-1\" formmethod=\"post\" value=\"Update info\"/></td></tr></form>");
                            } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="js/materialize.js"></script>
</body>
</html>
