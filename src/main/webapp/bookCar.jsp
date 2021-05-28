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
</head>
<body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('.datepicker');
        var instances = M.Datepicker.init(elems, options);
    });

    // Or with jQuery
    $(document).ready(function () {
        $('.datepicker').datepicker();
    });

    $('.input-daterange input').each(function () {
        $(this).datepicker('clearDates');
    });

    $('#datepicker').datepicker();
    $('#datepicker').on('changeDate', function () {
        $('#my_hidden_input').val(
            $('#datepicker').datepicker('getFormattedDate')
        );
    });
</script>

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
                        <div class="input-field">
                            <h6> Greetings, ${name}! You've chosen the best car for your goals. </h6>
                        </div>
                        <div class="form-group">
                            <label>Please enter your passport details</label>
                            <textarea class="form-control" rows="7"></textarea>
                        </div>
                        <div class="input-field">
                            <div class="switch">
                                <label>
                                    <strong> Without driver</strong>
                                    <input type="checkbox">
                                    <span class="lever"></span>
                                    <strong>With driver</strong>
                                </label>
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-fieldr">
                                <input type="text" class="datepicker">
                                <span>Pick-up date</span>
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-group date" data-provide="datepicker">
                                <input type="text" class="form-control">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-th">Return date</span>
                                    <div id="datepicker" data-date="12/03/2012"></div>
                                    <input type="hidden" id="my_hidden_input">
                                    <div class="input-group input-daterange">
                                        <input type="text" class="form-control" value="2012-04-05">
                                        <div class="input-group-addon">to</div>
                                        <input type="text" class="form-control" value="2012-04-19">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="center">
                            <input type="submit" class="btn-large teal lighten-1" formmethod="post"
                                   value="Book now"/>
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
