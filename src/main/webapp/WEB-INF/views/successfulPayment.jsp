<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${orderByOid.state == 1? "支付成功":"支付失败"}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function(){
            var count =0;
            $("[name='itemCount']").each(function(){
                count = count + parseFloat($(this).text());
            });
            $("#countAll").text(count);
        })
    </script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>

<!--内容开始-->
<div class="payment w1200">
    <div class="payment-hd">
        <h3 class="success">${orderByOid.state == 1? "支付成功":"支付失败"}</h3>
    </div>
    <c:forEach items="${orderByOid.orderItemExt}" var="orderItemExt" >
        <div class="payment-bd">
            <dl class="dl-hd">
                <dt><a href="#"><img src="${pageContext.request.contextPath}/resources/${orderItemExt.product.image}" style="width: 123px;height: 122px;" /></a></dt>
                <dd>
                    <h3><a href="#">${orderItemExt.product.pname}</a></h3>
                    <P>${orderItemExt.product.pdesc}</P>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <ul class="ul-bd">
                <li><span>规格</span><p>尺码：400mml坑距            颜色：白色</p></li>
                <li><span>促销</span><p><i>满赠</i>指定商品满1件，赠送卫欲无限 座便器配件三件套</p></li>
                <li><span>送货至</span><p>${orderByOid.addr}（包邮）</p></li>
                <li><span>价格</span><p><i>${orderItemExt.product.shop_price} 元</i></p></li>
                <li><span>卖家名称</span><p>向东食品专营店</p></li>
                <li><span>件数</span><p name="itemCount" >${orderItemExt.count}</p></li>
                <li><span>收货信息</span><p>${orderByOid.addr}, ${orderByOid.name},${orderByOid.phone}, 000000</p></li>
                <li><span>成交时间</span><p>${dat}</p></li>
                <li><span>订单号</span><p>${orderByOid.oid}</p></li>
            </ul>
        </div>
    </c:forEach>
    <div class="payment-bd">
    <ul class="ul-bd">
        <li><span>总数</span><p id="countAll"  ></p></li>
        <li><span>总计</span><p>${orderByOid.total} 元</p></li>
    </ul>
    </div>

    <div class="payment-ft">
        <form method="post" action="${pageContext.request.contextPath}/orders/findOrdersAll.do">
            <input type="hidden" name="uid" value="${orderByOid.uid}">
        <button class="btn2"> 我的订单 </button>
        </form>
    </div>
</div>

<!--底部一块-->
<%@include file="footer.jsp"%>

</body>
</html>
