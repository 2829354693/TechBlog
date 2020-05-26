<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/23
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="../head.jsp"/>
<jsp:include page="../base.jsp"/>
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

    <div class="user-main" style="width: 1000px;margin-left: 5px;">
        <h2>我评论过的博客：</h2>
        <c:if test="${blogAndUsers.size()==0}">
            <p>您还未评论博客呢，快去评论吧！(^_^)</p>
        </c:if>
        <c:forEach items="${blogAndUsers}" var="item">
            <div class="blog-item">
                <div class="blog-title-pre">
                    <a href="${pageContext.request.contextPath}/blog/detail?blogId=${item.blogId}">${item.title}</a>
                </div>
                <div class="blog-user-head-pre">
                    <img src="//${headPicPath}/${item.headPic}" onerror="this.src='../static/img/default.jpg'" alt="用户头像" width="70" height="70" style="margin-top: -25px;border-radius: 50%">
                </div>
                <div class="blog-user-name-pre">
                    <a href="${pageContext.request.contextPath}/user/blogerHome?userId=${item.userId}">${item.name}</a>
                </div>
                <div class="item-foot">
                    <div class="blog-type-pre">
                        <p>类型：${item.type}</p>
                    </div>
                    <div class="blog-time-pre">
                        <p><fmt:formatDate value="${item.publishTime}" type="both" dateStyle="medium" timeStyle="medium"/></p>
                    </div>
                    <div class="blog-comment-pre">
                        评论(${item.commentNum})
                    </div>
                    <div class="blog-read-pre">
                        阅读(${item.readNum})
                    </div>
                    <div class="blog-like-pre">
                        点赞(${item.likeNum})
                    </div>
                </div>
            </div>
        </c:forEach>

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
                    location.href = "../user/login";
                });
            } else {
                location.href = '../user/userCenter';
            }
        });
    });
</script>
</html>
