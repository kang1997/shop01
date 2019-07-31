<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>

    <script type="text/javascript">
        $(function(){
            $("#subOrders").click(function(){
                $("#subOrders").prop({"type":"button"});
                var a = true ;
                var b = true ;
                var c = true ;
                var rsg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}/;
                if($("#name").val().trim()==null||$("#name").val().trim()==""){
                    a = false;
                    $("#namespan").html("<font color='red'>姓名不能为空号</font>");
                    setTimeout("$('#namespan').html('')",3000);
                }
                if($("#addr").val().trim()==null||$("#addr").val().trim()==""){
                    b = false;
                    $("#addrspan").html("<font color='red'>地址不能为空号</font>");
                    setTimeout("$('#addrspan').html('')",3000);
                }
                if($("#phone").val().trim()==null||$("#phone").val().trim()==""){
                    c = false;
                    $("#phonespan").html("<font color='red'>手机号不能为空号</font>");
                    setTimeout("$('#phonespan').html('')",3000);
                }
                if (rsg.test($("#phone").val().trim()) == false) {
                    $("#phonespan").html("<font color='red'>请输入正确的手机格式</font>");
                    setTimeout("$('#phonespan').html('')",3000);
                    c = false;
                }
                if(a==true&&b==true&&c==true){
                    $("#subOrders").prop({"type":"submit"});
                }
            })
        })


    </script>
</head>

<body style="position:relative;">

<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>


<!--内容开始-->
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>确认收货地址、姓名、手机号</h3>
        </div>
        <ul class="pay-dz">
            <form id="ordersform" method="post" action="${pageContext.request.contextPath}/payment/paymentInterface.do">
            <li class="current">
                <h3><span class="sp1">地   址：</span> <input id="addr" name="addr" type="text" value="${loginUser.addr}"/></h3>
                <span class="sp1" id="addrspan"></span>
            </li>
            <li class="current">
                <p><span class="sp1">姓   名：</span> <input id="name" name="name" type="text" value="${loginUser.name}"/></br>
                    <span class="sp1" id="namespan"></span>
            </li>
            <li class="current">
                <p><span class="sp1">手机号：</span> <input id="phone" name="phone" type="text" value="${loginUser.phone}"/></br>
                    <span class="sp1" id="phonespan"></span>
            </li>
                <input id="oid" name="oid" type="hidden" value="${orderByOid.oid}"/>
            </form>
            <div style="clear:both;"></div>
        </ul>
        <P class="pay-xgdz">修改地址和使用新地址样式一样。</P>
       <%-- <button class="pay-xdz-btn">使用新地址</button>--%>
    </div>

    <!--订单-->
    <div class="pay-info">
        <div class="info-tit" style="border-bottom:0;">
            <h3>订单信息</h3>
        </div>
    </div>

        <div class="cart-con-info">
            <div class="cart-con-tit" style="margin:20px 0 5px;">
                <p class="p1" style="width:400px;">
                        <%-- <input type="checkbox" value="" name="hobby"></input>--%>
                    <span>商品信息</span>
                </p>
                <p class="p3" style="width:145px;">规格</p>
                <p class="p4" style="width:130px;">数量</p>
                <p class="p8" style="width:75px;">运费</p>
                <p class="p5">单价（元）</p>
                <p class="p6" style="width:173px;">金额（元）</p>
                <p class="p7">配送方式</p>
            </div>
            <c:forEach items="${orderByOid.orderItemExt}" var="orderItemExt" >
            <div class="info-mid">
                <div class="mid-tu f-l">
                    <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderItemExt.product.pid}"><img src="${pageContext.request.contextPath}/resources/${orderItemExt.product.image}" style="width: 82px;" /></a>
                </div>
                <div class="mid-font f-l" style="margin-right:40px;">
                    <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${orderItemExt.product.pid}" style="width: 230px;" >${orderItemExt.product.pname}</a>
                </div>
                <div class="mid-guige1 f-l" style="margin-right:40px;">
                    <p>颜色：蓝色</p>
                    <p>尺码：XL</p>
                </div>
                <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                    <input style="width: 100px;" type="text" readonly unselectable="on" required ondragstart="return false;" value="${orderItemExt.count}"   />
                </div>
                <p class="mid-yunfei f-l">¥ 0.00</p>
                <p class="mid-dj f-l">${orderItemExt.product.shop_price}</p>
                <p class="mid-je f-l" style="margin:10px 46px 0px 0px;">${orderItemExt.subtotal}</p>
                <div class="mid-chaozuo f-l">
                    <select>
                        <option>送货上门</option>
                        <option>快递包邮</option>
                    </select>
                </div>
                <div style="clear:both;"></div>
            </div>
            </c:forEach>
            <div class="info-heji">
                <p class="f-r">店铺合计(含运费)：<span>${orderByOid.total}</span></p>
                <h3 class="f-r">订单号：${orderByOid.oid}</h3>
            </div>
            <div class="info-tijiao">
                <p class="p1">实付款：<span>${orderByOid.total}</span></p>
                <button class="btn" type="submit" id="subOrders" form="ordersform" >提交订单</button>
            </div>
        </div>


</div>

<!--底部一块-->
<%@include file="footer.jsp"%>

<!--确认订单（新增地址）-->
<%--<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/resources/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>新疆</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>乌鲁木齐</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/resources/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>北京</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>天安门</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" class="shxm" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" class="lxdh" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>--%>
</body>
</html>
