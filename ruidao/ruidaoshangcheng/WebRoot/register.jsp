<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>睿道注册</title>
		<style type="text/css">
			body {
				background-image: url(images/regist_bg.jpg);
			}
			
			#top {
				width: 1300px;
				height: 60px;
				background-color: white;
				border-bottom: 2px solid #dcdcdc;
				display: flex;
				align-items: center;
				margin: auto;
			}
			
			.top_left {
				position: relative;
				left: 100px;
				/*display: flex;
	align-items: center;
	margin: auto;*/
			}
			
			.top_right {
				position: relative;
				left: 700px;
				/*display: flex;
	align-items: center;
	margin: 16px;*/
			}
			
			.top_right a {
				margin: 10px;
				color: #a3a3a3;
				text-decoration: none;
			}
			
			#form {
				height: 500px;
				padding-top: 70px;
				padding-left: 100px;
				margin-bottom: 10px;
				
				
			}
			
			#father {
				border: 0px solid white;
				padding-left: 307px;
				border-radius: 20px 20px 20px 20px;
			}
			
			#form2 {
				border: 5px solid gray;
				width: 660px;
				height: 450px;
				border-radius: 20px 20px 20px 20px;
			}
		</style>
		<script>
			function showTips(id,info){
				document.getElementById(id+"span").innerHTML="<font color='gray'>"+info+"</font>";
			}
			
			
			function check(id,info){
				//1.获取用户输入的用户名数据
				var uValue = document.getElementById(id).value;
				//2.进行校验
				if(uValue==""){
					document.getElementById(id+"span").innerHTML="<font color='red'>"+info+"</font>";
				}else{
					$.ajax({
					url:"${pageContext.request.contextPath}/checkusername",
					async:true,
					type:"POST",
					data:{"user":document.getElementById("user").value},
					success:function(data){
				    if(data.isExist){
				    	 document.getElementById("userspan").innerHTML = "<font color='red'>该用户名已经存在</font>";
				    }else{
				  		 document.getElementById(id+"span").innerHTML="<img src='images/checked.gif'>";
				    }
				},
				dataType:"json"
			});
					
				}
			}
			function sure_mima(){
				var a = document.getElementById("repasswordspan").innerHTML ="<font color='gray'>请确认与密码输入相同</font>"
			}
			
			function sure_mima1(){
				document.getElementById("repasswordspan").innerHTML=""
				var repvalue = document.getElementById("repassword").value;
				var pvalue = document.getElementById("password").value;
				if(repvalue==""){
					document.getElementById("repasswordspan").innerHTML="<font color='red'>请确认密码</font>";
				}else if(repvalue != pvalue){
					document.getElementById("repasswordspan").innerHTML="<font color='red'>两次输入密码不正确</font>";
				}else{
					document.getElementById("repasswordspan").innerHTML="<img src='images/checked.gif'>";
				}
			}
			
			function checkemail(){
				var eValue = document.getElementById("email").value;
				if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(eValue)){
					document.getElementById("emailspan").innerHTML="<font color='red'>邮箱格式不对</font>";
				}
				else{
					document.getElementById("emailspan").innerHTML="<img src='images/checked.gif'>";
				}
			}
			function checkemail1(){
				document.getElementById("emailspan").innerHTML="<font color='gray'>注意邮箱格式</font>";
			}
			
			
		function fn3(){
			$.ajax({
				url:"${pageContext.request.contextPath}/checkusername",
				async:true,
				type:"POST",
				data:{"user":document.getElementById("user").value},
				success:function(data){
				    if(data.isExist){
				     document.getElementById("userspan").innerHTML = "<font color='red'>该用户名已经存在</font>";
				    }else{
				    document.getElementById("userspan").innerHTML = "<font color='gray'>该用户名可以使用</font>";
				    }
				},
				dataType:"json"
			});
	       }
	       function fasongyanzhengma(){
	       		$.ajax({
				url:"${pageContext.request.contextPath}/sendmessage",
				async:true,
				type:"POST",
				data:{"user":document.getElementById("email").value}
			});
	       }
	       function change(obj){
			obj.src="/ruidaoshangcheng/checkimg?time="+new Date().getTime();
	        }
		</script>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script></head>
	<body>
		<div id="top">
			<div class="top_left">
				<span><font style="font-family:方正舒体;font-size:200%;color:red">睿道商城</font></span>
			</div>
			<div class="top_right">
				<a href="#">首页</a>
				<a href="#">登陆</a>
				<a href="zhuce.html">注册</a>
				<a href="#">购物车</a>
			</div>
		</div>
		<div id="form">
			<form action="${pageContext.request.contextPath}/registerservlet" method="post" id="registForm">
				<div id="father">
					<div id="form2">
						<table border="0px" width="100%" height="100%" align="center" cellpadding="0px" cellspacing="0px" bgcolor="white">
							<tr>
								<td colspan="2">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font size="5">睿道注册</font>&nbsp;&nbsp;&nbsp;USER REGISTER
								</td>
							</tr>
							<tr>
								<td width="180px">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									<label for="user">用户名</label>
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="uusername" size="35px" id="user" placeholder="请输入用户名并且不少于3位" onfocus="showTips('user','用户名必填！')" 
										onblur="check('user','用户名不能为空！')" />
									<span id="userspan"></span>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 密码
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="password" name="upassword" size="35px" id="password" placeholder="请输入密码并且不少于6位"  onfocus="showTips('password','密码必填')" 
										onblur="check('password','密码不能为空!')"/>
									<span id="passwordspan"></span>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 确认密码
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="password" name="repassword" id="repassword" size="35px" onfocus="sure_mima()" onblur="sure_mima1()"/><span id="repasswordspan"></span>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 姓名
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="uname" size="35px" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 性别
								</td>
								<td>
									<span style="margin-right: 155px;">
											<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;
											<input type="radio" name="usex" value="男"/>男
											<input type="radio" name="usex" checked = "checked" value="女"/>女<em></em>
											<label for="sex" class="error" style="display: none;"></label>
										</span>

								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 出生日期
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="ubirthday" size="35px" placeholder="eg:1998-02-13" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Email
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="uemail" size="35px" id="email" onfocus="checkemail1()" onblur="checkemail()"/><span id="emailspan"></span>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 手机号
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="utelephone" size="35px" id="email" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 验证码
								</td>
								<td>
									<em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="uyanzhengma"  />
									<img onclick="change(this)" src="/ruidaoshangcheng/checkimg"
									style="position: reletive top: 0px; left: 10px; height: 30px; width: 160px;" />
								</td>
							</tr>
							<tr>
								<span><font>${sessionScope.error}</font></span>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="submit" value="注      册" height="50px" />
								</td>
							</tr>
							
						</table>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
