<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 05-11-2019
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Description</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<% HttpSession ses=request.getSession(); %>
<%
    if(ses.getAttribute("id")==null){
        response.sendRedirect("Error.jsp");
    }
%>
<%!String id=null; %>
<% id= (String) ses.getAttribute("id"); %>
<% String pcid=(String)request.getParameter("product-des"); %>
<% Connection conn=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
    } catch (Exception e) {
        e.printStackTrace();
    }
    String sql="Select * from product where id='"+id+"' and pid='"+pcid+"'";
    Statement stmt= null;
    try {
        stmt = conn.createStatement();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet rs= null;
    try {
        rs = stmt.executeQuery(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<div class="container">
    <div class="row">
        <div class="col col-12">
            <% while(rs.next()) { %>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%=rs.getString("name")%></h5>
                    <p class="card-text"><%=rs.getString("color")%></p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
