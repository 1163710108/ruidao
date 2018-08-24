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
    <title>睿道商城-个人资料</title>
    <script src="js/jquery-1.8.3.js"></script>
    <script>

        function jump(){
            window.location.href = "http://localhost:63342/untitled/html/zhuye.html?_ijt=s8fic8ptp8m4bo5bip8q3k0jn2";
        }

        function chongzhi(){
            window.location.reload();
        }
    </script>

    <style>

        .logo2 {
            width:100%;
            height:55px;
            background-color: yellow;
            display: flex;
        }

        .logo2-rongqi {
            width:20%;
            height:100%;
        }

        .logo2-rongqi-logo {
            cursor: pointer;
        }


        .logo2-ziti {
            font-family:方正舒体;
            font-size:50px;
            color: red;
            margin-left:50px;
        }

        .window {
            height:600px;
            width:70%;
            margin-left:15%;
            border:1px solid #000;
            border-top:none;
        }

        .window-xiala {
            size: 1;
        }
    </style>

</head>
<body style="width:1380px;">

<jsp:include page="header.jsp"></jsp:include>
<div class = "logo2">
    <div class = "logo2-rongqi">
        <div class = "logo2-rongqi-logo" onclick = jump()><font class = "logo2-ziti">睿道商城</font></div>
    </div>

    <h2>个人资料</h2>
</div>

<div class = "window">
    <div class = "window-touxiang" style = "margin: 0 auto; width: 80px;">
        <a href="javascript:void(0);"><img src="images/denglu.jpg" alt="" style = "width: 60px; height: 60px;"></a>
        <div><a href="javascript:void(0);" style = "text-decoration: none; color: #000;">更换头像</a></div>
    </div>

    <form action="username" class = "window-others" style = "margin: 0 auto; width: 300px;" method = "post">
        <p>
            <span class = "window-biaoqian">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
            <span><input type="text" class = "window-nicheng" value="${login_user.uusername}" name="username"></span>
        </p>
        <p>
            <span class = "window-biaoqian">出生时间</span>
            <input type="date" id = "date" value = "${login_user.udate}" style = "width: 158px;" name="date">
        </p>
        <p>
            <span class = "window-biaoqian">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
            <c:if test="${login_user.usex=='男'}">
                <span><input type="radio" name = "sex" value = "男" checked = "checked">男</span>
                <span><input type="radio" name = "sex" value = "女">女</span>
            </c:if>

            <c:if test="${login_user.usex=='女'}">
                <span><input type="radio" name = "sex" value = "男">男</span>
                <span><input type="radio" name = "sex" value = "女" checked = "checked">女</span>
            </c:if>
            
        </p>
        <p>
            <span class = "window-biaoqian">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</span>
            <span><input type="text" class = "shouji" value="${login_user.utelephone}" name="telephone"></span>
        </p>
        <p>
            <span class = "window-biaoqian">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
            <span><input type="text" class = "shouji" value="${login_user.uemail}" name="email"></span>
        </p>
        <p>
            <span class = "window-biaoqian">修改密码</span>
        </p>
        <p>
            <span class = "window-biaoqian">旧&nbsp;密&nbsp;码&nbsp;</span>
            <span><input type="password" class = "window-modifypassword" name="oldpassword" value="${login_user.upassword}"></span>
        </p>
        <p>
            <span class = "window-biaoqian">新&nbsp;密&nbsp;码&nbsp;</span>
            <span><input type="password" class = "window-newpassword" name="newpassword" value="${login_user.upassword}"></span>
        </p>
        <p>
            <span class = "window-biaoqian">确认密码</span>
            <span><input type="password" class = "window-newpassword2" name="newpassword2" value="${login_user.upassword}"></span>
        </p>
        <p>
            <span><input type="submit" style = "margin-left: 20%; float: left;"></span>
            <span><input type="button" value = "重置" onclick = "chongzhi()" style = "margin-left: 20%;  float: left;">
            </span>
        </p>
    </form>
</div>

<jsp:include page="aboutus.jsp"></jsp:include>
</body>
</html>