<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/20
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客发表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.9.0.min.js"></script>
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
                            href="${pageContext.request.contextPath}/blog/myBlogComment">我评论的</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a
                            href="${pageContext.request.contextPath}/blog/myBlogLike">我点赞的</a>
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
        <div class="write-div">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">博客标题</label>
                    <div class="layui-input-block">
                        <input type="text" id="title" name="title" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>

                <iframe id="iframe1" frameborder="no" src="${pageContext.request.contextPath}/static/um/_examples/multiDemo.html" width="100%" height="350"></iframe>

                <div class="layui-form-item">
                    <label class="layui-form-label">博客类型</label>
                    <div class="layui-input-block">
                        <select name="interest" id="type">
                            <option value=""></option>
                            <option value="编程语言">编程语言</option>
                            <option value="算法" selected="">算法</option>
                            <option value="web开发">web开发</option>
                            <option value="小程序开发">小程序开发</option>
                            <option value="操作系统">操作系统</option>
                            <option value="数据库">数据库</option>
                            <option value="网络">网络</option>
                            <option value="Linux">Linux</option>
                            <option value="分布式">分布式</option>
                        </select>
                    </div>
                </div>

            </form>
            <div style="width: 216px; margin: 0;">
                <button type="button" style="background-color: #2d66b0;" id="b" class="layui-btn layui-btn-fluid">发布博客</button>
            </div>
        </div>
    </div>

</div>


</body>
<script>

    layui.use(['form','layer'],function(){
       var form = layui.form;
       var layer = layui.layer;
        $("#self").click(function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "../user/login";
                });
            } else {
                location.href = '../user/userCenter';
            }
        });

        $("#iframe1").load(function(){
            var c = $("#iframe1")[0].contentWindow.getContent();
        });

        $("#b").click(function () {
            if (${empty sessionScope.user}){
                layer.confirm('您已退出登录或登录已失效！', {
                    btn: ['去登录', '主页']
                }, function () {
                    location.href = "../user/login";
                }, function(){
                    location.href="../";
                });
            }else {
                var c = $("#iframe1")[0].contentWindow.getContent();
                console.log(c.replace(/<\/?.+?>/g, ""));
                var title = $("#title").val();
                var type = $("#type option:selected").val();

                $.ajax({
                    url: "../user/submitBlog",
                    type: "post",
                    data: {
                        content: c,
                        title: title,
                        type: type
                    },
                    success: function (result) {
                        if (result == "success") {
                            layer.msg("发布成功！");
                            location.replace('./write');
                        }
                    }
                })
            }
        })
       form.render();
    });

</script>
</html>
