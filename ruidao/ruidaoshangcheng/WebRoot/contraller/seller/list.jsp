<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css"
			rel="stylesheet" type="text/css" />
		<script language="javascript"
			src="${pageContext.request.contextPath}/js/public.js">
</script>
		<script type="text/javascript">
function addProduct() {
	window.location.href = "${pageContext.request.contextPath}/contraller/seller/add.jsp";
}

function delProduct(pid) {
	var isDel = confirm("您确认要删除吗？");
    if (isDel) {
		//要删除
		location.href = "${pageContext.request.contextPath}/contrallerservlet?m=deleteshop&pid="+pid;
	}
}
</script>
	</HEAD>
	<body>
		<br>
		
			<table cellSpacing="1" cellPadding="0" width="100%" align="center"
				bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商城卖家信息</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加店铺"
								class="button_add" onclick="addProduct()">
								添加店铺
							</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">


								<th align="center" width="15%">店家id</th>
								<th align="center" width="25%">店家名称</th>
								<th align="center" width="25%">店家销售额</th>
								<th align="center" width="15%">联系店家</th>
								<th align="center" width = "20%">操作</th>
							</tr>
							
							<c:forEach items="${shoplists}" var="shop" varStatus="vs">
							
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="15%">${shop.sid}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="25%">${shop.sname}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="25%">${shop.sern}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="25%">${shop.stelephone}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="20%" onclick="delProduct('${shop.sid}')">删除</td>
								</tr>
							</c:forEach>
						</table>
						</td>
					</tr>

				</TBODY>
			</table>
	</body>
</html>
