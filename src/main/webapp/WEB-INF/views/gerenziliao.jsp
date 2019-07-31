<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/10
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>
    <script type="text/javascript" >
        $(function(){
            $("#username").val("${loginUser.getUsername()}");
            $("#password").val("${loginUser.getPassword()}");
            $("#password1").val("${loginUser.getPassword()}");
            $("#name").val("${loginUser.getName()}");
            $("#email").val("${loginUser.getEmail()}");
            $("#phone").val("${loginUser.getPhone()}");
            $("#addr").val("${loginUser.getAddr()}");
            $("#but").click(function(){
                var password = $("#password");
                var password1 = $("#password1");
                var name = $("#name");
                var email = $("#email");
                var addr = $("#addr");
                var reg = /^[\w]{6,16}$/;
                var rsg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if(password.val()==null||password.val().trim()==""){
                    $("#passwordspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>密码不能为空</font>");
                    setTimeout("$('#passwordspan').html('')",1000);
                    return;
                }
                if(reg.test(password.val())==false){
                    $("#passwordspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>密码由6-16的字母、数字、符号组成</font>");
                    setTimeout("$('#passwordspan').html('')",1000);
                    return ;
                }
                if(reg.test(password1.val())==false){
                    $("#passwordspan1").html("<font style='line-height: 46px; font-size:20px; color: red; '>密码由6-16的字母、数字、符号组成</font>");
                    setTimeout("$('#passwordspan1').html('')",1000);
                    return ;
                }
                if(password1.val()!=password.val()){
                    $("#passwordspan1").html("<font style='line-height: 46px; font-size:20px; color: red; '>两次密码请输入一致</font>");
                    setTimeout("$('#passwordspan1').html('')",1000);
                    return
                }

                if(name.val()==null||name.val().trim()==""){
                    $("#namespan").html("<font style='line-height: 46px; font-size:20px; color: red; '>用户名不能为空</font>");
                    setTimeout("$('#namespan').html('')",1000);
                    return;
                }
                if(email.val()==null||email.val().trim()==""){
                    $("#emailspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>邮箱不能为空</font>");
                    setTimeout("$('#emailspan').html('')",1000);
                    return;
                }
                if(rsg.test(email.val())==false){
                    $("#emailspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>邮箱不符合规则</font>");
                    setTimeout("$('#emailspan').html('')",1000);
                    return ;
                }
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/updatePersonUser.do",
                    data:{
                        "username":"${loginUser.getUsername()}",
                        "password":password.val(),
                        "name":name.val(),
                        "email":email.val(),
                        "phone":"${loginUser.getPhone()}",
                        "addr":addr.val(),
                    },
                    dataType:"text",
                    success :function(data){
                        if(data=="usernull"){
                            $("#butspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>保存失败</font>");
                            setTimeout("$('#butspan').html('')",1000);
                        }else{
                            $("#butspan").html("<font style='line-height: 46px; font-size:20px; color: red; '>保存成功</font>");
                            setTimeout("$('#butspan').html('')",1000);
                        }
                    }
                })

            })
        })
    </script>
</head>

<body style="position:relative;">

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
    <div class="personal-r f-r">
        <div class="personal-right">
            <div class="personal-r-tit">
                <h3>个人资料</h3>
            </div>

            <div class="data-con">
                <div class="dt1">
                    <p class="f-l">当前头像：</p>
                    <div class="touxiang f-l">
                        <div class="tu f-l">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/images/data-tu.gif" />
                                <input type="file" name="" id="" class="img1" />
                            </a>
                        </div>
                        <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">昵称：</p>
                    <input type="text" id="username" name="username" readonly unselectable="on" placeholder="RH了" required ondragstart="return false;" onpaste="return false;" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">密码：</p>
                    <input type="password" id="password" name="password" placeholder="请输入密码/ 密码由6-16的字母、数字、符号组成" required />
                    <span id="passwordspan" ></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">确认密码：</p>
                    <input type="password" id="password1" name="password1" placeholder="请输入密码/ 密码由6-16的字母、数字、符号组成" required />
                    <span id="passwordspan1" ></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">用户名：</p>
                    <input type="text" id="name" name="name" placeholder="请输入用户名" required />
                    <span id="namespan" ></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">邮箱：</p>
                    <input type="email" id="email" name="email" placeholder="请输入邮箱" required />
                    <span id="emailspan" ></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="tel" id="phone" name="phone" readonly unselectable="on"  required />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">地址：</p>
                    <input type="text" id="addr" placeholder="地址" name="addr"   />
                    <div style="clear:both;"></div>
                </div>
                <button type="button" id="but" class="btn-pst">保存</button>
                <span id="butspan"></span>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--上传头像弹窗
<div class="tanchuang">
    <div class="t-c-bg"></div>
    <div class="t-c-con">
        <div class="tc-tit">
            <h3>上传头像</h3>
            <a href="JavaScript:;" delete=""><img src="${pageContext.request.contextPath}/resources/images/t-c-del.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <div class="tc-con">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/tc-tu.gif" /></a>
            <button>保存头像</button>
        </div>
    </div>
</div>-->

<!--底部一块-->
<%@include file="footer.jsp"%>
</body>
</html>

