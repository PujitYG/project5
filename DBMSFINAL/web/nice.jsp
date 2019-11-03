<%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 01-11-2019
  Time: 09:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>okok</title>
</head>
<body>
<p><%=request.getAttribute("products")%></p>
<% HttpSession s=request.getSession(); %>
<% String val=(String) s.getAttribute("id");%>
<p><%=val%></p>
</body>
</html>
