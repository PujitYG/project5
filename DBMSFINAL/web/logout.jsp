<%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 10-11-2019
  Time: 09:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <%HttpSession ses=request.getSession();
        ses.invalidate();
        response.sendRedirect("index.html");%>
</body>
</html>
