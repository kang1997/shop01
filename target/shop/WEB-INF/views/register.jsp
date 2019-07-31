<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/27
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/zhongling2.js"></script>

    <script type="text/javascript">
        var t ;
        $(function () {
            ajaxyzm();
            var username = $("#username1");
            var ajaxmsg = $("#ajaxmsg");
            username.keyup(function () {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/finduserbyname.do",
                    data: {
                        "username": username.val().trim(),
                    },
                    dataType: "text",
                    success: function (data1) {
                        if (data1 == "notok") {
                            ajaxmsg.attr("class", "cuo");
                            ajaxmsg.text("用户名重复");
                        } else if (data1 == "null") {
                            ajaxmsg.attr("class", "cuo");
                            ajaxmsg.text("用户名不能为空");
                        } else {
                            ajaxmsg.attr("class", "dui");
                            ajaxmsg.text("用户名可以使用")
                        }
                    }

                });
            });
            var password = $("#password1");
            var passwordz = $("#password2");
            var ajaxpass = $("#ajaxpass");
            var ajaxpass2 = $("#ajaxpass2");
            var reg = /^[\w]{6,16}$/;

            password.keyup(function () {
                if (reg.test(password.val()) == false) {
                    ajaxpass.attr("class", "cuo");
                    ajaxpass.text("密码由6-16的字母、数字、符号组成");
                } else {
                    ajaxpass.attr("class", "dui");
                    ajaxpass.text("密码输入正确");
                    if (password.val() != passwordz.val()) {
                        ajaxpass2.attr("class", "cuo");
                        ajaxpass2.html("密码输入必须一致");
                    } else {
                        ajaxpass2.attr("class", "dui");
                        ajaxpass2.html("密码输入正确");
                    }
                }

            });
            passwordz.keyup(function () {
                if (reg.test(passwordz.val()) == false) {
                    ajaxpass2.attr("class", "cuo");
                    ajaxpass2.text("密码由6-16的字母、数字、符号组成");
                } else {
                    if (password.val() != passwordz.val()) {
                        ajaxpass2.attr("class", "cuo");
                        ajaxpass2.html("密码输入必须一致");

                    } else {
                        ajaxpass2.attr("class", "dui");
                        ajaxpass2.html("密码输入正确");
                    }
                }
            });
            var phone = $("#phone1");
            var ajaxphone = $("#ajaxphone");
            var rsg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}/;
            phone.keyup(function () {
                if (rsg.test(phone.val().trim()) == false) {
                    ajaxphone.attr("class", "cuo");
                    ajaxphone.text("请输入正确格式的手机号");
                } else {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/user/finduserbyphone.do",
                        data: {
                            "phone": phone.val().trim(),
                        },
                        dataType: "text",
                        success: function (data) {
                            if (data == "notok") {
                                ajaxphone.attr("class", "cuo");
                                ajaxphone.html("手机号已经注册过");
                            } else if (data == "null") {
                                ajaxphone.attr("class", "cuo");
                                ajaxphone.html("手机号不能为空");
                            } else {
                                ajaxphone.attr("class", "dui");
                                ajaxphone.html("手机号输入正确");
                            }
                        }
                    });
                }

            });

        });

        function yanzhengma(){
            $("#yzm").attr("src","${pageContext.request.contextPath}/yanzhengma.do?time="+new Date());
        }
        function checkFrom() {
            var res = $("#hobby1").prop("checked");
            ajaxyzm();
            if (res == true) {
                var ajaxmsg = $("#ajaxmsg");
                var ajaxpass = $("#ajaxpass");
                var ajaxpass2 = $("#ajaxpass2");
                var ajaxphone = $("#ajaxphone");
                if (ajaxmsg.attr("class") == "cuo" || ajaxpass.attr("class") == "cuo" || ajaxpass2.attr("class") == "cuo" || ajaxphone.attr("class") == "cuo") {
                    return false;
                }
                var name = $("#name1");
                if (name.val().trim() == null || name.val().trim() == "") {
                    $("#ajaxname").attr("class", "cuo");
                    $("#ajaxname").html("姓名不能为空");
                    return false;
                }
                var code = $("#code");
                var codespan = $("#codespan");
                if (code.val().trim() == null || code.val().trim() == "") {
                    codespan.attr("class", "cuo");
                    codespan.html("请填写验证码");
                    return false;
                }
                 var t1 = t.toLowerCase();
                //alert(t1);
                var code3 = code.val().trim().toLowerCase();
                if(code3!=t1){
                    codespan.attr("class", "cuo");
                    codespan.html("验证码输入错误");
                    return false;
                }
                 return true;
            }else {
                return false;
            }
        }
        function ajaxyzm(){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/sessioncode.do",
                cache:false,
                async:false,
                dataType: "text",
                success: function(data){
                    t = data;
                }
            });
        }

    </script>

