<%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 14-11-2019
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>VALIDATION</title>
</head>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<body>
        <form action="validate" method="post">
            <h5>ENTER YOUR PASSWORD</h5>
            <input type="password" name="password" value="">
            <input type="hidden" name="page" value="<%=request.getParameter("page")%>">
            <button type="submit">SUBMIT</button>
        </form>
</body>
</html>
