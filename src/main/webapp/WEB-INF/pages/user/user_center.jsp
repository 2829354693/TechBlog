<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/20
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.9.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>

    <jsp:include page="../base.jsp"/>
</head>
<body>
<jsp:include page="../head.jsp"/>

<div class="jq22-list-item">
    <div class="jq22-list-wrap">
        <ul>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="${pageContext.request.contextPath}/user/userCenter">我的资料</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="${pageContext.request.contextPath}/user/myBlog">我的博客</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="#">我评论的</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="#">我点赞的</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="${pageContext.request.contextPath}/user/write">博客发表</a>
                    </h2>
                </div>
            </li>

        </ul>
    </div>

    <div class="user-main">
        <div class="user-info">
            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/user/updateUser" method="post" enctype="multipart/form-data" id="userForm">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="margin-top: 25px;margin-right: 40px;">您的头像</label>
                    <div class="input-group row">
                        <div class="col-sm-9 big-photo" >
                            <div id="preview">
                                <c:if test="${sessionScope.user.headPic != null}">
                                    <img style="cursor: pointer;" id="imghead" border="0"
                                         src="//${headPicPath}/${sessionScope.user.headPic}"
                                         width="90"
                                         height="90"
                                         onclick="$('#previewImg').click();" alt="头像">
                                </c:if>
                                <c:if test="${sessionScope.user.headPic == null}">
                                    <img style="cursor: pointer;" id="imghead" border="0"
                                         src="${pageContext.request.contextPath}/static/img/photoicon.png"
                                         width="90"
                                         height="90"
                                         onclick="$('#previewImg').click();">
                                </c:if>

                            </div>
                            <input type="file" onchange="previewImage(this)" name="preHeadPic" style="display: none;" id="previewImg">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-inline">
                        <input type="text" readonly="readonly" value="${sessionScope.user.account}" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="password" id="password" placeholder="更改密码请在此输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" value="${sessionScope.user.name}"
                               placeholder="请输入" autocomplete="off" id="name"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">座右铭</label>
                    <div class="layui-input-block">
                        <textarea placeholder="这个人很懒，什么都没有写。"
                                  class="layui-textarea" name="signature">${sessionScope.user.signature}</textarea>
                    </div>
                </div>

                <div style="width: 216px; margin: 0;">
                    <button type="button" id="submitUser" style="background-color: #3d6bb3;" class="layui-btn layui-btn-fluid">保存信息
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use(['layer', 'jquery'], function () {
        const $ = layui.jquery;
        const layer = layui.layer;

        $("#self").click(function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "./login";
                });
            } else {
                location.href = './userCenter';
            }
        });

        $("#submitUser").click(function(){
            var password=$("#password").val();
            var name=$("#name").val();
            if(password.length > 0){
                if(password.length < 4 || password.length > 16){
                    $("#pass").focus();
                    layer.msg("密码长度需在4-16!");
                }else if(name.length < 1 || name.length > 10){
                    $("#name").focus();
                    layer.msg("昵称长度需在1-10!");
                }else{
                    $("#userForm").submit();
                }
            }else if(name.length < 1 || name.length > 10){
                $("#name").focus();
                layer.msg("昵称长度需在1-10!");
            }else{
                $("#userForm").submit();
            }

        });
    });

    //图片上传预览    IE是用了滤镜。
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        } else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
    }

    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {top: 0, left: 0, width: width, height: height};
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
</script>
</html>
