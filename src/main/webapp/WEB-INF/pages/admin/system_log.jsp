<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/27
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <table class="layui-table">
            <thead>
            <tr>
                <th style="width: 30px;"></th>
                <th style="width: 50px;">日志ID</th>
                <th style="width: 80px;">操作者名称</th>
                <th style="width: 100px;">操作时间</th>
                <th style="width: 200px;">操作者ip地址</th>
                <th style="width: 160px;">操作事件</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${logs}" var="log">
                <tr>
                    <td><input type="checkbox" name="" value="${log.logId}"></td>
                    <td>${log.logId}</td>
                    <td>${log.logName}</td>
                    <td><fmt:formatDate value="${log.logTime}"
                                        type="BOTH" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${log.logIp}</td>
                    <td>${log.logWay}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

    <div class="layui-footer">
        © techblog 后台管理
    </div>
</div>
</body>
</html>
