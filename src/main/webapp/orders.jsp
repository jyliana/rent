<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.Order" %>
<%@ page import="com.example.rent.db.UserDao" %>
<%@ page import="com.example.rent.model.OrderStatus" %>
<%@ page import="com.example.rent.db.CarDao" %>
<%@ page import="com.example.rent.db.OrderDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <%@include file="header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>My orders</title>
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
                            session.setAttribute("name", name);
                        %>
                    <%=name %></span><br><br>
                        <c:if test="${name == \"guest\"}">
                            <form class="row g-3" action="controller">
                                <button type="submit" class="waves-effect waves-light btn-small" formmethod="post">
                                    Log in
                                </button>
                                <input type="hidden" name="command" value="logInUser">
                                <input type="text" name="name" placeholder="  Enter name"
                                       onclick="this.value=''" required/>
                                <input type="password" name="pass" placeholder="  Enter password"
                                       onclick="this.value=''" required/>
                            </form>
                            <form class="row" action="register.jsp">
                                <button type="submit" class="waves-effect waves-light btn-small">Sign up</button>
                            </form>
                        </c:if>
                        <c:if test="${name!=\"guest\"}">
                            <div class="sidebar-menu">
                                <div class="menu-item">
                                    <ul>
                                        <li><a href="orders.jsp">My orders</a></li>
                                        <li><a href="bills.jsp">My bills</a></li>
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
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="col m10 s12">
            <div class="users">
                <div>
                    <span class="heading-title">My orders</span>
                </div>
                <div class="divider"></div>
                <div class="item-table">
                    <table>
                        <tbody>
                        <tr>
                            <th>№</th>
                            <th>Name</th>
                            <th>Car</th>
                            <th>Details</th>
                            <th>With driver</th>
                            <th>Start date</th>
                            <th>End date</th>
                            <th>Status</th>
                        </tr>
                        <% List<Order> list = OrderDao.findAllUserOrders(name);
                            session.setAttribute("arr", list);
                        %>
                        <c:forEach var="order" items="${arr}">
                            <tr>
                                <td>${order.id}</td>
                                <td>${name}</td>
                                <td>${CarDao.getCarById(order.carId).brand} ${CarDao.getCarById(order.carId).model}</td>
                                <td>${order.passDetails}</td>
                                <td>
                                    <c:if test="${order.hasDriver==true}">
                                        <div class="image-card">
                                            <img src="img/yes.png">
                                        </div>
                                    </c:if>
                                    <c:if test="${order.hasDriver!=true}">
                                        <div class="image-card">
                                            <img src="img/no.png">
                                        </div>
                                    </c:if>
                                </td>
                                <td>${order.startDate}</td>
                                <td>${order.endDate}</td>
                                <td>
                                    <c:if test="${order.statusId==0}">
                                        <div class="image-card">
                                            <img src="img/new.png">
                                        </div>
                                    </c:if>
                                    <c:if test="${order.statusId==1}">
                                        <div class="image-card">
                                            <img src="img/approved.png">
                                        </div>
                                    </c:if>
                                    <c:if test="${order.statusId==2}">
                                        <div class="image-card">
                                            <img src="img/redjected.png">
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
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