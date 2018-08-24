<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/contrallerservlet?m=addshop" method="post">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>添加店铺</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家登陆用户名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="susername" value="" id="susername" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家登陆密码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="password" name="spassword" value="" id="spassword" class="bg" placeholder="123456"/>
					</td>
					
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						销售金额：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="sern" id="sern" class="bg" placeholder="新店铺为0"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家电话：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="stelephone" id="stelephone" class="bg" />
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="sname"  id="sname" class="bg" />
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家邮箱：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="semail" id="semail" class="bg"/>
					</td>
					
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						店家描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="smark" rows="5" cols="30"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							确定
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>