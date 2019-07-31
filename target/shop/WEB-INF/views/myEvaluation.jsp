<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我要评价</title>
   <%-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/star-rating.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/star-rating.js"></script>
    <style type="text/css">
        .search .search-info{ width:596px; height:40px;}
        .search-info input{ width:494px;}
    </style>
</head>

<body>
<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>

<!--nav-->
<%@include file="nav.jsp"%>

<!--内容开始-->
<div class="evaluate w1200">
    <dl class="eva-info1">
        <dt><a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderitemByItemid.pid}"><img src="${pageContext.request.contextPath}/resources/${orderitemByItemid.product.image}" style="width: 221px;height: 216px;" /></a></dt>
        <dd>
            <h3><a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderitemByItemid.pid}">${orderitemByItemid.product.pname}</a></h3>
            <ul>
                <li>
                    <span>价格</span><p class="p1">¥ ${orderitemByItemid.product.shop_price} 元</p>
                </li>
                <li>
                    <span>配送</span><p>快递:  0.00</p>
                </li>
                <li>
                    <span>评价</span><p>4.8分 (累计评价 43227 )</p>
                </li>
                <li>
                    <span>颜色分类</span><p>长410ML*2，赠餐具</p>
                </li>
                <li>
                    <span>订单号</span><p>${oid}</p>
                </li>
            </ul>
        </dd>
        <div style="clear:both;"></div>
    </dl>
    <dl class="eva-info2">
        <dt>
            <p class="p1">好评率</p>
            <p class="p2">96.5%</p>
            <p class="p3">共539人评论</p>
        </dt>
        <dd>
            <p>买过的人觉得</p>
            <ul>
                <li><a href="#">香脆可口(198)</a></li>
                <li><a href="#">口感不错(160)</a></li>
                <li><a href="#">分量足(84)</a></li>
                <li><a href="#">味道不错(47)</a></li>
                <li><a href="#">价格便宜(34)</a></li>
                <li><a href="#">包装不错(30)</a></li>
                <li><a href="#">吃货必备(26)</a></li>
                <li><a href="#">送货快(14)</a></li>
                <li><a href="#">孩子喜欢(4)</a></li>
                <div style="clear:both;"></div>
            </ul>
        </dd>
        <div style="clear:both;"></div>
    </dl>
    <div class="eva-info3">
        <div class="eva-if3-l f-l">
            <dl class="if3-l-dl1">
                <dt>商品评价</dt>
                <dd><textarea></textarea></dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="if3-l-dl2">
                <dt>服务评价</dt>
                <dd><textarea></textarea></dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="if3-l-dl3">
                <dt>晒图片</dt>
                <dd>
                    <a href="JavaScript:;">
                        <img src="${pageContext.request.contextPath}/resources/images/dl3-tu1.gif" />
                        <input type="file" class="img1" />
                    </a>
                    <a href="JavaScript:;">
                        <img src="${pageContext.request.contextPath}/resources/images/dl3-tu2.gif" />
                        <input type="file" class="img1" />
                    </a>
                    <p>上传图片     1/5</p>
                    <div style="clear:both;"></div>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <button class="eva-btn">提交评价</button>
        </div>
        <div class="eva-if3-r f-l">
            <ul>
                <li>
                    <p class="p1"><span>*</span> 描述相符</p>
                    <form style="display:inline-block;">
                        <input id="input-21e1" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                    </form>
                </li>
                <li>
                    <p class="p1"><span>*</span> 卖家服务</p>
                    <form style="display:inline-block;">
                        <input id="input-21e2" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                    </form>
                </li>
                <li>
                    <p class="p1"><span>*</span> 物流服务</p>
                    <form style="display:inline-block;">
                        <input id="input-21e3" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                    </form>
                </li>
            </ul>
            <p class="eva-fen">2分-4分为一般</p>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@include file="footer.jsp"%>
</body>
</html>
