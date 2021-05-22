<html>
<head>
    <%@include file="header.jsp" %>
    <title>Success!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>
<div class="container">
    Your query <% String command = (String) session.getAttribute("command"); %>
    <%=command %>
    was successfully performed.
    <hr>
    <a href="index.jsp">Back</a>
</div>
</body>
</html>
