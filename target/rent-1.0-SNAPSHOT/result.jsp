<html>
<head>
    <%@include file="header.jsp" %>
    <title>Success!</title>
    <link rel="stylesheet" href="resources/materialize.css">
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>
<div class="container">
    Your query <% String command = (String) session.getAttribute("command"); %>
    <%=command %>
    was successfully performed.
    <hr>
    <a href="javascript:history.back()">Go Back</a>
</div>
</body>
</html>
