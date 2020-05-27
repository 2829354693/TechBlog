<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/26
  Time: 14:33
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
    <c:if test="${bloger == null}">
        <h3>该博主已被删除！</h3>
    </c:if>
    <c:if test="${bloger != null}">
        <ul style="margin: auto;">
            <li style="margin: auto;margin-bottom: 50px;">
                <div class="user-info-div">
                    <ul style="width: 300px;margin: auto">
                        <li style="width: 70px;margin: auto">
                            <div><img src="//${headPicPath}/${bloger.headPic}"
                                      onerror="this.src='../static/img/default.jpg'" width="70" height="70" alt="头像" style="border-radius: 50%"></div>
                        </li>
                        <li style="text-align: center;font-weight: bold;color: #0f67b4;font-size: 20px;">
                            <div>${bloger.name}</div>
                        </li>
                        <li style="text-align: center">
                            <div>${bloger.signature}</div>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <div>
                    <h2>发布的博客：</h2>
                    <c:if test="${blogAndUserCustoms.size()==0}">
                        <p>此bloger还未发布博客呢！</p>
                    </c:if>
                    <c:forEach items="${blogAndUserCustoms}" var="item">
                        <div class="blog-item">
                            <div class="blog-title-pre">
                                <a href="${pageContext.request.contextPath}/blog/detail?blogId=${item.blogId}">${item.title}</a>
                            </div>
                            <div class="blog-user-head-pre">
                                <img src="//${headPicPath}/${item.headPic}" onerror="this.src='../static/img/default.jpg'"
                                     alt="用户头像" width="70" height="70" style="margin-top: -25px;border-radius: 50%">
                            </div>
                            <div class="blog-user-name-pre">
                                <a href="${pageContext.request.contextPath}/user/blogerHome?userId=${item.userId}">${item.name}</a>
                            </div>
                            <div class="item-foot">
                                <div class="blog-type-pre">
                                    <p>类型：${item.type}</p>
                                </div>
                                <div class="blog-time-pre">
                                    <p><fmt:formatDate value="${item.publishTime}" type="both" dateStyle="medium"
                                                       timeStyle="medium"/></p>
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
            </li>
        </ul>
    </c:if>
</div>

</body>
<script type="text/javascript">
    layui.use(['jquery', 'layer'], function () {
        var $ = layui.jquery;
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
    });
</script>
</html>
