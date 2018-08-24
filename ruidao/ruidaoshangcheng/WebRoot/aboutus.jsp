<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>aboutus</title>
    <style>
        .aboutus {
            margin-top: 100px;
            height: 100px;
            width: 100%;
            text-align: center;
            text-height: 100px;
            background: aliceblue;
        }

        .aboutus div {
            height: 40%;
            width: 100%;
        }

        .aboutus a {
            margin-left: 40px;
            margin-right: 40px;
            text-decoration: none;
            color: dimgrey;
        }
    </style>
  </head>
  
  <body>
    <div class="aboutus" id="bottom">
    <div></div>
    <a href="#">新手上路</a><span></span>
    <a href="#">关于我们</a><span></span>
    <a href="#">联系我们</a><span></span>
    <a href="#">下载源码</a>
</div>
   </body>
</html>
