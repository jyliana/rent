<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=request.getAttribute("responce")%>
<hr>
${requestScope.responce}

<hr>result.jsp
${responce}

<hr>
<a href="index.jsp">Back</a>

</body>
</html>
