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
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="css/denglu.css">
    <script src = "js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="js/zhuye.js"></script>
  </head>
  
  <body>
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
									style="position: absolute; top: 10px; left: 280px; height: 30px; width: 160px;"  />
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
										href="register.html" style="text-decoration: none;">立即注册</a>
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
						<form action="${pageContext.request.contextPath}/loginservlet?m=logindianjia" method="post">
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
						</form>
					</div>
				</div>
			</div>

		</div>
  </body>
</html>
