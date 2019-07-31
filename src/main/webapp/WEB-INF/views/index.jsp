<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>中林首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/zhonglingxm2.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
</head>

<body id="top">
<!--header-->
<%@include file="header.jsp" %>

<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box">

                <c:forEach items="${allCategory}" var="all" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/resources/images/zl2-07.gif"/><a
                                    href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList.get(0).csid}">${all.cSecExtList.get(0).csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList.get(1).csid}">${all.cSecExtList[1].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList.get(2).csid}">${all.cSecExtList[2].csname}</a>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2">
                                <dt>
                                    <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a>
                                </dt>
                                <dd>
                                    <c:forEach items="${all.cSecExtList}" var="categorysecond">
                                        <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${categorysecond.csid}"> ${categorysecond.csname}</a><span>|</span>
                                    </c:forEach>

                                </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <ul class="nav-font f-l">

            <c:forEach items="${allCategory}" var="all" begin="0" end="7" varStatus="vs">
                <c:if test="${!vs.last}">
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a>
                    </li>
                </c:if>
                <c:if test="${vs.last}">
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a><span><img
                            src="${pageContext.request.contextPath}/resources/images/zl2-05.gif"/></span></li>
                </c:if>
            </c:forEach>

            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>

<!--banner-->
<div class="banner">
    <ul class="ban-ul1">
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/banner.png"/></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/banner.png"/></a></li>
    </ul>
    <div class="ban-box w1200">
        <ol class="ban-ol1">
            <li class="current"></li>
            <li></li>
            <li></li>
            <li></li>
            <div style="clear:both;"></div>
        </ol>
    </div>
</div>

<!--热门推荐-->
<div class="zl-tuijian w1200">
    <div class="tuijian-left f-l">
        <img src="${pageContext.request.contextPath}/resources/images/zl2-14.png"/>
    </div>
    <ul class="tuijian-right f-l">
        <li>
            <div class="li-box li-box1">
                <a href="JavaScript:;" class="li-a1">锦尚世家</a>
                <a href="JavaScript:;" class="li-a2">锦绣花苑　传承世家</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box2">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box3">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box4">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box5">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box6">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box7">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box8">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div style="clear:both;"></div>
</div>


