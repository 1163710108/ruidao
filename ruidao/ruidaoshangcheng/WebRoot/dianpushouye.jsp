<%@ page language="java" import="java.util.*"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.rd.bean.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>店铺主页</title>
    <link rel="stylesheet" href="css/dianpushouye.css">
    <script src = "js/jquery-1.8.3.js"></script>
    <script src = "js/dianpushouye.js"></script>

    <script>
        $(document).ready(function() {
            $('#menu li ul').hide();
            $('#menu li').hover(
                    function() {
                        $(this).find('ul').slideDown('fast');
                        $(this).find('a:first').addClass('active');
                    },
                    function() {
                        $(this).find('.submenu').fadeOut('fast');
                        $(this).find('a').removeClass("active");
                    });
        });
    </script>
</head>
<body style = "width: 1380px; background-color: #000;">

<div class = "nothiddenthing">
    <div class="logo" id="top">

        <div class="logo-logo">
            <a href="index.jsp"><img src="images/logo.png" alt=""> </a>
        </div>

        <div class="logo-gouwuche">
            <div class = "logo-gouwuche-rongqi">
                <ul id="menu">
                    <c:if test="${empty login_user}">
                        <li>
                            <a onclick="login()">登录</a>
                        </li>
                        <li>
                            <a href="register.jsp">注册</a>
                        </li>
                    </c:if>
                    <c:if test="${!empty login_user}">
                        <li style="color:white;padding:5px;"><font style="font-family: 方正舒体">Welcome to 睿道</font></li>
                        <li><a href="#">${login_user.uusername}</a></li>
                    </c:if>

                    <li>
                        <a>后台管理</a>
                        <ul class="submenu">
                            <li>
                                <a onclick = "adminlogin()">管理员登陆</a>
                            </li>
                            <li>
                                <a onclick = "sellerlogin()">店家登陆</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">个人中心</a>
                    </li>
                    <li>
                        <a href="#">购物车</a>
                    </li>
                </ul>
            </div>

        </div>

        <div class="logo-search">
            <div class = "logo-search-storename" style = "float: left;width:30%">
                <a href="dianpushouye.jsp" style = "text-decoration: none; color: #000;">
                    
                </a>
            </div>
            <div class="logo-search-rongqi">
                <select name="搜索分类" id="search-sort" size="1"
                        class="logo-search-rongqi-sort">
                    <option value="1" selected>
                        本店
                    </option>
                    <option value="2">
                        睿道
                    </option>
                </select><input type="text" placeholder="请输入商品名" class="logo-search-rongqi-text"><img src="images/search.png" alt="" onclick="func1()"class="logo-search-rongqi-button">
            </div>
        </div>

    </div>

    <div class = "biaoti">

        <div class = "biaoti-wenzi" style="margin-left:150px;">
            <div style = "margin-top:60px;width: 100%;color:gold; font-size: 3em; font-family: 华文新魏; ">${shop.sname}</div>
        </div>
    </div>

    <div class = "sort">
    </div>

    <div class = "others">

        <c:forEach items="${products}" var="pro">
            <div class="others-neirong-one">
                <div class="others-neirong-one-tupian">
                    <a href="productservlet?m=infoofproduct&id=${pro.pid}"><img src="${pro.pimage}" alt=""> </a>
                </div>
                <div class="others-neirong-one-jieshao">
                    <a href="productservlet?m=infoofproduct&id=${pro.pid}">${pro.pname}</a>
                </div>
                <div class="others-neirong-one-jiage">
                    <a href="productservlet?m=infoofproduct&id=${pro.pid}">￥${pro.pprice}</a>
                </div>
            </div>
        </c:forEach>


    </div>
</div>

</body>
</html>