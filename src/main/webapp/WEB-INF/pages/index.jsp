<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/18
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>tech blog</title>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
<jsp:include page="head.jsp"/>
<jsp:include page="base.jsp"/>

<div class="jq22-list-item">
    <div class="jq22-list-wrap">
        <ul>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=编程语言">编程语言</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=算法">算法</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=web开发">web开发</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=小程序开发">小程序开发</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=操作系统">操作系统</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=数据库">数据库</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=网络">网络</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=Linux">Linux</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="${pageContext.request.contextPath}/static/images/leftitem.jpg" alt=""><a href="./byType?type=分布式">分布式</a>
                    </h2>
                </div>
            </li>
        </ul>
    </div>
    <div class="layui-tab" style="width: 700px;float: left;margin-left: 10px">
        <ul class="layui-tab-title">
            <li class="layui-this"><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li><p id="myLike">我赞</p></li>
            <li><p id="myComment">我评</p></li>
            <li>随便看看</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <c:if test="${pageInfo!=null}">
                    <c:forEach items="${pageInfo.list}" var="item">
                        <div class="blog-item">
                            <div class="blog-title-pre">
                                <a href="${pageContext.request.contextPath}/blog/detail?blogId=${item.blogId}">${item.title}</a>
                            </div>
                            <div class="blog-user-head-pre">
                                <img src="//${headPicPath}/${item.headPic}" onerror="this.src='./static/img/default.jpg'" alt="用户头像" width="70" height="70" style="margin-top: -25px">
                            </div>
                            <div class="blog-user-name-pre">
                                <a href="">${item.name}</a>
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

                    <c:if test="${pageInfo.total>5}">
                        <div>
                            <ul style="width: 500px; margin: auto;">
                                <c:if test="${pageInfo.pageNum!=1 }">
                                    <a href="${pageContext.request.contextPath}/?pageIndex=${pageInfo.pageNum-1 }" style="text-decoration: none;">
                                        <button
                                                type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                            <i class="layui-icon">&#xe603;</i>
                                        </button>
                                    </a>
                                </c:if>
                                <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                                    <a href="${pageContext.request.contextPath}/?pageIndex=${status.count }" style="text-decoration: none;">
                                        <button type="button"
                                                class="layui-btn layui-btn-primary layui-btn-sm">${status.count }</button>
                                    </a>
                                </c:forEach>
                                <c:if test="${pageInfo.pageNum!=pageInfo.pages }">
                                    <a href="${pageContext.request.contextPath}/?pageIndex=${pageInfo.pageNum+1 }" style="text-decoration: none;">
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

                <c:if test="${pageInfo==null}">
                    <c:if test="${blogAndUsers.size()==0}">
                        <p>未找到符合条件的博客呢，快去发布吧！(^_^)</p>
                    </c:if>
                    <c:forEach items="${blogAndUsers}" var="item">
                        <div class="blog-item">
                            <div class="blog-title-pre">
                                <a href="${pageContext.request.contextPath}/blog/detail?blogId=${item.blogId}">${item.title}</a>
                            </div>
                            <div class="blog-user-head-pre">
                                <img src="//${headPicPath}/${item.headPic}" onerror="this.src='./static/img/default.jpg'" alt="用户头像" width="70" height="70" style="margin-top: -25px">
                            </div>
                            <div class="blog-user-name-pre">
                                <a href="">${item.name}</a>
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
                </c:if>
            </div>
            <div class="layui-tab-item"></div>
            <div class="layui-tab-item"></div>
            <div class="layui-tab-item">待开发</div>
        </div>
    </div>
    <div class="main-right">
        <div class="blog-ranking-head">
            <p>-热度排行榜-</p>
        </div>
        <c:forEach items="${topTen}" var="blog" varStatus="index">
            <div class="blog-ranking-num">
                <div style="line-height: 3.5;">
                    <div class="blog-ranking-num-div" style="background: #ef0d0d;">
                        <p class="blog-ranking-num-div-p">${index.index+1}</p>
                    </div>
                    <p class="blog-ranking-num-p"><a href="${pageContext.request.contextPath}/blog/detail?blogId=${blog.id}">${blog.title}</a></p>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

</body>

<script type="text/javascript">

    history.go(1);

    layui.use(['element','layer','jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var $ = layui.jquery;

        $("#myLike").click(function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "./user/login";
                });
            } else {
                location.href='./blog/myBlogLike';
            }
        });

        $("#myComment").click(function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "./user/login";
                });
            } else {
                location.href='./blog/myBlogComment';
            }
        });

        $("#self").click(function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "./user/login";
                });
            } else {
                location.href='./user/userCenter';
            }
        });
    });

</script>
</html>
