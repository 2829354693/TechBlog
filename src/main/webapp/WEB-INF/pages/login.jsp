<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/19
  Time: 10:29
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
    <jsp:include page="base.jsp"/>
</head>
<body>
<h1 style="margin-top: 50px;">欢迎<sup>techblog</sup></h1>

<div class="login" style="margin-top:50px;">

    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
            <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
            <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0;"></div>
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

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">

        <div class="web_login">
            <form name="form2" id="regUser" accept-charset="utf-8">
                <input type="hidden" name="to" value="reg"/>
                <input type="hidden" name="did" value="0"/>
                <ul class="reg_form" id="reg-ul">
                    <div id="userCue" class="cue">快速注册请注意格式</div>
                    <li>

                        <label for="user" class="input-tips2">用户名：</label>
                        <div class="inputOuter2">
                            <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
                        </div>

                    </li>

                    <li>
                        <label for="passwd" class="input-tips2">密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd" name="passwd" maxlength="16" class="inputstyle2"/>
                        </div>

                    </li>
                    <li>
                        <label for="passwd2" class="input-tips2">确认密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2"/>
                        </div>

                    </li>

<%--                    <li>--%>
<%--                        <label for="qq" class="input-tips2">QQ：</label>--%>
<%--                        <div class="inputOuter2">--%>

<%--                            <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2"/>--%>
<%--                        </div>--%>

<%--                    </li>--%>

                    <li>
                        <div class="inputArea">
                            <input type="button" id="reg" style="margin-top:10px;margin-left:85px;" class="button_blue"
                                   value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
                        </div>

                    </li>
                    <div class="cl"></div>
                </ul>
            </form>

        </div>
    </div>
    <!--注册end-->
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
                        if (result==="noAccount"){
                            $('#u').focus().css({
                                border: "1px solid red",
                                boxShadow: "0 0 2px red"
                            });
                            layer.msg("此用户名不存在！请注册！");
                        }else if (result==="fail"){
                            layer.msg("用户名或密码错误！");
                        }else if (result==="success"){
                            layer.load(1, {
                                shade: [0.1,'#fff']
                            });
                            location.replace('../');
                        }
                   }
                });
            }
        };
    });

</script>
</html>
