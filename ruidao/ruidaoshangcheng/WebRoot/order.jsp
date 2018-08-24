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
    </script>
    

</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<table style="width: 80%;border:1px #000 solid; margin-left: 10%;">
    <tr>
        <th class="order-number">订单号</th><th class="order-time">下单时间</th><th class="order-money">总金额</th>
        <th class="order-status">支付状态</th><th class="order-address">收货地址</th><th class="order-person">收货人</th>
        <th class="order-telephone">电话</th>
    </tr>
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
        
        
        <th class="order-address"><input type="text" name = "address" id ="adres"/></th>
        <th class="order-person">${order.name}</th>
        <th class="order-telephone">${order.telephone}</th>
    </tr>
</table>

<div class="buycarbody">
    <div id="buycarcontent">
        <div class="contenthead">
            <div class="buycartext1">商品</div>
            <div class="buycartext2">单价</div>
            <div class="buycartext2 bt2buchong">数量</div>
            <div class="buycartext2">小计</div>
        </div>

        <c:forEach items="${cart.list}" var="cartitem" varStatus="vs">
            <div class="product1" id="product${vs.count}">
                <div class="bproduct">
                    <img src="${cartitem.product.pimage}"/>
                    <div>${cartitem.product.pname}</div>
                </div>
                <script>price = ${cartitem.product.pprice*cartitem.product.pdiscount}</script>
                <div class="bprice" id="price${vs.count}">
                    <script>document.getElementById("price${vs.count}").innerHTML ="<div>￥"+price+"</div>"</script>
                </div>
                <div class="bnumber" >
                    <div>${cartitem.buyNum}</div>
                </div>
                <div class="bprice" id="prices${vs.count}">
                    <script>
                        document.getElementById("prices${vs.count}").innerHTML ="<div> <b>￥"+
                                ${cartitem.buyNum}*price+" </b></div>"

                    </script>
                </div>
            </div>
        </c:forEach>

        <div class="contentend">
            <div class="kongbai"></div>
            <div class="jiesaun">
            	
                <div>￥${cart.total}</div>
                <button onclick="lll('${order.oderid}')">支付</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="aboutus.jsp"></jsp:include>

</body>
</html>
