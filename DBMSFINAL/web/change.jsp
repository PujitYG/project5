<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 12-11-2019
  Time: 06:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Title</title>
</head>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    HttpSession ses=request.getSession();
    Connection conn=null;
    Statement stmt=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
    } catch (Exception e) {
        e.printStackTrace();
    }
    final String pid=request.getParameter("pid");
    final String id=(String) ses.getAttribute("id");
    if(id==null){
        response.sendRedirect("index.html");
    }
    String sql="Select * from Product p,ProdDesc d where p.pid=d.pid and p.id='"+id+"'  and p.pid='"+pid+"'";
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
%>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col col-lg-6 mx-auto">
                <% while(rs.next()){ %>
                        <form  action="change">
                            <h5>Name</h5>
                            <input style="width: 50%" type="text" value="<%= rs.getString("name")%>" name="name"><br><br>
                            <h5>Color</h5>
                            <input style="width: 50%"  type="text" value="<%= rs.getString("color") %>" name="color"><br><br>
                            <h5>Connection</h5>
                            <input style="width: 50%"  type="text" value="<%= rs.getString("connection") %>" name="connection"><br><br>
                            <h5>type</h5>
                            <input style="width: 50%"  type="text" value="<%= rs.getString("type") %>" name="type"><br><br>
                            <h5>Description</h5>
                            <input style="width: 50%" type="text" value="<%=rs.getString("Description")%>" name="desc" ><br><br>
                            <input type="hidden" name="pid" value="<%=pid%>">
                            <button type="submit">
                                Submit
                            </button>
                        </form>
                <% }%>
            </div>
        </div>
    </div>
</body>
</html>
