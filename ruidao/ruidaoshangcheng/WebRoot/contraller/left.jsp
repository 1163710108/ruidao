<%@ page language="java" pageEncoding="UTF-8" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
	
		d = new dTree('d');
		d.add('01',-1,'商城管理者管理'); //01代表本级节点的编号  -1代表根节点
		d.add('0102','01','卖家管理','','','mainFrame');//0102代表本级节点的编号   01代表父级节点
		d.add('010201','0102','卖家管理','${pageContext.request.contextPath}/contrallerservlet?m=shoplist','','mainFrame');
		d.add('0104','01','用户管理');
		d.add('010401','0104','用户管理','${pageContext.request.contextPath}/contrallerservlet?m=yonghulist','','mainFrame');
		d.add('0105','01','订单管理');
		d.add('010501','0105','订单管理','${pageContext.request.contextPath}/contrallerservlet?m=orderlist','','mainFrame');
		d.add('0106','01','退出登录');
		d.add('010601','0106','退出登录','${pageContext.request.contextPath}/contraller/tuichu/a.jsp','','mainFrame');
		document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
