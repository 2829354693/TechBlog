<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/27
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>techblog后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <jsp:include page="../base.jsp"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">TechBlog后台管理系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/logout">退了</a></li>
        </ul>
    </div>

    <jsp:include page="admin_base.jsp"/>

    <div class="layui-body">
        <h3>请修改该用户的密码：</h3>
        <form class="layui-form layui-form-pane" method="post" action="${pageContext.request.contextPath}/admin/changePwd">
            <input type="hidden" name="userId" value="${user.id}">
            <div class="layui-form-item">
                <label class="layui-form-label">用户账号</label>
                <div class="layui-input-inline">
                    <input type="text" value="${user.account}" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户昵称</label>
                <div class="layui-input-inline">
                    <input type="text" value="${user.name}" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户密码</label>
                <div class="layui-input-inline">
                    <input type="text" placeholder="请输入新密码" name="newPass" class="layui-input">
                </div>
            </div>

            <button type="submit" class="layui-btn">立即更改
            </button>
        </form>

    </div>
</div>
</body>
</html>
