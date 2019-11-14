<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 14-11-2019
  Time: 08:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Support</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        ResultSet rs,rs1,rs0;
        HttpSession ses=request.getSession();
        String id=(String) ses.getAttribute("id");
        String sid=(String) ses.getAttribute("temp");
        rs0= (ResultSet) request.getAttribute("rs0");
        rs= (ResultSet) request.getAttribute("rs");
        rs1= (ResultSet) request.getAttribute("rs1");
        ResultSet rs2=(ResultSet) request.getAttribute("rs2");
    %>
<h1 style="display: block;background-color: grey;text-align: center">SUPPORT PAGE</h1>
<div class="container">
    <div class="row">
        <div class="col col-lg-8">
            <%if(id!=null && sid!=null){
                while(rs0.next()){ %>
                            <form action="supportChange">
                            <h5 style="display: block">Manager id</h5>
                            <h6><%= rs0.getString("id") %></h6>
                            <h5 style="display: block">Name</h5>
                            <h6><%=rs0.getString("first")%> <%=rs0.getString("last")%></h6>
                            <h5>Email</h5>
                            <input type="text" name="email" value="<%=rs0.getString("email")%>"><br>
                             <h5>PASSWORD</h5>
                            <input type="text" name="password" value="<%=rs0.getString("password")%>">
                            <h5>ADDRESS</h5>
                            <input type="text" name="address" value="<%=rs0.getString("address")%>">
                             <h5>CITY</h5>
                             <h6><%=rs0.getString("location")%></h6>
                             <button type="submit">Change</button>
                                <br>
                            </form>
            <%  } %>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col col-lg-12">
            <h5>Most Searched product</h5>
            <table cellpadding="10" cellspacing="5">
                <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Count</th>
                    <th>City</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next()){ %>
                <tr>
                    <td><%=rs.getString("Sname")%></td>
                    <td><%=rs.getString("count")%></td>
                    <td><%=rs.getString("location")%></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col col-lg-12">
            <h5>Most Searched product in your shop</h5>
                    <table cellpadding="10" cellspacing="5">
                        <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Count</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            while(rs1.next()){ %>
                        <tr>
                            <td><%=rs1.getString("Sname")%></td>
                            <td><%=rs1.getString("count")%></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col col-lg-12">
            <h5>Discontinued Product</h5>
            <table cellpadding="10" cellspacing="5">
                <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs2.next()){ %>
                <tr>
                    <td><%=rs2.getString("pid")%></td>
                    <td><%=rs2.getString("name")%></td>
                </tr>
                <% } }else{
                response.sendRedirect("index.html");
                }%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col col-lg-12">
            <form action="product.jsp" method="post">
                <button type="submit">
                        HOME
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
