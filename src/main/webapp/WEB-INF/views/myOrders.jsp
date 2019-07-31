<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购买记录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#tiaoye").click(function () {
                var page = $("#page").val();
                if(page.trim()==null||page.trim()==""){
                    return ;
                }
                if (page < 1) {
                    page = 1;
                    $("#page").val("1");
                }
                if (page >${orderAll.page.totalPage}) {
                    page = ${orderAll.page.totalPage};
                    $("#page").val("${orderAll.page.totalPage}");
                }
                window.location.href = "${pageContext.request.contextPath}/orders/findOrdersAll.do?&pageTYF=ty&pageNow="+page;
            });

        });
        function deleteOrder(oid) {
            var arrayObj = new Array();
            $("[name='itemid"+oid+"']").each(function(){
                arrayObj.push($(this).val());
            });
            var orderItem="";
            for(i=0;i<arrayObj.length;i++){
                orderItem = orderItem+arrayObj[i]+","
            }

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/orders/deleteOrder.do",
                data: {
                    "order":oid,
                    "orderItem":orderItem,

                     },
                datatype: "json",
                success: function (data) {
                    if(data=="ok"){
                        $("#"+oid).remove();
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
                }
            })


        }

        function buy(oid) {
            var arrayObj = new Array();
            $("[name='pid"+oid+"']").each(function(){
                arrayObj.push($(this).val());
            });
            var pid="";
            for(i=0;i<arrayObj.length;i++){
                pid = pid+arrayObj[i]+","
            }
            var arrayObj1 = new Array();
            $("[name='count"+oid+"']").each(function(){
                arrayObj1.push($(this).val());
            });
            var count="";
            for(j=0;j<arrayObj1.length;j++){
                count = count+arrayObj1[j]+","
            }
            window.location.href="${pageContext.request.contextPath}/cart/inPurchaseAddCart.do?count="+count+"&pid="+pid;
        }

    </script>
</head>

<body>
<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>

<!--nav-->
<%@include file="nav.jsp"%>

<!--内容开始-->
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="${pageContext.request.contextPath}/user/gerenziliao.do">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="${pageContext.request.contextPath}/cart/listCart.do">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="purchase-records f-r">
        <div class="pr-tit">
            <P class="pr-p1" style="width: 180px;height: 44px;">宝贝</P>
            <P class="pr-p2" style="width: 140px;height: 44px;">单价(元)</P>
            <P class="pr-p3"  style="width: 140px;height: 44px;">数量</P>
            <P class="pr-p4"  style="width: 160px;height: 44px;">实付款(元)</P>
            <P class="pr-p5">交易状态</P>
            <P class="pr-p6">交易操作</P>
        </div>
        <c:forEach items="${orderAll.lists}" var="order" varStatus="v">
            <div class="pr-info" id="${order.oid}">
                <div class="pr-tit2">
                    <c:forEach items="${datetime}" var="dat" varStatus="vs" >
                        <c:if test="${v.count==vs.count}">
                            <p class="pr-p1" style=" margin-left: 25px; width: 290px;height: 44px">时 间:${dat}</p>
                        </c:if>
                    </c:forEach>
                    <p class="pr-p2" style="width: 250px;height: 44px" >订单号：${order.oid}</p>
                    <p class="pr-a1" style="width: 155px;height: 44px" ><a href="${pageContext.request.contextPath}/payment/successfulPayment.do?oid=${order.oid}&orderDetails=t">总计:${order.total}元</a></p>
                    <p class="pr-a1" style="width: 130px;height: 44px" ><a style="cursor: pointer;" herf="javascript;" onclick="buy('${order.oid}')" >再次购买</a></p>
                    <a class="pr-a2" style="cursor:pointer;" onclick="deleteOrder('${order.oid}')" >删除</a>
                </div>
                <c:forEach items="${order.orderItemExt}" var="orderItem">
                    <div class="pr-con">
                        <div class="pr-con-tu f-l">
                            <input type="hidden" value="${orderItem.itemid}" name = "itemid${order.oid}" />
                            <input type="hidden" value="${orderItem.product.pid}" name = "pid${order.oid}" />
                            <input type="hidden" value="${orderItem.count}" name = "count${order.oid}" />
                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderItem.pid}"><img src="${pageContext.request.contextPath}/resources/${orderItem.product.image}" style="width:80px;" /></a>
                        </div>
                        <a class="pr-con-bt f-l" href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderItem.pid}" style="width: 90px;height: 50px;">${orderItem.product.pname}</a>
                        <div class="pr-con-sz1 f-l">
                            <span>${orderItem.product.shop_price}</span>
                            <p>${orderItem.product.shop_price}</p>
                        </div>
                        <p class="pr-con-sl f-l" >数量:${orderItem.count}</p>
                        <div class="pr-con-yf f-l">
                            <p>${orderItem.subtotal}</p>
                            <span>(含运费：0.00 )</span>
                        </div>
                        <div class="pr-con-jiaoyi f-l">
                            <a href="${pageContext.request.contextPath}/payment/successfulPayment.do?oid=${order.oid}&orderDetails=t">${order.state == 1? "交易成功":"交易失败"}</a>
                            <a href="${pageContext.request.contextPath}/payment/successfulPayment.do?oid=${order.oid}&orderDetails=t">订单详情</a>
                        </div>
                        <div class="pr-con-pj f-l">
                            <a href="${pageContext.request.contextPath}/evaluation/myEvaluation.do?oid=${order.oid}&itemid=${orderItem.itemid}">评价</a>
                            <a href="${pageContext.request.contextPath}/cart/addCart.do?inPurchase=t&count=${orderItem.count}&pid=${orderItem.product.pid}">再次购买</a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </c:forEach>

            </div>
        </c:forEach>

        <!--分页-->
        <div class="paging">
            <div class="pag-left f-l">

                <a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=1" class="about left-r f-l"><</a>
                <c:if test="${orderAll.page.preGroupForPage!=-1}">
                    <li ><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=${orderAll.page.preGroupForPage}">...</a></li>
                </c:if>
                <ul class="left-m f-l">
                    <c:forEach items="${orderAll.page.pages}" var="pagei" >
                        <li class="${pagei==orderAll.page.nowPage?"current":""}"><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=${pagei}">${pagei}</a></li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                <c:if test="${orderAll.page.nextGroupForPage!=-1}">
                    <li ><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=${orderAll.page.nextGroupForPage}">...</a></li>
                </c:if>
                <c:if test="${orderAll.page.nextGroupForPage!=-1}">
                    <li ><a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=${orderAll.page.totalPage}">${orderAll.page.totalPage}</a></li>
                </c:if>
                <a href="${pageContext.request.contextPath}/orders/findOrdersAll.do?pageNow=${orderAll.page.totalPage}" class="about left-l f-l">></a>
                <div style="clear:both;"></div>
            </div>
            <div class="pag-right f-l">
                <div class="jump-page f-l">
                    到第 <input  id="page" value="${pageTYF}" type="number" max="${orderAll.page.totalPage}" maxlength="3" min="1" />页
                </div>
                <button class="f-l" id="tiaoye" >确定</button>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>


<!--底部一块-->
<%@include file="footer.jsp"%>

</body>
</html>
