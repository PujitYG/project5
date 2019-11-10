<%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 09-11-2019
  Time: 09:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Product.Product" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%HttpSession ses=request.getSession(); %>
<% String id= (String) ses.getAttribute("id"); %>
<%ArrayList arr=(ArrayList) ses.getAttribute("product");%>
        <div>
            here come jumbotron
            <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
        </div>
    <div class="container">
        <div class="row">
            <%for(Object p:arr){
            Product product=(Product) p; %>
            <div class="col col-lg-8 mx-auto">
                <div>
                    <p style="display: inline-block;width:200px;" ><%=product.name%></p>
                    <p style="display: inline-block;width:200px;" ><%=product.ProductID%></p>
                    <form action="change">
                    <button type="submit" name="pid" value="<%=product.ProductID%>">Change Description</button>
                    </form>
                    <form action="delete">
                        <button type="submit" name="pid" value="<%=product.ProductID%>"><span>X</span></button>
                    </form>
                </div>
            </div>
            <% }%>
        </div>
        <div class="row">
            <div class="col col-lg-12">
                <form action="product.jsp">
                    <button type="submit">
                        HOME
                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
 function doThis(ele) {
     console.log(ele)
     var id=document.getElementById("form-id");
     id.setAttribute("action",ele)
 }
</script>
</html>
