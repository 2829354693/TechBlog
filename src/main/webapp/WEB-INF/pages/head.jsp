<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/18
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="jq22-header">
    <div class="jq22-comm-box clearfix">
        <div class="jq22-nav-logo">
            <a href="#">
                <img src="${pageContext.request.contextPath}/static/img/logo.gif" alt="" class="jq22-nav-logo1">
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/static/images/icon-gf.gif" alt="" class="jq22-nav-logo2">
            </a>
        </div>
        <div class="jq22-nav-nav">
            <dl class="clearfix">
                <dd class="on">
                    <h3 class="jq22-clear">
                        <a href="${pageContext.request.contextPath}/">首页</a>
                    </h3>
                </dd>
                <dd>
                    <h3>
                        <a href="#">精选</a>
                    </h3>
                    <div class="jq22-hot"></div>
                </dd>
                <dd>
                    <h3>
                        <a href="#">新闻</a>
                    </h3>
                </dd>
                <dd>
                    <h3>
                        <a href="#">收藏</a>
                    </h3>
                </dd>
            </dl>
        </div>
        <div class="search-header">
            <form class="layui-form" action="user/filterBlog" method="post">
                <div class="layui-form-item">
                    <ul style="width: 270px;">
                        <li style="float: left;">
                            <input type="text" placeholder="搜索博客" name="titlePart" class="layui-input">
                        </li>
                        <li>
                            <button type="submit" class="layui-btn layui-btn-primary">搜索</button>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="welcome">
            <c:if test="${empty sessionScope.user}">
                <div><p style="float: left">您好，游客</p><p style="float: left;margin-left: 10px">[<a style="color: #ff9317" href="${pageContext.request.contextPath}/user/login">登录</a>-<a style="color: #ff9317" href="${pageContext.request.contextPath}/user/login">注册</a>]</p></div>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div>
                    您好，${sessionScope.user.name} <a href="${pageContext.request.contextPath}/user/logout"> 退出登录</a>
                </div>
            </c:if>
        </div>
        <div class="jq22-nav-right">
            <p id="self" class="selfbut">个人中心</p>
        </div>
    </div>
</div>
<div class="jq22-background">
    <p>欢迎来到tech blog!</p>
</div>

