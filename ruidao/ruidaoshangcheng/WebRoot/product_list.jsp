<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
 <script src="js/bootstrap.min.js" type="text/javascript"></script>
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
			  window.location.href="${pageContext.request.contextPath}/loginservlet?m=loginout";
			}
		</script>
		<style>
		.henxiang{
			text-align: center; 
			margin-top: 10px；
		}
		.henxiang li{
			list-style: none;
    display: inline-block;//使li对象显示为一行
			
		}
		</style>
  </head>
  <body style="width:1380px;">
  <jsp:include page="/header.jsp"></jsp:include>

		<div class="shangpin" style="width: 80%;height: 600px;margin-left:10%;">
    <c:forEach items="${pageBean.productList }" var="pro">

        <div class="col-md-2" style="height:50%;width:20%;float:left;">
            <a href="productservlet?m=infoofproduct&id=${pro.pid}">
                <img src="${pageContext.request.contextPath }/${pro.pimage}" width="170" height="170" style="display: inline-block;">
            </a>
            <p>
                <a href="productservlet?m=infoofproduct&id=${pro.pid}" style='color: green'>${pro.pname }</a>
            </p>
            <p>
                <font color="#FF0000">商城价：&yen;${pro.pprice}</font>
            </p>
        </div>
    </c:forEach>
</div>

	<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="henxiang" style="text-align: center; margin-top: 10px;">
		
			<!-- 上一页 -->
			<c:if test="${pageBean.currentPage==1 }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageBean.currentPage!=1 }">
				<li>
					<a href="${pageContext.request.contextPath}/productservlet?m=showlist&cid=${cid}&currentPage=${pageBean.currentPage-1 }" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			
		
			<!-- 显示每一页 -->
			<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
				<!-- 判断是否是当前页 -->
				<c:if test="${page==pageBean.currentPage }">
					<li class="active"><a href="javascript:void(0);">${page }</a></li>
				</c:if>
				<c:if test="${page!=pageBean.currentPage }">
					<li><a href="${pageContext.request.contextPath}/productservlet?m=showlist&cid=${cid}&currentPage=${page}">${page }</a></li>
				</c:if>
			</c:forEach>
			
			
			<!-- 下一页 -->
			<c:if test="${pageBean.currentPage==pageBean.totalPage }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
				<li>
					<a href="${pageContext.request.contextPath}/productservlet?m=showlist&cid=${cid}&currentPage=${pageBean.currentPage+1 }" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			
		</ul>
	</div>
	<jsp:include page="/aboutus.jsp"></jsp:include>
  </body>
</html>
