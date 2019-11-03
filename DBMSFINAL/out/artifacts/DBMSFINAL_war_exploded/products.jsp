<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 31-10-2019
  Time: 09:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% HttpSession ses=request.getSession();%>
<p><%=request.getAttribute("products")%></p>
    <a href="nice.jsp"><input type="submit" value="click here"></a>
<form method="post" action="products.jsp">
    <input type="text" name="text-box" value="">
    <input type="submit">
</form>
<%
    String id= (String) ses.getAttribute("id");
    Connection conn=null;
    Statement stmt= null;
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
    String sql;
    stmt=conn.createStatement();
    String val=request.getParameter("text-box");
%>
<% if(val==null){
    sql="select name from products where id='"+id+"'";
}else{
    sql="select name from products where id='"+id+"' and name like '"+val+"%'";
}
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next()){ %>
<p><%=rs.getString("name")%></p>
<% }%>

<p><%= ses.getAttribute("id") %></p>
<p id="card"><%= ses.getAttribute("products") %></p>

</body>
<script>
    var a=<%= ses.getAttribute("products") %>;
    console.log(a);
</script>
</html>
