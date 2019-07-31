<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/10
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>

<%-- 向服务器获取cookie
var phonename = "${cookie.phone.value}";
var phonename1 = "${cookie.phone}";
var password = "${cookie.password.value}";
if(phonename!=null&&password!=null&&phonename!=""&&password!=""){
$("#phone").val(phonename);
$("#password").val(password);
$("#check").attr("checked","checked");
}--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>

    <style type="text/css">
        .tubiao{width: 30px;  height: 25px; position: absolute;    right: 22%; padding-top: 8px;opacity: 0.5;}
        .tubiao:hover{opacity: 1;}
    </style>

    <script type="text/javascript">
        $(function(){
            var phonename = "${cookie.phone.value}";
            var phonename1 = "${cookie.phone}";
            var password = "${cookie.password.value}";
            if(phonename!=null&&password!=null&&phonename!=""&&password!="") {
                $("#phone").val(phonename);
                $("#password").val(password);
                $("#check").attr("checked", "checked");
            }
           /* var cook = document.cookie.split(";");
            if(cook[1]!=null&&cook[1]!=""&&cook[2]!=null&&cook[2]!=""){
                var  pa = cook[1].split("=");
                var ph  = cook[2].split("=");
                $("#phone").val(pa[1]);
                $("#password").val(ph[1]);
                $("#check").attr("checked","checked");
            }*/
            $("#delete").click(function(){
                $("#phone").val("");
            })
            $("#dj").click(function(){
                if($("#password").attr("type")=="password"){
                    $("#password").prop("type","text");
                }else{
                    $("#password").prop("type","password");
                }
            })

        });

        function checkFrom(){
            var phone = $("#phone");
            var phonespan = $("#phonespan");
            var password = $("#password");
            var passwordspan = $("#passwordspan");
            var sub = $("#sub");
            if(phone.val()==null||phone.val().trim()==""){
                phonespan.html("<font color='red'>用户名不能为空号</font>");
                setTimeout("$('#phonespan').html('')",1300);
                return false;
            }
            if(password.val()==null||password.val().trim()==""){
                passwordspan.html("<font color='red'>请输入密码</font>");
                setTimeout("$('#passwordspan').html('')",1300);
                return false;
            }
            return true;

        }

    </script>


</head>

<body>

<div class="sign-logo w1200">
    <h1 class="zl-h11"><a href="${pageContext.request.contextPath}/index.do" title="宅客微购"><img src="${pageContext.request.contextPath}/resources/images/zl2-01.gif" /></a></h1>
</div>

<div class="sign-con w1200">
    <img src="${pageContext.request.contextPath}/resources/images/logn-tu.gif" class="sign-contu f-l" />
    <div class="sign-ipt f-l">
        <form action="${pageContext.request.contextPath}/user/doLogin.do" method="post" onsubmit="return checkFrom();" autocomplete="off" >
        <p>用户名</p>
        <input type="text" id="phone" name="phone" class="input_tp"  placeholder="手机号/邮箱" required onpause="return false;" ondragstart="return false;" />
            <a id="delete" class="tubiao" title="清除" ><img src="${pageContext.request.contextPath}/resources/images/inputxiaocha.jpg"/></a><br />
        <span id="phonespan">${phone}</span>
        <p>密码</p>
        <input type="password" id="password" name="password" class="input_tp" value="" placeholder="请输入密码" required ondragstart="return false;" onpause="return false;" />
            <a id="dj" class="tubiao" title="点击隐藏或显示密码"><img src="${pageContext.request.contextPath}/resources/images/inputxiaoyan.jpg"/></a><br />
        <span id="passwordspan">${empty password?msg:password}</span>
        <input class="slig-btn" type="submit" id="sub" value="登录"/>
        <p>保存账号<input  type="checkbox" style="width: 18px;height: 18px; vertical-align:text-top; margin-top:2px;" id="check" name="check" value="1"/><a href="${pageContext.request.contextPath}/user/register.do" class="wj">立即注册</a></p>
        <div class="sign-qx">
            <a href="#" class="f-r"><img src="${pageContext.request.contextPath}/resources/images/sign-xinlan.gif" /></a>
            <a href="#" class="qq f-r"><img src="${pageContext.request.contextPath}/resources/images/sign-qq.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        </form>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="footer.jsp"%>
</body>
</html>

