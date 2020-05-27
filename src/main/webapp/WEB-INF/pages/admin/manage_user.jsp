<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/26
  Time: 22:05
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
        <form class="layui-form layui-form-pane" method="post" action="${pageContext.request.contextPath}/admin/searchUser">
            <ul style="display: inline-flex;height: 40px;padding-top: 10px;">
                <li>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户昵称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" placeholder="输入用户昵称"
                                   class="layui-input">
                        </div>
                    </div>
                </li>
                <li>
                    <button type="submit" class="layui-btn">搜索用户</button>
                </li>
            </ul>
        </form>
        <c:if test="${users!=null}">
            <table class="layui-table">
                <thead>
                <tr>
                    <th style="width: 30px;"></th>
                    <th style="width: 50px;">用户ID</th>
                    <th style="width: 80px;">用户头像</th>
                    <th style="width: 100px;">用户账号</th>
                    <th style="width: 105px;">用户昵称</th>
                    <th style="width: 160px;">注册时间</th>
                    <th style="width: 305px;">个性签名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><input type="checkbox" name="" value="${user.id}"></td>
                        <td>${user.id}</td>
                        <td><img src="//${headPicPath}/${user.headPic}" alt="头像"
                                 onerror="this.src='../static/img/default.jpg'" width="80" height="80"></td>
                        <td>${user.account}</td>
                        <td>${user.name}</td>
                        <td><fmt:formatDate value="${user.time}"
                                            type="BOTH" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${user.signature}</td>
                        <td>
                            <button type="button" class="layui-btn">
                                <a href="${pageContext.request.contextPath}/admin/changePwd?userId=${user.id}">重置密码</a>
                            </button>
                            <button type="button" class="layui-btn"
                                    onclick="del(this,${user.id})">删除用户
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${pageInfo!=null}">
            <table class="layui-table">
                <thead>
                <tr>
                    <th style="width: 30px;"></th>
                    <th style="width: 50px;">用户ID</th>
                    <th style="width: 80px;">用户头像</th>
                    <th style="width: 100px;">用户账号</th>
                    <th style="width: 105px;">用户昵称</th>
                    <th style="width: 160px;">注册时间</th>
                    <th style="width: 305px;">个性签名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${pageInfo.list }" var="user">
                    <tr>
                        <td><input type="checkbox" name="" value="${user.id}"></td>
                        <td>${user.id}</td>
                        <td><img src="//${headPicPath}/${user.headPic}" alt="头像"
                                 onerror="this.src='../static/img/default.jpg'" width="80" height="80"></td>
                        <td>${user.account}</td>
                        <td>${user.name}</td>
                        <td><fmt:formatDate value="${user.time}"
                                            type="BOTH" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${user.signature}</td>
                        <td>
                            <button type="button" class="layui-btn">
                                <a href="${pageContext.request.contextPath}/admin/changePwd?userId=${user.id}">重置密码</a>
                            </button>
                            <button type="button" class="layui-btn"
                                    onclick="del(this,${user.id})">删除用户
                            </button>
                        </td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <c:if test="${pageInfo.total>5}">
                <div>
                    <ul style="width: 500px; margin: auto;">
                        <c:if test="${pageInfo.pageNum!=1 }">
                            <a href="${pageContext.request.contextPath}/admin/manageUser?pageIndex=${pageInfo.pageNum-1 }">
                                <button
                                        type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                    <i class="layui-icon">&#xe603;</i>
                                </button>
                            </a>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                            <a href="${pageContext.request.contextPath}/admin/manageUser?pageIndex=${status.count }">
                                <button type="button"
                                        class="layui-btn layui-btn-primary layui-btn-sm">${status.count }</button>
                            </a>

                        </c:forEach>
                        <c:if test="${pageInfo.pageNum!=pageInfo.pages }">
                            <a href="${pageContext.request.contextPath}/admin/manageUser?pageIndex=${pageInfo.pageNum+1 }">
                                <button
                                        type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                    <i class="layui-icon">&#xe602;</i>
                                </button>
                            </a>
                        </c:if>

                    </ul>
                </div>
            </c:if>
        </c:if>

    </div>

    <div class="layui-footer">
        © techblog 后台管理
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use(['jquery','layer'],function () {
        var $=layui.jquery;
        var layer=layui.layer;

        window.del=function (object,userId) {
            $.ajax({
                type:'post',
                url:'../admin/delUser',
                data:{userId:userId},
                success:function (result) {
                    if (result==="success"){
                        $(object).parent("td").parent("tr").remove();
                        layer.msg("删除成功！");
                    }
                }
            });
        };



    });


</script>
</html>
