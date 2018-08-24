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
		<title>睿道商城</title>
		<link rel="stylesheet" href="css/zhuye.css">
		<script src="js/zhuye.js"></script>
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

	</head>
	<body style = "width: 1380px">

		<div class="nothiddenthing" id="nothiddenthing">
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
									<a href="javascript:void(0);" onclick="login()">个人中心</a>
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

			<div class="sort_and_goods">
				<div class="sort">
					<c:forEach items="${category}" var="c">
						<div class="navigation-one">
							<a href="#${c.cname}">${c.cname}</a>
						</div>
					</c:forEach>
				</div>

				<div class="goods">
					<div class="goods-huodong">
						<a href="#"><img src="images/shangpin1.jpg" alt="1"> </a>
					</div>

					<div class="goods-remai">
						<a href="#"><img src="images/shangpin2.jpg" alt="2"> </a>
					</div>
				</div>

			</div>


			<div class="navigation">
				<div class="navigation-top"
					onclick="window.location.href = '#top';return false">
					<div>
						&and;
					</div>
					<div>
						顶部
					</div>
				</div>

				<div class="navigation-zhekou"
					onclick="window.location.href = '#zhekou';return false">
					折扣商品
				</div>

				<div class="navigation-remai"
					onclick="window.location.href = '#remen';return false">
					热门商品
				</div>

				<div class="navigation-bottom"
					onclick="window.location.href = '#bottom';return false">
					<div>
						底部
					</div>
					<div>
						&or;
					</div>
				</div>
			</div>

			<div class="others">
				<div class="others-one" id="zhekou">
					<div class="others-biaoti">
						折扣商品
					</div>
					<div class="others-neirong">
					
					
					<c:forEach items="${discount}" var="d">
					<div class="others-neirong-one">
							<div class="others-neirong-one-tupian">
								<a href="productservlet?m=infoofproduct&id=${d.pid}"><img src="${d.pimage}" alt=""> </a>
							</div>
							<div class="others-neirong-one-jieshao">
								<a href="productservlet?m=infoofproduct&id=${d.pid}">${d.pname}</a>
							</div>
							<div class="others-neirong-one-jiage">
								<a href="productservlet?m=infoofproduct&id=${d.pid}">¥${d.pprice}</a>
							</div>
						</div>
					</c:forEach>
						
					</div>
				</div>

				<div class="others-one" id="remen">
					<div class="others-biaoti">
						热门商品
					</div>
					<div class="others-neirong">
					
					<c:forEach items="${hot}" var="a">
						<div class="others-neirong-one">
								<div class="others-neirong-one-tupian">
									<a href="productservlet?m=infoofproduct&id=${a.pid}"><img src="${a.pimage}" alt=""> </a>
								</div>
								<div class="others-neirong-one-jieshao">
									<a href="productservlet?m=infoofproduct&id=${a.pid}">${a.pname}</a>
								</div>
								<div class="others-neirong-one-jiage">
									<a href="productservlet?m=infoofproduct&id=${a.pid}">¥${a.pprice}</a>
								</div>
							</div>
					</c:forEach>
						
					</div>
				</div>
				
				<c:forEach items="${category}" var="c">
					<a name="${c.cname}">
					<div class="others-one" id="nvzhuang">
						<div class="others-biaoti"><a href="productservlet?m=showlist&cid=${c.cid}">${c.cname}</a></div>
						<div class="others-neirong">
							<c:forEach items="${c.list}" var="entry">
								<div class="others-neirong-one">
									<c:forEach items="entry" var="p">
										<div class="others-neirong-one-tupian">
											<a href="productservlet?m=infoofproduct&id=${entry.pid}"><img src="${entry.pimage}" alt=""> </a>
										</div>
										<div class="others-neirong-one-jieshao">
											<a href="productservlet?m=infoofproduct&id=${entry.pid}">${entry.pname}</a>
										</div>
										<div class="others-neirong-one-jiage">
											<a href="productservlet?m=infoofproduct&id=${entry.pid}">¥${entry.pprice}</a>
										</div>
									</c:forEach>
									
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
				
				
				<!--  -->

			<div class="aboutus" id="bottom">
				<div></div>
				<a href="#">新手上路</a><span></span>
				<a href="#">关于我们</a><span></span>
				<a href="#">联系我们</a><span></span>
				<a href="#">下载源码</a>
			</div>
		</div>



		<div class="hiddenthing" id="hiddenthing1">
			<div class="hiddenbackground"></div>
			<div class = "denglu" id="denglu1">
				<div
					style="position: absolute; top: 0px; left: 0px; right: 0px; bottom: 0px; background-color: white">
					<span
						style="position: absolute; top: 0; left: 430px; height: 20px; background-color: white; cursor: pointer;"
						onclick="hideModel1()">X</span>
					<div class="denglu_top">
						<div class="denglu_top_logo">
							<img src="images/logo.png" style="height: 100%; width: 100%;" />
						</div>
						<div class="denglu_top_right">
							<span><font
								style="font-family: 方正舒体; font-size: 200%; color: red; padding-top: 10px;">睿道登陆</font>
							</span>
						</div>
					</div>
					<div class="login">
						<form action="${pageContext.request.contextPath}/loginservlet?m=loginyonghu" method="post">
							<div class="login_yonghu">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">用户名：</font>
								</span>
								<input type="text" name="login_usename" placeholder="用户名"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 300px;" />
							</div>
							<div class="login_mima">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">密&nbsp;&nbsp;码：</font>
								</span>
								<input type="password" name="login_password"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 300px;" />
							</div>
							<div class="login_btn">
								<input type="submit"
									style="background: #0f88eb; color: #fff; position: absolute; top: 10px; left: 10px; width: 420px; height: 50px;"
									value="立即登陆" />
							</div>
							<div class="login_yanzheng">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">验证码：</font>
								</span>
								<input type="text" name="login_yanzheng"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 150px;" />
								<img onclick="change(this)" src="/ruidaoshangcheng/checkimg"
									style="position: absolute; top: 10px; left: 280px; height: 30px; width: 160px;" />
							</div>
							<div class="login_btn">
								<input type="submit"
									style="background: #0f88eb; color: #fff; position: absolute; top: 10px; left: 10px; width: 420px; height: 50px;"
									value="立即登陆" />
							</div>
							<div class="information">
								<span class="information_left"> <font><a href="#"
										style="text-decoration: none;">忘记密码</a>
								</font> </span>
								<span class="information_right"> <font><a
										href="register.jsp" style="text-decoration: none;">立即注册</a>
								</font> </span>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
		
		<div class="hiddenthing" id="hiddenthing2">
			<div class="hiddenbackground"></div>
			<div class = "denglu" id="denglu2">
				<div
					style="position: absolute; top: 0px; left: 0px; right: 0px; bottom: 0px; background-color: white">
					<span
						style="position: absolute; top: 0; left: 430px; height: 20px; background-color: white; cursor: pointer;"
						onclick="hideModel2()">X</span>
					<div class="denglu_top">
						<div class="denglu_top_logo">
							<img src="images/logo.png" style="height: 100%; width: 100%;" />
						</div>
						<div class="denglu_top_right">
							<span><font
								style="font-family: 方正舒体; font-size: 200%; color: red; padding-top: 10px;">管理员登陆</font>
							</span>
						</div>
					</div>
					<div class="login">
						<form action="${pageContext.request.contextPath}/loginservlet?m=loginguanliyuan" method="post">
							<div class="login_yonghu">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">用户名：</font>
								</span>
								<input type="text" name="login_usename"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 300px;" />
							</div>
							<div class="login_btn">
								<input type="submit"
									style="background: #0f88eb; color: #fff; position: absolute; top: 10px; left: 10px; width: 420px; height: 50px;"
									value="立即登陆" />
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
		
		<div class="hiddenthing" id="hiddenthing3">
			<div class="hiddenbackground"></div>
			<div class = "denglu" id="denglu3">
				<div
					style="position: absolute; top: 0px; left: 0px; right: 0px; bottom: 0px; background-color: white">
					<span
						style="position: absolute; top: 0; left: 430px; height: 20px; background-color: white; cursor: pointer;"
						onclick="hideModel3()">X</span>
					<div class="denglu_top">
						<div class="denglu_top_logo">
							<img src="images/logo.png" style="height: 100%; width: 100%;" />
						</div>
						<div class="denglu_top_right">
							<span><font
								style="font-family: 方正舒体; font-size: 200%; color: red; padding-top: 10px;">店家登陆</font>
							</span>
						</div>
					</div>
					<div class="login">
						<form action="${pageContext.request.contextPath}/loginservlet?m=logindianjia" method="post">
							<div class="login_yonghu">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">用户名：</font>
								</span>
								<input type="text" name="login_usename" placeholder="用户名/手机号/邮箱"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 300px;" />
							</div>
							<div class="login_mima">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">密&nbsp;&nbsp;码：</font>
								</span>
								<input type="password" name="login_password"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 300px;" />
							</div>
							<div class="login_yanzheng">
								<span
									style="cursor: pointer; position: absolute; top: 18px; left: 10px; height: 40px; width: 100px;"><font
									style="font-family: 方正舒体; font-size: 150%; color: red; padding-top: 10px;">验证码：</font>
								</span>
								<input type="text" name="login_yanzheng"
									style="position: absolute; top: 10px; left: 120px; height: 40px; width: 150px;" />
								<img onclick="change(this)" src="/ruidaoshangcheng/checkimg"
									style="position: absolute; top: 10px; left: 280px; height: 30px; width: 160px;" />
							</div>
							<div class="login_btn">
								<input type="submit"
									style="background: #0f88eb; color: #fff; position: absolute; top: 10px; left: 10px; width: 420px; height: 50px;"
									value="立即登陆" />
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>


	</body>
</html>
