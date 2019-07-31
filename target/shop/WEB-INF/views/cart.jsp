<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript">

        $(function () {
            $("[name='leftBtn']").click(function () {
                var count = $(this).next().val();
                var pid = $(this).next().prop("id");
                changeCount(pid, count)
            });
            $("[name='rightBtn']").click(function () {
                var count = $(this).prev().val();
                var pid = $(this).prev().prop("id");
                changeCount(pid, count);
            });

            $("#deleteAll").click(function () {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/cart/deleteItemAll.do",
                    datatype: "text",
                    success: function (data) {
                        $("#deleAll").remove();
                        $("#total").text("0.0");
                        $("#sum").text("0.0");
                    }
                });
            });

        });

        function changeCount(pid, count) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/cart/changeCountCart.do",
                data: {
                    "count": count,
                    "pid": pid,
                },
                datatype: "text",
                success: function (data) {
                    /*后端传过来的总计
                    $("#total").text(data);*/
                    getTotal();
                }
            });
        }

        function deleteItem(pid) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/cart/deleteItem.do",
                data: {
                    "pid": pid,
                },
                datatype: "text",
                success: function (data) {
                    $("#d" + pid).remove();
                    /*后端传过来的总计
                    $("#total").text(data);*/
                    getTotal();
                }
            });
        }


        //js计算总计
        function getTotal(){
            var total =0.0;
            var sum = 0.0;
            $("[name='subTotal']").each(function () {
                    total = total + parseFloat($(this).text());
            })
            $("[name='cartpid']").each(function(){
                sum = sum + parseFloat($(this).val());
            })

            $("#total").text(total);
            $("#sum").text("全部商品"+sum+"个");
        }

    </script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp" %>


<!--内容开始-->
<div class="cart-content w1200">
    <ul class="cart-tit-nav">
        <li class="current"><a id="sum">全部商品 ${cart.sum}个</a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="cart-con-tit">
        <p class="p1">
            <input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>
        </p>
        <p class="p2">商品信息</p>
        <p class="p3">规格</p>
        <p class="p4">数量</p>
        <p class="p5">单价（元）</p>
        <p class="p6">金额（元）</p>
        <p class="p7">操作</p>
    </div>

    <div id="deleAll">
        <c:forEach items="${cart.cartItemsList}" var="cartItem">
            <div class="cart-con-info" id="d${cartItem.product.pid}">
                <div class="info-mid">
                    <input type="checkbox" value="" name="hobby" class="mid-ipt f-l"></input>
                    <div class="mid-tu f-l">
                        <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${cartItem.product.pid}"><img src="${pageContext.request.contextPath}/resources/${cartItem.product.image}"
                                         style="width: 90px;height:80px;"/></a>
                    </div>
                    <div class="mid-font f-l">
                        <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${cartItem.product.pid}"><p style="width: 230px;">${cartItem.product.pname}</p></a>
                        <span>满赠</span>
                    </div>
                    <div class="mid-guige f-l">
                        <p>颜色：蓝色</p>
                        <p>尺码：XL</p>
                        <a href="JavaScript:;" class="xg" xg="xg1">修改</a>
                        <div class="guige-xiugai" xg-g="xg1">
                            <div class="xg-left f-l">
                                <dl>
                                    <dt>颜 色</dt>
                                    <dd>
                                        <a href="JavaScript:;" class="current">黑色</a>
                                        <a href="JavaScript:;">白色</a>
                                    </dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>尺 码</dt>
                                    <dd>
                                        <a href="JavaScript:;" class="current">M</a>
                                        <a href="JavaScript:;">L</a>
                                        <a href="JavaScript:;">XL</a>
                                    </dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <a href="JavaScript:;" class="qd">确定</a>
                                <a href="JavaScript:;" class="qx" qx="xg1">取消</a>
                            </div>
                            <div class="xg-right f-l">
                                <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${cartItem.product.pid}"><img
                                        src="${pageContext.request.contextPath}/resources/${cartItem.product.image}" style="width: 72px;" /></a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                    <div class="mid-sl f-l">
                        <a href="JavaScript:;" name="leftBtn" class="sl-left">-</a>
                        <input name="cartpid" id="${cartItem.product.pid}" type="text" readonly unselectable="on"
                               value="${cartItem.itemCount}"/>
                        <a href="JavaScript:;" name="rightBtn" class="sl-right">+</a>
                    </div>
                    <p class="mid-dj f-l">¥ <span>${cartItem.product.shop_price}</span></p>
                    <p class="mid-je f-l">¥ <span name="subTotal">${cartItem.subTotal}</span></p>
                    <div class="mid-chaozuo f-l">
                        <a href="JavaScript:;" onclick="deleteItem(${cartItem.product.pid})">删除</a>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="cart-con-footer">
        <div class="quanxuan f-l">
            <input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>
            <a id="deleteAll" style="cursor:pointer">删除</a>
        </div>
        <div class="jiesuan f-r">
            <div class="jshj f-l">
                <p>合计（不含运费）</p>
                <p class="jshj-p2">
                    ￥：<span id="total">${cart.total}</span>
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/orders/addOrders.do" class="js-a1 f-l">结算</a>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@include file="footer.jsp" %>
</body>
</html>

