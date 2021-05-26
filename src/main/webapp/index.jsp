<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.Car" %>
<%@ page import="com.example.rent.db.CarDao" %>
<%@ page import="com.example.rent.model.CarClass" %>
<%@ page import="java.io.OutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <%@include file="header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Rental cars</title>
    <link rel="stylesheet" href="resources/materialize.css">
    <link href="resources/style.css" rel="stylesheet">
</head>
<body>
<section class="body-wrapper">
    <div class="container row">
        <div class="col m2 s12">
            <div class="admin-left-area">
                <div class="profile-card">
                    <div class="name-card">
                        <span class="welcome">Welcome,</span>
                        <span class="admin-name">
                        <% String name = (String) session.getAttribute("name");
                            if (name == null) name = "guest";
                        %>
                    <%=name %></span>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul>
                        <li><a href="">Book a car</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col m10 s12">
            <div class="item-table" id="items">
                <h5>Cars</h5>
                <% List<Car> list = CarDao.findAllCars();
                    session.setAttribute("arr", list);
                %>
                <c:forEach var="x" items="${arr}">
                    <div class="row col m5 s12">
                        <div class="card" style="width: 20rem;">
                            <div class="card-body">
                                <form class="form" action="controller">
                                    <input type="hidden" name="command" value="updateCarInfo">
                                    <img src="${x.path}"/>
                                    <div class="form-group row">
                                        <div class="col-sm-9">
                                            <h5 class="card-title">${x.brand} ${x.model}
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Class:</label>
                                        <div class="col-sm-9">
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                    ${CarClass.getCarClass(x).getName()}
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Price for day:</label>
                                        <div class="col-sm-9">
                                            <h6 class="card-subtitle mb-2 text-muted">
                                                    ${x.priceForDay}
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="form-group row"><label>Is booked:</label>
                                        <div class="col-sm-9">
                                            <h6 class="card-subtitle mb-2 text-muted"> ${x.isBooked}
                                            </h6>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn-large teal lighten-1" formmethod="post"
                                           value="Book"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</body>
</html>