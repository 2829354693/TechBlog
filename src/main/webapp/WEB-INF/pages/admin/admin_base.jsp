<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/27
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/index">后台主页</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/manageUser">用户管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/manageBlog">博文管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/systemLog">系统日志</a></li>
        </ul>
    </div>
</div>
