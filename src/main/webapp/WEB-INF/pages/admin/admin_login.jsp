<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/26
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet" type="text/css" />
    <jsp:include page="../base.jsp"/>
</head>
<body>
<h1 style="margin-top: 50px;">欢迎<sup>管理员</sup></h1>

<div class="login" style="margin-top:50px;">

    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
        </div>
    </div>

    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form name="loginform" accept-charset="utf-8" id="login_form" class="loginForm"
                          method="post">
                        <input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="account" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密码：</label>
                            <div class="inputOuter" id="pArea">
                                <input type="password" id="p" name="password" class="inputstyle"/>
                            </div>
                        </div>

                        <div style="padding-left:50px;margin-top:20px;">
                            <input type="button" onclick="checkLogin()" value="登 录" style="width:150px;" class="button_blue"/>
                        </div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use(['jquery','layer'],function () {
        var $=layui.jquery;
        var layer=layui.layer;

        window.checkLogin=function () {

            var account=$("#u").val();
            var password=$("#p").val();

            if (account.length < 4 || account.length > 16){
                $('#u').focus().css({
                    border: "1px solid red",
                    boxShadow: "0 0 2px red"
                });
                layer.msg("用户名长度需在4-16！");
            }else if (password.length < 4 || password.length > 16) {
                $('#p').focus().css({
                    border: "1px solid red",
                    boxShadow: "0 0 2px red"
                });
                layer.msg("密码长度需在4-16！");
            }else {
                $.ajax({
                    type:'post',
                    url:'./login',
                    data:{account:account,password:password},
                    success:function (result) {
                        if (result==="fail"){
                            layer.msg("用户名或密码错误！");
                        }else if (result==="success"){
                            layer.load(1, {
                                shade: [0.1,'#fff']
                            });
                            location.href='./index';
                        }
                    }
                });
            }
        };
    });

</script>
</html>
