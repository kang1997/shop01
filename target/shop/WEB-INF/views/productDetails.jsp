<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品详情(家居建材)</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#${productByPid.pid}").click(function(){

                var pid = ${productByPid.pid};
                var count = $("#${productByPid.pid}count").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/cart/addCart.do",
                    data:{
                        "pid":pid,
                        "count":count,
                    },
                    datatype:"text",
                    success:function(data){
                        alert(data+"${cart}");
                    }
                });
                
            });
            $("#imgClick").click(function () {
                $("#sss").show();
                $("#sss").html('<img src="${pageContext.request.contextPath}/resources/${productByPid.image}" style="z-index:11;margin:100px auto;width:500px;" />'); //
            })
            $("#sss").click(function(){
                $("#sss").hide();
            })
            $(document).scroll(function(){
                var scro = $(document).scrollTop();
                if(scro>500){
                    $("#sss").hide();
                }
            })
        })

    </script>
</head>

<body style="position:relative;">
<div id="sss" style=" position:fixed;top: 0;left: 0;height: 100%;width: 100%;display: none;z-index:10;"></div>
<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>

<!--nav-->
<%@include file="nav.jsp"%>
<!--内容开始-->
<div class="details w1200">
    <div class="deta-info1">
        <div class="dt-if1-l f-l">
            <div class="dt-if1-datu">
                <ul qie-da="">
                    <li><a id="imgClick" ><img src="${pageContext.request.contextPath}/resources/${productByPid.image}"  /></a></li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
            <div class="dt-if1-qietu">
                <a class="dt-qie-left f-l" href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu-left.gif" /></a>
                <div class="dt-qie-con f-l">
                    <ul qie-xiao="">
                        <li class="current"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu1.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu2.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu3.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu4.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu5.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu6.gif" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu7.gif" /></a></li>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <a class="dt-qie-right f-r" href="JavaScript:;"><img src="${pageContext.request.contextPath}/resources/images/dt-if1-qietu-right.gif" /></a>
            </div>
            <div class="dt-if1-fx">
                <span>商品编码:${productByPid.pid}</span>
                <p>分享到：<a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-xl.gif" /></a><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-kj.gif" /></a><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-wx.gif" /></a></p>
            </div>
        </div>

        <div class="dt-if1-m f-l">
            <div class="dt-ifm-hd">
                <h3><a href="#">${productByPid.pname}</a></h3>
                <p>仅售${productByPid.shop_price}元！</p>
            </div>
            <div class="dt-ifm-gojia">
                <dl>
                    <dt>宅购价</dt>
                    <dd>
                        <p class="p1">
                            <span class="sp1">￥${productByPid.shop_price}.00</span><span class="sp2">${productByPid.market_price}</span>
                        </p>
                        <p class="p2">
                            <span class="sp1"><img src="${pageContext.request.contextPath}/resources/images/dt-ifm-sp1-img.gif" />5分</span><span class="sp2">共有 2 条评价</span>
                        </p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
            </div>
            <dl class="dt-ifm-spot">
                <dt>活动</dt>
                <dd>
                    <P><span>手机专享价</span>￥${productByPid.shop_price}</P>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="dt-ifm-box1">
                <dt>时间</dt>
                <dd>
                    <select>
                        <option>请选择配送日期</option>
                        <option></option>
                        <option></option>
                    </select>
                    <select>
                        <option>请选择配送时段</option>
                        <option>上午</option>
                        <option>下午</option>
                    </select>
                    <p>如果提前两天预定，还可以享受折扣哦！</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="dt-ifm-box6">
                <dt>颜色</dt>
                <dd class="dt-if-dd1">
                    <a class="current" href="JavaScript:;">米白+紫色</a>
                    <a href="JavaScript:;">米白+紫色</a>
                    <a href="JavaScript:;">米黄+大红</a>
                    <a href="JavaScript:;">深咖啡+米色</a>
                    <a href="JavaScript:;">深咖啡+米色</a>
                    <a href="JavaScript:;">米黄+大红</a>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="dt-ifm-box6">
                <dt>尺码</dt>
                <dd class="dt-if-dd1">
                    <a class="current" href="JavaScript:;">单人+双人+左贵妃+脚踏</a>
                    <a href="JavaScript:;">单人+双人+右贵妃</a>
                    <a href="JavaScript:;">单人+双人+左贵妃</a>
                    <a href="JavaScript:;">双人+右贵妃</a>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="dt-ifm-box3">
                <dt>数量</dt>
                <dd>
                    <a  class="box3-left" href="JavaScript:;">-</a>
                    <input id="${productByPid.pid}count" type="text" value="1">
                    <a  class="box3-right" href="JavaScript:;">+</a>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <div class="dt-ifm-box4">
                <button class="btn1">立即购买</button>
                <button id="${productByPid.pid}" class="btn2">加入购物车</button>
                <button class="btn3">收藏</button>
            </div>
        </div>

        <div class="dt-if1-r f-r">
            <div class="dt-ifr-hd">
                <div class="dt-ifr-tit">
                    <h3>三只松鼠百货专营店</h3>
                </div>
                <ul class="dt-ifr-ul1">
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <div class="dt-ifr-tel">
                    <p>地址：重庆渝北区高新园昆仑大道60号　　　龙头寺火车站旁</p>
                    <p>TEL：18616854445</p>
                </div>
                <button class="dt-r-btn1">进入店铺</button>
                <button class="dt-r-btn2">收藏店铺</button>
            </div>
            <div class="dt-ifr-fd">
                <div class="dt-ifr-tit">
                    <h3>同类推荐</h3>
                </div>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-ifr-fd-dt-tu.gif" /></a></dt>
                    <dd>
                        <a href="#">【观音桥】罗兰钢管舞舞蹈体验</a>
                        <p>¥9.90</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dt-ifr-fd-dt-tu.gif" /></a></dt>
                    <dd>
                        <a href="#">【观音桥】罗兰钢管舞舞蹈体验</a>
                        <p>¥9.90</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>

    <div class="deta-info2">
        <div class="dt-if2-l f-l">
            <div class="if2-l-box1">
                <div class="if2-tit">
                    <h3>浏览记录</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li style="border-bottom:0;">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                </ul>
            </div>
            <div class="if2-l-box1" style="margin-top:18px;">
                <div class="if2-tit">
                    <h3>看了又看</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li style="border-bottom:0;">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="dt-if2-r f-r">
            <ul class="if2-tit2">
                <li class="current" com-det="dt1"><a href="JavaScript:;">产品信息</a></li>
                <li com-det="dt2"><a href="JavaScript:;">商品评论</a></li>
                <li com-det="dt3"><a href="JavaScript:;">商家信息</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div style="border:1px solid #DBDBDB;" com-det-show="dt1">
                <div class="if2-tu1">
                    <img src="${pageContext.request.contextPath}/resources/images/if2-tu1.gif" />
                    <img src="${pageContext.request.contextPath}/resources/images/if2-tu2.gif" style="margin-top:47px;" />
                    <div style="clear:both;"></div>
                </div>
                <div class="if2-tu2">
                    <img src="${pageContext.request.contextPath}/resources/images/if2-tu3.gif" />
                    <div style="clear:both;"></div>
                </div>
                <div class="if2-tu3">
                    <img src="${pageContext.request.contextPath}/resources/images/if2-tu4.gif" />
                </div>
                <ul class="if2-tu4">
                    <li><img src="${pageContext.request.contextPath}/resources/images/if2-tu5.gif" /></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/if2-tu6.gif" /></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/if2-tu7.gif" /></li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
            <div style="display:none;" com-det-show="dt2">
                <dl class="if2-r-box2">
                    <dt>
                        <p class="box2-p1">好评率</p>
                        <p class="box2-p2">96.5%</p>
                        <p class="box2-p3">共539人评论</p>
                    </dt>
                    <dd>
                        <P>买过的人觉得</P>
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
                <div class="if2-r-box3">
                    <ul>
                        <li class="current-li"><a href="#">全部（539）</a></li>
                        <li><a href="#">好评（536）</a></li>
                        <li><a href="#">中评（2）</a></li>
                        <li><a href="#">差评（1）</a></li>
                        <li><a href="#">图片（1）</a></li>
                        <li><a href="#">追加评论（1）</a></li>
                        <div style="clear:both;"></div>
                    </ul>
                    <dl>
                        <dt>
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/box3-dt-tu.gif" /></a>
                        </dt>
                        <dd>
                            <a href="#">胡**</a>
                            <p class="b3-p1">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                            <p class="b3-p2">2015-12-12    16:57:22  </p>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/box3-dt-tu.gif" /></a>
                        </dt>
                        <dd>
                            <a href="#">胡**</a>
                            <p class="b3-p1">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                            <p class="b3-p2"><span></span><span></span>2015-12-12    16:57:22</p>
                            <div style="clear:both;"></div>
                            <div class="b3-zuijia">
                                <p class="zj-p1">追加评论：</p>
                                <p class="zj-p2">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                                <p class="zj-p3">2015-12-12    16:57:22</p>
                            </div>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>

                    <!--分页-->
                    <div class="paging">
                        <div class="pag-left f-l">
                            <a href="#" class="about left-r f-l"><</a>
                            <ul class="left-m f-l">
                                <li><a href="#">1</a></li>
                                <li class="current"><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">...</a></li>
                                <li><a href="#">100</a></li>
                                <div style="clear:both;"></div>
                            </ul>
                            <a href="#" class="about left-l f-l">></a>
                            <div style="clear:both;"></div>
                        </div>
                        <div class="pag-right f-l">
                            <div class="jump-page f-l">
                                到第<input type="text" />页
                            </div>
                            <button class="f-l">确定</button>
                            <div style="clear:both;"></div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </div>
            <div class="if2-r-box4" style="display:none;" com-det-show="dt3">
                <div class="b4-tit">
                    <h3>店铺所有商品</h3>
                </div>
                <div class="b4-con1">
                    <a href="#">饼干糕点</a>
                    <a href="#">坚果果仁</a>
                    <a href="#">海味肉食</a>
                    <a href="#">糖果巧克力</a>
                    <a href="#">豆干炒货</a>
                    <a href="#">休闲膨化</a>
                    <a href="#">饮品冲调</a>
                    <a href="#">蜜饯果脯</a>
                    <a href="#">方便速食</a>
                    <a href="#">饼干糕点</a>
                    <a href="#">坚果果仁</a>
                    <a href="#">海味肉食</a>
                    <a href="#">糖果巧克力</a>
                    <a href="#">豆干炒货</a>
                    <a href="#">休闲膨化</a>
                    <a href="#">饮品冲调</a>
                    <a href="#">蜜饯果脯</a>
                    <a href="#">方便速食</a>
                </div>
                <div class="b4-tit">
                    <h3>店铺热销商品</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@include file="footer.jsp"%>
</body>
</html>
