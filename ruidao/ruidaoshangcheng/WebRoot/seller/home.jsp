<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
		body
		{
			SCROLLBAR-ARROW-COLOR: #ffffff;  SCROLLBAR-BASE-COLOR: #dee3f7;
		}
    </style>
    <script type="text/javascript">
		function tuichudenglu(){
			var isDel = confirm("您确认要推出吗？");
				if(isDel){
					//要删除
					location.href = "${pageContext.request.contextPath}/sellerservlet?m=tuichu;
				}
		}
	</script>
  </head>
  
<frameset rows="103,*,43" frameborder=0 border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="NO" noresize>
  <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
		<frame src="left.jsp" name="leftFrame" noresize scrolling="YES">
		<frame src="welcome.jsp" name="mainFrame">
  </frameset>
  <frame src="bottom.jsp" name="bottomFrame" scrolling="NO"  noresize>
</frameset>
</html>