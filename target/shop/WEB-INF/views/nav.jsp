<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">
                <c:forEach items="${allCategory}" var="all" begin="0" end="5" >
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/resources/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList[0].csid}">${all.cSecExtList[0].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList.get(1).csid}">${all.cSecExtList[1].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}&csid=${all.cSecExtList.get(2).csid}">${all.cSecExtList[2].csname}</a>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2">
                                <dt><a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a></dt>
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
            <c:forEach items="${allCategory}" var="all" begin="0" end="7" varStatus="vs"  >
                <c:if test="${!vs.last}">
                    <li><a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a></li>
                </c:if>
                <c:if test="${vs.last}">
                    <li><a href="${pageContext.request.contextPath}/product/productList.do?cid=${all.cid}">${all.cname}</a><span><img src="${pageContext.request.contextPath}/resources/images/zl2-05.gif" /></span></li>
                </c:if>
            </c:forEach>

            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>

