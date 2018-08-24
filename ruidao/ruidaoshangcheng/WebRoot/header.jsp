<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html lang="en">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <style>
        .logo {
            height: 150px;
            width: 100%;
            top: 30px;
            border-bottom: solid;
            border-color: #dcdcdc;
        }

        .logo-logo {
            height: 100%;
            width: 20%;
            float: left;
        }

        .logo-logo img {
            height: 100%;
            width: 150px;
            margin-left: 50px;
        }

        .logo-gouwuche {
            height: 50%;
            width: 70%;
            float: left;
            list-style: none;
        }

        .logo-gouwuche-rongqi {
            float: right;
            margin-right: 100px;
        }

        .logo-gouwuche a {
            text-decoration: none;
            font-size: 15px;
            font-weight: lighter;
            color: darkgray;
        }

        .logo-gouwuche li {
            padding: 20px auto;
            margin-left: 40px;
            float: left;
        }

        .logo-search {
            height: 50%;
            width: 80%;
            float: left;
        }

        .logo-search-rongqi {
            height: 31px;
            width: 694px;
            margin: auto;
            border: 3px solid orange;
            border-radius: 0em 2em 2em 0em;
        }

        .logo-search-rongqi-sort {
            height: 30px;
            width: 50px;
        }

        .logo-search-rongqi-text {
            height: 24px;
            width: 600px;
        }

        .logo-search-rongqi-button {
            height: 30px;
            width: 40px;
            float: right;
            border-radius: 0em 2em 2em 0em;
            background-color: aqua;
            cursor: pointer;
        }

        #menu {
            position:relative;
            height: 50px;
            top: -20px;
            left: 250px;
        }

        #menu,
        #menu ul {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        #menu li {
            float: left;
            background-color: black;
            border-right: 1px solid #FFFFFF;
            margin: 20px;
        }

        #menu a {
            display: block;
            padding: 5px;
            color: darkgray;
            width: 80px;
        }

        #menu li ul {
            position: absolute;
            left: auto;
            width: 80px;
        }

        .active {
            background-color: blanchedalmond;
        }
    </style>
    
    <script src="js/jquery-1.8.3.js"></script>
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
			
			
			function loginout(){
			  window.location.href="${pageContext.request.contextPath}/loginservlet?m=loginoutyonghu";
			}
			
			function func1(){
				var a = document.getElementById("se").value;
				location.href="${pageContext.request.contextPath}/productservlet?m=search&searchs="+a;
			}
		</script>
<script type="text/javascript" src="js/zhuye.js"></script>
</head>
<body>

<div class="logo" id="top">
    <div class="logo-logo">
        <a href="index"><img src="images/logo.png" alt=""> </a>
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
							<li>
								<a href="javascript:void(0);">${login_user.uusername}</a>
									<ul class="submenu">
										<li>
											<a href="productservlet?m=history">浏览历史</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick = "loginout()">退出登录</a>
										</li>
									</ul>
							</li>
						</c:if>
					        
							<li>
								<a href="javascript:void(0);">后台管理</a>
									<ul class="submenu">
										<li>
											<a href="javascript:void(0);" onclick = "adminlogin()">管理员登陆</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick = "sellerlogin()">店家登陆</a>
										</li>
									</ul>
							</li>
							
								<c:if test="${empty login_user}">
								<li>
									<a href="javascipt:void(0);" onclick="login()">个人中心</a>
								</li>
								</c:if>
								<c:if test="${!empty login_user}">
									<li>
									<a href="information.jsp">个人中心</a>
									</li>
								</c:if>
							
					
							<li>
								<a href="javascript:void(0);">购物车/订单</a>
								<ul class="submenu">
									<li>
										<a href="buycar.jsp">购物车</a>
									</li>
									<li>
										<a href="orderservlet?m=selforder">订单管理</a>
									</li>
								</ul>
							</li>
				</ul>
                    </div>

    </div>

    <div class="logo-search">
					<div class="logo-search-rongqi">
						<select name="搜索分类" id="search-sort" size="1"
							class="logo-search-rongqi-sort">
							<option value="1" selected>
								商品
							</option>
							<option value="2">
								店铺
							</option>
						</select><input type="text" placeholder="请输入商品名" id="se" class="logo-search-rongqi-text"><img src="images/search.png" alt="" onclick="func1()"class="logo-search-rongqi-button">
					</div>
				</div>

</div>

</body>
</html>