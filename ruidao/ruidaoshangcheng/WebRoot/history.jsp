<%@ page language="java" import="java.util.*"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.rd.bean.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta charset="UTF-8">
    <title>历史记录</title>

    <link rel="stylesheet" href="css/history.css">
    <script src = "js/jquery-1.8.3.js"></script>

    <!--引用外部js文件-->

</head>
<body style="width: 1380px;">

<jsp:include page="header.jsp"></jsp:include>
<div class="historybody">
    <div id="historycontent">
        <div class="contenthead">
            <div class="order">
                <div>序号</div>
            </div>
            <div class="historytext1">商品</div>
            <div class="historytext2">单价</div>
            <div class="historytext2 bt2buchong">时间</div>
        </div>
        

        <c:forEach items="${history}" var="hitem" varStatus="vs">
            <div class="history1">
                <div class="order-one">${vs.count}</div>
                <div class="bproduct">
                    <img src="${hitem.image}"/>
                    <div onclick="window.open('productservlet?m=infoofproduct&id=${hitem.id}')">${hitem.name}</div>
                </div>
                <script>price = ${hitem.price}</script>
                <div class="bprice" id="price${vs.count}">
                    <script>document.getElementById("price").innerHTML =
                            "<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;￥"+price+"</div>"
                    </script>
                </div>
                <div class="bdate" >
                    ${hitem.date}
                </div>
            </div>
        </c:forEach>
        
        <div class="contentend">
            <div class="kongbai"></div>
            <div class="qingchu">
                <a href="productservlet?m=deletehistory">清除历史记录</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="aboutus.jsp"></jsp:include>
<script>
</script>
</body>
</html>