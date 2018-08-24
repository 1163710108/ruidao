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
    <base href="<%=basePath%>">

    <meta charset="UTF-8">
    <title>订单</title>
    <link rel="stylesheet" href="css/order.css">
    <script src="js/jquery-1.8.3.js"></script>
    <style>
    	
    </style>
    
    <script type="text/javascript">
   	 function lll(pid){
    		var a = confirm("你确认支付么");
    		if(a){
    			var b = document.getElementById("adres").value;
    			location.href = "${pageContext.request.contextPath}/orderservlet?m=change&orderid="+pid+"&address="+b;
    		}
    }
    
    
    function zhifu(pid){
    	var i = confirm("确定支付么");
    	if(i){
    		var a = document.getElementById("adres").value;
    		location.href="orderservlet?m=selforderchange&id="+pid+"&address="+a;
    	}
    }
    </script>
    

</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<table style="width: 80%;border:1px #000 solid; margin-left: 10%;">

    <tr>
        <th class="order-number">订单号</th>
        <th class="order-time">下单时间</th>
        <th class="order-money">总金额</th>
        <th class="order-status">支付状态</th>
        <th class="order-address">收货地址</th>
        <th class="order-person">收货人</th>
        <th class="order-telephone">电话</th>
        <th>操作1</th>
        <th>操作2</th>
    </tr>
    <c:forEach items="${list}" var ="order">
   	 <tr>
     	  <th class="order-number">${order.oderid}</th>
      	  <th class="order-time">${order.ordertime}</th>
      	  <th class="order-money">￥${order.total}</th>
       	  <c:if test="${order.state ==1 }">
       	  <th class="order-status">是</th>
          </c:if>
          <c:if test="${order.state ==0 }">
         	 <th class="order-status">否</th>
         </c:if>
        
        
       	 <th class="order-address"><input type="text" name = "address" id ="adres" value="${order.address}"/></th>
       	 <th class="order-person">${order.name}</th>
      	  <th class="order-telephone">${order.telephone}</th>
      	  <th class="order-zhifu" onclick="zhifu('${order.oderid}')">支付</th>
      	  <th class="order-shanchu">删除</th>
    	</tr>
    </c:forEach>
    
</table>
<jsp:include page="aboutus.jsp"></jsp:include>

</body>
</html>
