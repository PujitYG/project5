<%--
  Created by IntelliJ IDEA.
  User: PUJIT
  Date: 01-10-2019
  Time: 06:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center;color: rgb(4, 33, 97);">
    THANK YOU!
</h1>
<h3 style="text-align: center;color: rgb(4, 33, 97);font-family: Georgia, 'Times New Roman', Times, serif;margin-block-start: 2em">
    Your details have been successfully recorded.
</h3>
<p style="text-align: center;color:rgb(4, 33, 97);font-size: x-large">Your unique ID:<span id="thi"></span></p>

<script>
    var data;
    var obj;
    document.addEventListener("DOMContentLoaded",dothis);
    if(window.sessionStorage.getItem("enroll")==null){
        window.location.href="Error.jsp";
    }else {
        data = window.sessionStorage.getItem("enroll");
        obj = JSON.parse(data);
        console.log(obj);
    }
    function dothis() {
        var xhttp=new XMLHttpRequest();
        xhttp.onreadystatechange=function () {
            var obj=JSON.parse(xhttp.responseText);
            document.getElementById("thi").innerText = obj.id;
        }
        xhttp.open("POST",'enrollConfirmation',true);
        xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xhttp.send("enrollData="+data);
    }
</script>
</body>
</html>
