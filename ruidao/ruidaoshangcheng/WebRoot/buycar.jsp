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
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
    <title>购物车</title>
    
    <link rel="stylesheet" href="css/buycar.css">
    <script src="js/jquery-1.8.3.js"></script>
    <script >
        function SelectAll() {
            var checkboxs=document.getElementsByName("select");
            if(document.getElementById("allselect").checked==true)
                for (var i=0;i<checkboxs.length;i++) {
                    var e=checkboxs[i];
                    e.checked=true;
                }
            if(document.getElementById("allselect").checked==false)
                for (var i=0;i<checkboxs.length;i++) {
                    var e=checkboxs[i];
                    e.checked=false;
                }
        }
    </script>
    
  </head>
  
  <body>
<div class="buycarhead">
    <div class="head1">
        <ul>
            <li><a href="index" target="_blank">睿道首页</a></li>
            <li><a href="#" target="_blank">我的订单</a></li>
        </ul>
    </div>
    <div class="head2">
        <ul>
            <li><a href="#">个人中心</a></li>
            <li><a href="#">了解我们</a></li>
            <li><a href="#">友情链接</a></li>
            <li><a href="#">分享睿道商城</a></li>

        </ul>
    </div>
</div>
<div class="buycarsecond">
    <div class="buycarlogo"><img src="images/logo.png" height="95px" width="130px"/>
    </div>
    <form class="bucaysearch" action="#"  name="search" method="get">
        <input type="text" class="bsearch" name="searchtext" placeholder="  输入查询物品">
        <input type="submit" value="搜索 " class="bsubmmit">
    </form>
</div>
<div class="buycarbody">
    <div id="buycarcontent">
        <div class="contenthead">
            <div class="allselect">
                <input type="checkbox" id="allselect" onclick="SelectAll();">
                <div>全选</div>
            </div>
            <div class="buycartext1">商品</div>
            <div class="buycartext2">单价</div>
            <div class="buycartext2 bt2buchong">数量</div>
            <div class="buycartext2">小计</div>
            <div class="buycartext2">操作</div>
        </div>

        <c:forEach items="${cart.list}" var="cartitem" varStatus="vs">
            <div class="product1" id="product${vs.count}">
                <div class="bchoose"><input type="checkbox" name="select" checked="true">选择</div>
                <div class="bproduct">
                    <img src="${cartitem.product.pimage}"/>
                    <div>${cartitem.product.pname}</div>
                </div>
                <script>price = ${cartitem.product.pprice*cartitem.product.pdiscount}</script>
                <div class="bprice" id="price${vs.count}">
                    <script>document.getElementById("price${vs.count}").innerHTML ="<div>￥"+price+"</div>"</script>
                </div>
                <div class="bnumber" >
                    <button onclick="
                if( document.getElementById('number${vs.count}').value>0)
                         document.getElementById('number${vs.count}').value--;
              document.getElementById('prices${vs.count}').innerHTML ='<div> <b>￥'+
                document.getElementById('number${vs.count}').value*price+'</b></div>';
            ">
                        -</button>
                    <input type="text" id="number${vs.count}" value="${cartitem.buyNum}">
                    <button onclick="
                 document.getElementById('number${vs.count}').value++;
                 document.getElementById('prices${vs.count}').innerHTML ='<div> <b>￥'+
                document.getElementById('number${vs.count}').value*price+'</b></div>';
                ">+</button>
                </div>
                <div class="bprice" id="prices${vs.count}">
                    <script>
                        document.getElementById("prices${vs.count}").innerHTML ="<div> <b>￥"+
                                document.getElementById('number${vs.count}').value*price+" </b></div>"

                    </script>
                </div>
                <div class="btodo"><a href="productservlet?m=yichugouwuche&id=${cartitem.product.pid}">从购物车删除</a></div>
            </div>
        </c:forEach>

        <div class="contentend">
            <div class="dizhi">
                <div>地址</div>
                <select name="" id="">
                    <option value="1" selected >北京朝阳区三环到四环之间</option>
                    <option value="2">哈尔滨工业大学2公寓</option>
                    <option value="3">any where </option>
                </select>
            </div>
            <div class="kongbai"></div>
            <div class="jiesaun">
                <a href="orderservlet?m=tijiao">结算</a>
                <div>￥${cart.total}</div>
            </div>
        </div>
    </div>
</div>
<div class="buycarfoot"></div>
<script>
</script>
</body>
  </body>
</html>
