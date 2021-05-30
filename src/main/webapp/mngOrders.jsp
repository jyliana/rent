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
    <script src="js/materialize.js"></script>
    <title>Client orders</title>
    <link rel="stylesheet" href="resources/materialize.css">
    <link href="resources/style.css" rel="stylesheet">
</head>
<body>
<section class="body-wrapper">
    <div class="container row">
        <div class="col m1 s12">
            <div class="admin-left-area">
                <div class="profile-card">
                    <div class="image-card">
                        <img src="img/male.png" alt="" sizes="" srcset="">
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
                        <li><a href="mngOrders.jsp">Orders</a></li>
                        <li><a href="admPanelCars.jsp">Payments</a></li>
                        <li><a href="admPanelCars.jsp">Return of cars</a></li>
                    </ul>
                </div>
                <div class="bottom-action">
                    <ul>
                        <li><a href="">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col m11 s12">
            <div class="orders">
                <div>
                    <h5>Orders for inspection:</h5>
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
                            <th>Days</th>
                            <th>Total(hrn)</th>
                            <th>Status</th>
                            <th>Approve/Reject</th>
                        </tr>
                        <% List<Order> list = OrderDao.findAllUserOrders();
                            session.setAttribute("arr", list);
                        %>
                        <c:forEach var="order" items="${arr}">
                            <c:if test="${order.statusId==0}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${UserDao.findUserNameById(order.userId)}</td>
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
                                    <td>${order.days}</td>
                                    <td>${order.totalSum}</td>
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
                                                <img src="img/rejected.png">
                                            </div>
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="col-sm-9">
                                            <form class="form" action="controller">
                                                <input type="hidden" name="command" value="changeOrderStatus">
                                                <input type="hidden" name="orderId" value="${order.id}">
                                                <h6 class="card-subtitle mb-2 text-muted">
                                                    <select class="browser-default" name="status">
                                                        <option selected></option>
                                                        <option value="1">Approved</option>
                                                        <option value="2">Rejected</option>
                                                    </select>
                                                </h6>
                                                <label>Please enter cause of reject:</label>
                                                <textarea class="form-control" rows="3" name="comment"></textarea>
                                                <input type="submit" class="btn-small teal lighten-1" formmethod="post"
                                                       value="Set"/>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="orders">
                <div>
                    <h5>All orders:</h5>
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
                            <th>Days</th>
                            <th>Total(hrn)</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach var="order" items="${arr}">
                            <tr>
                                <td>${order.id}</td>
                                <td>${UserDao.findUserNameById(order.userId)}</td>
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
                                <td>${order.days}</td>
                                <td>${order.totalSum}</td>
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
                                            <img src="img/rejected.png">
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
</body>
</html>