</head>

<body>

<!--header-->
<!--logo search weweima-->
<%@include file="header.jsp"%>

<!--内容开始-->
<div class="password-con registered">
    <form action="${pageContext.request.contextPath}/user/doRegister.do" method="post" onsubmit="return checkFrom();" autocomplete=off >
        <div class="psw">
            <p class="psw-p1">用户名</p>
            <input type="text" id="username1" name="username" placeholder="请填写用户名" ondragstart="return false" onpaste="return false" required />
            <span class="${empty username?"":"cuo"}" id="ajaxmsg">${username}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">输入密码</p>
            <input id="password1" name="password" pattern="^[\w]{6,16}$" type="password"
                   placeholder="请输入密码/  密码由6-16的字母、数字、符号组成" ondragstart="return false" onpaste="return false" required/>
            <span class="${password==null?"":"cuo"}" id="ajaxpass">${password}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">确认密码</p>
            <input id="password2" name="passwordz" pattern="^[\w]{6,16}$" type="password"
                   placeholder="请再次确认密码/  密码由6-16的字母、数字、符号组成" ondragstart="return false" onpaste="return false" required/>
            <span class="${password1==null?"":"cuo"}" id="ajaxpass2">${password1}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">真实姓名</p>
            <input id="name1" name="name" type="text" placeholder="请输入真实姓名" ondragstart="return false" onpaste="return false" required/>
            <span class="${name==null?"":"cuo"}" id="ajaxname">${name}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">电子邮箱</p>
            <input id="email1" name="email" type="email" placeholder="请输入电子邮箱" ondragstart="return false" onpaste="return false" required/>
            <span class="${email==null?"":"cuo"}" id="ajaxemail">${email}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">手机号</p>
            <input type="tel" pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}"
                   id="phone1" name="phone" placeholder="请输入电话" required ondragstart="return false" onpaste="return false"  />
            <span class="${phone==null?"":"cuo"}" id="ajaxphone">${phone}</span>
        </div>
        <div class="psw">
            <p class="psw-p1">地址</p>
            <input id="addr1" name="addr" type="text" placeholder="请输入地址" ondragstart="return false" onpaste="return false" />
            <span class="" id="ajaxaddr"></span>
        </div>
        <div class="psw psw3">
            <p class="psw-p1">验证码</p>
            <input type="text" id="code" name="code" placeholder="请输入验证码" ondragstart="return false" onpaste="return false" />
            <span class="${empty scode?"":"cuo"}" id="codespan">${scode}</span>
            <input type="hidden" id="hid" />
        </div>
        <div class="yanzhentu">
            <div class="yz-tu f-l">
                <img id="yzm" onclick="yanzhengma()" src="${pageContext.request.contextPath}/yanzhengma.do"/>
            </div>
            <p class="f-l">看不清？<a href="javascript:yanzhengma()">换张图</a></p>
            <div style="clear:both;"></div>
        </div>
        <div class="agreement">
            <input type="checkbox" name="hobby" id="hobby1"></input>
            <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
        </div>
        <input type="submit" class="psw-btn" value="立即注册"></input>
        <p class="sign-in">已有账号？请<a href="${pageContext.request.contextPath}/user/login.do">登录</a></p>
    </form>
</div>

<!--底部一块-->
<%@include file="footer.jsp"%>

</body>
</html>

