<%@ page import="com.example.rent.model.Car" %>
<%@ page import="com.example.rent.db.CarDao" %>
<%@ page import="com.example.rent.model.CarClass" %>
<html>
<head>
    <%@include file="header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Book a car</title>
    <link rel="stylesheet" href="resources/materialize.css">
    <link rel="stylesheet" href="resources/style.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>
    <script>
        // document.addEventListener('DOMContentLoaded', function () {
        //     var elems = document.querySelectorAll('.datepicker');
        //     var instances = M.Datepicker.init(elems, options);
        // });

        // Or with jQuery
        $(document).ready(function () {
            $('.datepicker').datepicker();
        });

        // $('.input-daterange input').each(function () {
        //     $(this).datepicker('clearDates');
        // });
        //
        // $('#datepicker').datepicker();
        // $('#datepicker').on('changeDate', function () {
        //     $('#my_hidden_input').val(
        //         $('#datepicker').datepicker('getFormattedDate')
        //     );
        // });
    </script>
</head>
<body>


<section id="bookform">
    <div class="card z-depth-3">
        <div class="card-panel center teal lighten-1">
            <span class="card-title white-text">Booking a car</span>
            <% int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                Car car = CarDao.getCarById(id);
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                session.setAttribute("arr", car);
            %>
        </div>
        <section class="body-wrapper">
            <div class="row">
                <div class="col m4 s12">
                    <c:if test="${id==arr.id}">
                        <div class="card" style="width: 22rem;">
                            <div class="card-body">
                                <form class="form" action="controller">
                                    <img src="${arr.path}"/>
                                    <div class="form-group row">
                                        <h5 class="card-title">${arr.brand} ${arr.model}
                                        </h5>
                                    </div>
                                    <div class="form-group row"><label>Class:</label>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                                ${CarClass.getCarClass(arr).getName()}
                                        </h6>
                                    </div>
                                    <div class="form-group row"><label>Price for day:</label>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                                ${arr.priceForDay}
                                        </h6>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="col m1 s12"></div>
                <div class="col m6 s12">
                    <form class="form" action="controller">
                        <input type="hidden" name="command" value="bookCar">
                        <input type="hidden" name="id" value="${id}">
                        <input type="hidden" name="name" value="${name}">
                        <div class="input-field">
                            <h6> Greetings, ${name}! You've chosen the best car for your goals. </h6>
                        </div>
                        <div class="form-group">
                            <label>Please enter your passport details</label>
                            <textarea class="form-control" rows="7" name="passDetails"></textarea>
                        </div>
                        <div class="input-field">
                            <div class="switch">
                                <label>
                                    <strong>Without driver</strong>
                                    <input type="checkbox" name="hasDriver">
                                    <span class="lever"></span>
                                    <strong>With driver</strong>
                                </label>
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-fieldr">
                                <input type="text" class="datepicker" name="startDate">
                                <span>Pick-up date</span>
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-fieldr">
                                <input type="text" class="datepicker" name="endDate">
                                <span>Return date</span>
                            </div>
                        </div>
                        <div class="center">
                            <c:if test="${name != \"guest\"}">
                                <input type="submit" class="btn-large teal lighten-1"
                                       value="Book now"/>
                            </c:if>
                            <c:if test="${name == \"guest\"}">
                                <h5>Unauthorized user cannot book a car, please log in or register.</h5>
                            </c:if>
                            <p>
                                <a href="javascript:history.back()">Go Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    </div>
</section>
<script src="js/materialize.js"></script>
</body>
</html>
