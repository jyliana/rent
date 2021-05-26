<%@ page import="java.util.List" %>
<%@ page import="com.example.rent.model.User" %>
<%@ page import="com.example.rent.db.UserDao" %>
<%@ page import="com.example.rent.model.Role" %>
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
            <div class="users">
                <div>
                    <span class="heading-title">User management</span>
                </div>
                <div class="divider"></div>
                <div class="item-table">
                    <table>
                        <tbody>
                        <tr>
                            <th>id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th></th>
                            <th>Is blocked</th>
                            <th></th>
                        </tr>
                        <% List<User> list = UserDao.findAllUsers();
                            session.setAttribute("arr", list);
                        %>
                        <c:forEach var="user" items="${arr}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.login}</td>
                                <td>${user.email}</td>
                                <td>${Role.getRole(user).getName()}</td>
                                <td>
                                    <form action="controller">
                                        <input type="hidden" name="command" value="appointManager">
                                        <input type="hidden" name="userId" value=${user.id}>
                                        <button type="submit" class="waves-effect waves-light btn-small">Appoint
                                            manager
                                        </button>
                                    </form>
                                </td>
                                <td>${user.getIsBlocked()}</td>
                                <td>
                                    <form action="controller">
                                        <input type="hidden" name="command" value="blockUnblockUser">
                                        <input type="hidden" name="userId" value=${user.id}>
                                        <button type="submit" class="waves-effect waves-light btn-small">Block/Unblock
                                        </button>
                                    </form>
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
