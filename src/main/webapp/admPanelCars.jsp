<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.Car" %>
<%@ page import="com.example.rent.db.CarDao" %>
<%@ page import="com.example.rent.model.CarClass" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <%@include file="header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            </div>
            <div class="item-table" id="items">

                <% List<Car> list = CarDao.findAllCars();
                    session.setAttribute("arr", list);
                %>

                <c:forEach var="x" items="${arr}">
                    <div class="row col m4 s12">
                        <div class="card" style="width: 20rem;">
                            <div class="card-body">
                                <form class="form" action="controller">
                                    <input type="hidden" name="command" value="updateCarInfo">
                                    <img src=${x.photo}>
                                    <div class="form-group row"><label>Brand:</label>
                                        <div class="col-sm-9">
                                            <h5 class="card-title"><input type="text" name="brand" value=${x.brand}>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Model:</label>
                                        <div class="col-sm-9">
                                            <h5 class="card-title"><input type="text" name="model" value=${x.model}>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Class:</label>
                                        <div class="col-sm-9">
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                <select class="browser-default" name="carclass">
                                                    <option selected
                                                            value="">${CarClass.getCarClass(x).getName()}</option>
                                                    <option value="0">Entry</option>
                                                    <option value="1">Business</option>
                                                    <option value="2">Premium</option>
                                                </select>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Price:</label>
                                        <div class="col-sm-9">
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                <input type="text" name="price" value=${x.getPriceForDay()}>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Is booked:</label>
                                        <div class="col-sm-9">
                                            <input type="hidden" name="id" value=${x.getId()}>
                                            <h6 class="card-subtitle mb-2 text-muted"> ${x.isBooked}
                                            </h6>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn-large teal lighten-1" formmethod="post"
                                           value="Update info"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>


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
                                    "            <input type=\"hidden\" name=\"command\" value=\"updateCarInfo\"></input>" +
                                    "<tr><td>" + car.getId() + "</td><td><input type=\"text\" name=\"brand\" value=" + car.getBrand() + "></input></td>" +
                                    "<td><input type=\"text\" name=\"model\" value=" + car.getModel() + "></input></td>" +
                                    "<td>" + CarClass.getCarClass(car).getName() + "</td><td><select class=\"browser-default\" name=\"carclass\">\n" +
                                    "<option selected disabled value=\"0\">Class</option>\n" +
                                    "<option value=\"0\">Entry</option>\n" +
                                    "<option value=\"1\">Business</option>\n" +
                                    "<option value=\"2\">Premium</option>\n" +
                                    "</select></td>" +
                                    "<td><input type=\"text\" name=\"price\" value=" + car.getPriceForDay() + "></input></td>" +
                                    "<td><input type=\"hidden\" name=\"id\" value=" + car.getId() + ">" + car.getIsBooked() + "</input></td></td>" +
                                    "<td><input type=\"submit\" class=\"btn-large teal lighten-1\" formmethod=\"post\" value=\"Update info\"/></td></tr></form>");
                        } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script src="js/materialize.js"></script>
</body>
</html>
