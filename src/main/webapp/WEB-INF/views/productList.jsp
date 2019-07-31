<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索列表页(搜索商家)</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#tiaoye").click(function () {
                var page = $("#page").val();
                if(page.trim()==null||page.trim()==""){
                    return ;
                }
                if (page < 1) {
                    page = 1;
                    $("#page").val("1");
                }
                if (page >${productByCid.totalPage}) {
                    page = ${productByCid.totalPage};
                    $("#page").val("${productByCid.totalPage}");
                }
                window.location.href = "${pageContext.request.contextPath}/product/productList.do?&pageTYF=ty&cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=" + page;
            });

            var addCarts = $("[name = 'addCart']");
            addCarts.click(function () {
                var pid = $(this).val();
                var count = $(this).parent().prev().children("[name = 'count']").text();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/cart/addCart.do",
                    data: {
                        "pid": pid,
                        "count": count
                    },
                    datatype: "text",
                    success: function (data) {
                        alert(data + "${cart}");
                    }
                });
            });

        })

    </script>

</head>

<body>

<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<!--内容开始-->
<!--筛选结果-->
<div class="screening-results w1200">
    <p class="tiao">共找到${productByCid.total}条商品</p>
    <div class="results">
        <p class="re-p1 f-l">
            全部结果：${nowCategory.cname} >
            <span>品牌：${empty nowCategorySecond?nowCategory.cname:nowCategorySecond.csname}　</span> >
        </p>
        <div class="re-search f-l">
            <form action="${pageContext.request.contextPath}/product/productList.do" method="get">
                <input type="text" id="pname" name="pname" value="${empty productWapper.cid?"":productWapper.pname}"
                       placeholder="${empty nowCategorySecond?nowCategory.cname:nowCategorySecond.csname}" class="f-l"/>
                <input type="hidden" name="cid" value="${nowCategory.cid}"/>
                <input type="hidden" name="${empty nowCategorySecond?"":"csid"}"
                       value="${empty nowCategorySecond?"":nowCategorySecond.csid}"/>
                <button type="submit"></button>
            </form>
            <div style="clear:both;"></div>
        </div>
        <p class="re-p2 f-r">
            <a href="#">清空筛选条件</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>
<!--品牌热销-->
<div class="brand-sales">
    <dl style="border-bottom:none;">
        <dt>${nowCategory.cname} >></dt>
        <dd>
            <c:forEach items="${nowCategory.cSecExtList}" var="categorySecond">
                <a href="${pageContext.request.contextPath}/product/productList.do?csid=${categorySecond.csid}">${categorySecond.csname}</a>
            </c:forEach>
        </dd>
        <div style="clear:both;"></div>
    </dl>
</div>

