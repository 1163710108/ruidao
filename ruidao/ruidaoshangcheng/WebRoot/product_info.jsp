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
    <meta charset="UTF-8">
    <title>product_info</title>
    <script src="js/jquery-1.8.3.js"></script>
    <style>
        .biaoti {
            width:100%;
            height:40px;
            background-color: whitesmoke;
        }
        
        .biaoti div, span {
            float: left;
            height:100%;
            text-align: center;
            line-height:40px;
            margin-left:10px;
        }
        
        .biaoti a {
            text-decoration: none;
            color: #0f88eb;
        }
        
        .wupin  {
            width:80%;
            height:400px;
            margin-left:10%;
        }
        
        .wupin-tupian {
            width:50%;
            height:100%;
            float: left;
        }

        .wupin-tupian img {
            width:80%;
            height:80%;
            margin-left:10%;
            margin-top:5%;
        }
        
        .wupin-shuxing {
            width:50%;
            height:100%;
            float: left;
        }

        .wupin-shuxing-jiage {
            margin-top:10%;
            height:10%;
            width:100%;
        }

        .wupin-shuxing-remen {
            height:10%;
            width:100%;
            line-height:40px;
        }

        .wupin-shuxing-shuliang {
            height:40%;
            width:70%;
            background-color: darkgray;
        }

        .wupin-shuxing-shuliang-one {
            width:90%;
            height:30%;
            padding-top:5%;
            padding-left:10%;
        }

        .wupin-shuxing-shuliang-one-rongqi {
            width:100%;
            height:20px;
        }

        .wupin-shuxing-shuliang-two {
            width:65%;
            height:30%;
            padding-left:35%;
        }

        .jieshao {
            width:100%;
            height:200px;
        }

        .jieshao-biaoti {
            width:100%;
            height:40px;
            background-color:darkgray;
            line-height:40px;
        }


    </style>
    <script>
    	function tianjia(pid){
    		$.ajax({
					url:"productservlet?m=tianjiagouwuche&id="+pid,
					async:true,
					type:"POST",
					data:{"num":document.getElementById("num").value},
					success:function(data){
				},
				dataType:"json"
			});
    	}
    </script>
</head>

<body style="width:1380px">
<jsp:include page="header.jsp"></jsp:include>

<div class="biaoti" id = "biaoti">
    <div id = "shouye"><a href="index">首页</a></div><span>&gt;</span>
    <div id = "shangpin">${product.pname}</div>
</div>

<div class="wupin">
    <div class="wupin-tupian">
        <img src="${product.pimage}" alt="">
    </div>

    <div class="wupin-shuxing">
        <div class="wupin-shuxing-jiage">
            <span>商城价：</span>
            <span style="text-decoration:line-through;">￥${product.pprice}</span>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span>折扣价：</span>
            <span style="color:red">${product.pprice * product.pdiscount }</span>
        </div>
        <div class="wupin-shuxing-remen" id="wupin-shuxing-remen">&nbsp;&nbsp;&nbsp;热门</div>
        <c:if test="${product.pis_hot==0}">
            <script>
                    document.getElementById("wupin-shuxing-remen").innerHTML =""

                </script>
        </c:if>
        <div class="wupin-shuxing-shuliang">
            <div class="wupin-shuxing-shuliang-one">
                <div class="wupin-shuxing-shuliang-one-rongqi">
                    <div style="height:20px;float: left;">购买数量</div>
                    <input type="text" value="1" style="float: left;height: 20px;" id="num">
                    <font stylt="color:gray"> 商品数量 : ${product.pnumber } </font>
                </div>
            </div>
            <div class="wupin-shuxing-shuliang-two">
                <div><input type="button" value="加入购物车" style="background-color:orange;" onclick="tianjia(${product.pid})"></div>
                <div style="margin-top:10px;"><a href="dianpushouye?m=${product.pshop}" style="color:#000;font-weight: lighter;text-decoration: none;">进入店铺</a></div>
            </div>
        </div>
        
        
    </div>
</div>

<div class="jieshao">
    <div class="jieshao-biaoti">
        <h4 style="margin-left: 10%; line-height:40px;">商品介绍</h4>
    </div>

    <div class="jieshao-miaoshu">
        <textarea name="miaoshu" id="jieshao-miaoshu" cols="110" rows="10" style="font-size: 1.5em;margin-left: 10%;">${product.pdesc}</textarea>
    </div>
</div>

<jsp:include page="aboutus.jsp"></jsp:include>
</body>
</html>