<!--2F  餐饮娱乐-->
<c:forEach items="${categoryExt2}" var="category" varStatus="vs">
    <c:if test="${category.order==1}">
        <!--1F 在线商城-->
        <div class="zl-info w1200">
            <div class="zl-title1">
                <h3 class="title1-h3 f-l">${vs.count}F ${category.cname}</h3>
                <ul class="title1-ul1 f-r">
                    <c:forEach items="${category.cSecExtList}" var="categorySecond" varStatus="vvs">
                        <li ${vvs.index==0?"class='current'":""}  ><a href="JavaScript:;">${categorySecond.csname}</a>
                        </li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <div class="zl-con">
                <div class="zl-con-left f-l">
                    <div class="zl-tu">
                        <img src="${pageContext.request.contextPath}/resources/images/zl2-33.gif" class="zl-img"/>
                    </div>
                    <p class="zl-lp">
                        黑色星期五</br>
                        优惠力度大
                    </p>
                    <ul class="zl-lhover">
                        <c:forEach items="${allCategory}" var="allCategorySecond">
                            <c:if test="${allCategorySecond.cid==category.cid}">
                                <c:forEach items="${allCategorySecond.cSecExtList}" var="CategorySecondlist">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/productList.do?cid=${CategorySecondlist.cid}&csid=${CategorySecondlist.csid}">${CategorySecondlist.csname}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <div class="zl-con-right f-l">
                    <c:forEach items="${category.cSecExtList}" var="categorySecond">
                    <div class="zl-rbox lihover">
                        <div class="rbox-left f-l">
                                <c:forEach items="${categorySecond.productList}" var="product" varStatus="shu">
                                    <c:if test="${shu.count==1}">
                                        <div class="rbox-ltop"><a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}"><img src="${pageContext.request.contextPath}/resources/${product.image}" style="width: 569px;height: 259px;"/></a></div>
                                    </c:if>
                                </c:forEach>
                            <ul class="rbox-lft">
                                    <c:forEach items="${categorySecond.productList}" var="product" varStatus="shu">
                                        <c:if test="${shu.count<5&&shu.count>1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}" class="a1">${product.pname}</a>
                                                <p>￥${product.shop_price}/袋</p>
                                                <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}" class="a2"><img src="${pageContext.request.contextPath}/resources/${product.image}" style="width: 163px;height: 106px;"/></a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                        <ul class="rbox-right f-l">
                                <c:forEach items="${categorySecond.productList}" var="product" varStatus="shu">
                                    <c:if test="${shu.count<9&&shu.count>4}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}" class="a1">${product.pname}</a>
                                            <p>￥${product.shop_price}/袋</p>
                                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}" class="a2"><img src="${pageContext.request.contextPath}/resources/${product.image}" style="width: 163px;height: 106px;"/></a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                        <div style="clear:both;"></div>
                    </div>
                    </c:forEach>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </c:if>

    <c:if test="${category.order!=1}">
        <div class="zl-info w1200">
            <div class="zl-title1" style="border-color:#FF9A02;">
                <h3 class="title1-h3 f-l">${vs.count}F ${category.cname}</h3>
                <ul class="title1-ul1 title1-ul2 f-r">
                    <c:forEach items="${category.cSecExtList}" var="categorySecond" varStatus="vvs">
                        <li ${vvs.index==0?"class='current'":""}  ><a href="JavaScript:;">${categorySecond.csname}</a>
                        </li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <div class="zl-con">
                <div class="zl-con-left f-l" style="background:#FBEAD0;">
                    <div class="zl-tu">
                        <img src="${pageContext.request.contextPath}/resources/images/zl2-34.gif" class="zl-img"/>
                    </div>
                    <p class="zl-lp" style="color:#FF9901;">
                        周末，嗨起来</br>
                        兄弟，躁起来
                    </p>
                    <ul class="zl-lhover" style=" background:#FF9A02;">
                        <c:forEach items="${allCategory}" var="allCategorySecond">
                            <c:if test="${allCategorySecond.cid==category.cid}">
                                <c:forEach items="${allCategorySecond.cSecExtList}" var="CategorySecondlist">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/productList.do?cid=${CategorySecondlist.cid}&csid=${CategorySecondlist.csid}">${CategorySecondlist.csname}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <div class="zl-con-right f-l">
                    <c:forEach items="${category.cSecExtList}" var="categorySecond">
                        <ul class="zl-rul1 lihover">
                            <c:forEach items="${categorySecond.productList}" var="product" varStatus="shu">
                                <c:if test="${shu.count<8}">
                                    <li>
                                        <div class="sy-tu1">
                                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}"><img
                                                    src="${pageContext.request.contextPath}/resources/${product.image}"/></a>
                                        </div>
                                        <div class="sy-tit1">
                                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}">${product.pname}</a>
                                        </div>
                                        <div class="sy-tit2">
                                            <p>
                                                <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}">${product.pdesc}</a>
                                            </p>
                                            <p>价格：${product.shop_price}${shu.count}</p>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                    </c:forEach>

                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </c:if>

</c:forEach>


<!--底部一块-->
<%@include file="footer.jsp" %>

<!--固定右侧-->
<ul class="youce">
    <li class="li1">
        <a href="${pageContext.request.contextPath}/index.do" class="li1-tu1"><img
                src="${pageContext.request.contextPath}/resources/images/zl2-94.png"/></a>
        <a href="${pageContext.request.contextPath}/index.do" class="li1-zi1">返回首页</a>
    </li>
    <li class="li2">
        <a href="${pageContext.request.contextPath}/cart/listCart.do"><img
                src="${pageContext.request.contextPath}/resources/images/zl2-95.png"/>购</br>物</br>车</a>
    </li>
    <li class="li3">
        <a href="#" class="li1-tu2"><img src="${pageContext.request.contextPath}/resources/images/zl2-96.png"/></a>
        <a href="#" class="li1-zi2">我关注的品牌</a>
    </li>
    <li class="li3">
        <a href="浏览记录.html" class="li1-tu2"><img src="${pageContext.request.contextPath}/resources/images/zl2-97.png"/></a>
        <a href="浏览记录.html" class="li1-zi2">我看过的</a>
    </li>
    <li class="li4">
        <a href="JavaScript:;" class="li1-tu2"><img
                src="${pageContext.request.contextPath}/resources/images/zl2-98.gif"/></a>
        <div class="li4-ewm">
            <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/zl2-101.gif"/></a>
            <p>扫一扫</p>
        </div>
    </li>
    <li class="li3 li5">
        <a href="#top" class="li1-tu2"><img src="${pageContext.request.contextPath}/resources/images/zl2-99.gif"/></a>
        <a href="#top" class="li1-zi2">返回顶部</a>
    </li>
</ul>


</body>
</html>