<!--内容↓↑-->
<div class="shop-page-con w1200">
    <div class="shop-pg-left f-l" style="width:215px">
        <div class="shop-left-buttom" style="margin-top:0;">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>
            <ul class="shop-left-ul">
                <c:forEach items="${productByCsid}" var="pcs" varStatus="pc">
                    <c:if test="${pc.count<4}">
                        <li style="${pc.count==3?"border-bottom:0;":""}">
                            <div class="li-top">
                                <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${pcs.pid}"
                                   class="li-top-tu"><img
                                        src="${pageContext.request.contextPath}/resources/${pcs.image}"
                                        style="width: 95px;height: 110px;"/></a>
                                <p class="jiage"><span class="sp1">￥${pcs.shop_price}</span><span
                                        class="sp2">￥${pcs.market_price}</span></p>
                            </div>
                            <p class="miaoshu">${pcs.pname}</p>
                            <div class="li-md">
                                <div class="md-l f-l">
                                    <p name="countT" class="md-l-l f-l" ap="">1</p>
                                    <div class="md-l-r f-l">
                                        <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                        <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                    </div>
                                    <div style="clear:both;"></div>
                                </div>
                                <div class="md-r f-l">
                                    <button class="md-l-btn1">立即购买</button>
                                    <button name="addCartT" value="${pcs.pid}" class="md-l-btn2">加入购物车</button>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <p class="pingjia">88888评价</p>
                            <p class="weike">微克宅购自营</p>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li class="current"><a href="#">综合 ↓</a></li>
                <li><a href="#">销量 ↓</a></li>
                <li><a href="#">新品 ↓</a></li>
                <li><a href="#">评价 ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="shop-cmp-m f-l">
                <span>价格</span><input type="text"/><span>-</span><input type="text"/>
            </div>
            <div class="shop-cmp-r f-l">
                <ul class="f-l">
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>包邮</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>进口</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>仅显示有货</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满赠</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满减</span>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <button>确定</button>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <ul class="shop-ul-tu shop-ul-tu1">
                <c:forEach items="${productByCid.lists}" var="product" varStatus="vs">
                    <li style="${vs.count%4==0?"margin-right:0;":""}">
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/productDetails.do?pid=${product.pid}"
                               class="li-top-tu"><img style="width:95px ;height: 110px;"
                                                      src="${pageContext.request.contextPath}/resources/${product.image}"/></a>
                            <p class="jiage"><span class="sp1">￥${product.shop_price}</span><span
                                    class="sp2">￥${product.market_price}</span></p>
                        </div>
                        <p class="miaoshu">${product.pname}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p name="count" class="md-l-l f-l" ap="">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button name="addCart" value="${product.pid}" class="md-l-btn2">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">微克宅购自营</p>
                    </li>
                </c:forEach>


                <div style="clear:both;"></div>
            </ul>

            <!--分页-->
            <div class="paging">
                <div class="pag-left f-l">
                    <%--<c:set var="ss" value="0"></c:set>
                    <c:if test="${tt!=null&&tt!=0}">
                        <c:set var="ss" value="${tt}"></c:set>
                    </c:if>--%>
                    <a href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=1"
                       class="about left-r f-l"><</a>
                    <ul class="left-m f-l">
                        <%--   <c:forEach begin="1" end="${productByCid.totalPage}" var="i" >
                               <c:if test="${productByCid.pageNow>0&&productByCid.pageNow%6==0}">
                                   <c:set var="ss" value="${productByCid.pageNow}"></c:set>
                               </c:if>
                               <c:if test="${i>=ss&&i<ss+7&&i<=productByCid.totalPage}"  >
                                   <li class="${i==productByCid.pageNow?"current":""}"><a href="${pageContext.request.contextPath}/product/productList.do?tt=${ss}&cid=${productWapper.cid}&csid=${productWapper.csid}&pageNow=${i}">${i}</a></li>
                               </c:if>
                           </c:forEach>--%>
                        <c:if test="${productByCid.page.preGroupForPage!=-1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=${productByCid.page.preGroupForPage}">...</a>
                            </li>
                        </c:if>
                        <c:forEach items="${productByCid.page.pages}" var="pagei">
                            <li class="${pagei==productByCid.pageNow?"current":""}"><a
                                    href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=${pagei}">${pagei}</a>
                            </li>
                        </c:forEach>
                        <%-- <c:if test="${ss<productByCid.totalPage-productByCid.totalPage%6}">
                             <li><a id="last" href="${pageContext.request.contextPath}/product/productList.do?tt=${ss}&cid=${productWapper.cid}&csid=${productWapper.csid}&pageNow=${ss+6}">...</a></li>
                         </c:if>--%>
                        <c:if test="${productByCid.page.nextGroupForPage!=-1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=${productByCid.page.nextGroupForPage}">...</a>
                            </li>
                        </c:if>
                        <c:if test="${productByCid.page.nextGroupForPage!=-1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=${productByCid.totalPage}">${productByCid.totalPage}</a>
                            </li>
                        </c:if>

                        <div style="clear:both;"></div>
                    </ul>
                    <a href="${pageContext.request.contextPath}/product/productList.do?cid=${productWapper.cid}&csid=${productWapper.csid}&pname=${productWapper.pname}&pageNow=${productByCid.totalPage}"
                       class="about left-l f-l">></a>
                    <div style="clear:both;"></div>
                </div>
                <div class="pag-right f-l">
                    <div class="jump-page f-l">
                        到第<input id="page" value="${pageTYF}" type="number" max="${productByCid.totalPage}"
                                 maxlength="3"
                                 min="1"/>页
                    </div>
                    <button class="f-l" id="tiaoye">确定</button>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="footer.jsp" %>

</body>
</html>
