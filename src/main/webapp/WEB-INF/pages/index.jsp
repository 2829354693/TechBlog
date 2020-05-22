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
    <link href="./static/css/style.css" rel="stylesheet" type="text/css"/>
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
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=编程语言">编程语言</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=算法">算法</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=web开发">web开发</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=小程序开发">小程序开发</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=操作系统">操作系统</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=数据库">数据库</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=网络">网络</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=Linux">Linux</a>
                    </h2>
                </div>
            </li>
            <li>
                <div class="jq22-list-wrap-box">
                    <h2>
                        <img src="static/images/leftitem.jpg" alt=""><a href="./byType?type=分布式">分布式</a>
                    </h2>
                </div>
            </li>
        </ul>
    </div>
    <div class="layui-tab" style="width: 700px;float: left;margin-left: 10px">
        <ul class="layui-tab-title">
            <li class="layui-this"><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li>我赞</li>
            <li>我评</li>
            <li>随便看看</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <c:if test="${blogAndUsers.size()==0}">
                    <p>还没人发布此类型的博客呢，快去发布吧！(^_^)</p>
                </c:if>
                <c:forEach items="${blogAndUsers}" var="item">
                    <div class="blog-item">
                        <div class="blog-title-pre">
                            <a href="${pageContext.request.contextPath}/blog/detail?blogId=${item.blogId}">${item.title}</a>
                        </div>
                        <div class="blog-user-head-pre">
                            <img src="//${headPicPath}/${item.headPic}" alt="用户头像" width="70" height="70" style="margin-top: -25px">
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

            </div>
            <div class="layui-tab-item">内容2</div>
            <div class="layui-tab-item">内容3</div>
            <div class="layui-tab-item">内容4</div>
        </div>
    </div>
    <div class="main-right">
        <div class="blog-ranking-head">
            <p>-热度排行榜-</p>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #ef0d0d;">
                    <p class="blog-ranking-num-div-p">1</p>
                </div>
                <p class="blog-ranking-num-p"><a href="">不要把异常当不要把异常当做业务做业务做做业务逻辑...</a></p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #2b84e3;">
                    <p class="blog-ranking-num-div-p">2</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当做业务逻辑要把异常当做业务逻辑</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #f9bc7c;">
                    <p class="blog-ranking-num-div-p">3</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当不要把异常当做业务做业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">4</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当不要把异常当做业务做业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">5</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常不要把异常当做业务当做业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">6</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常不要把异常当做业务当做业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">7</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当不要把异常当做业务做业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">8</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当做不要把异常当做业务业务逻辑...</p>
            </div>
        </div>
        <div class="blog-ranking-num">
            <div style="line-height: 3.5;">
                <div class="blog-ranking-num-div" style="background: #aca9a9;">
                    <p class="blog-ranking-num-div-p">9</p>
                </div>
                <p class="blog-ranking-num-p">不要把异常当做业务逻辑不要把异常当做业务...</p>
            </div>
        </div>

    </div>
</div>

</body>

<script type="text/javascript">

    history.go(1);

    layui.use(['element','layer','jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var $ = layui.jquery;

        // var content = $("#content").val();
        // console.log(content);
        //
        // $("#content").val(content.replace(/<[^>]+>/g,""));

        <%--var num = '${num}';--%>

        <%--console.log(num);--%>

        <%--var array = new Array();--%>
        <%--var i = 0;--%>
        <%--for (i; i < num; i++) {--%>
        <%--    array.push('${blogAndUsers.get(0).content}');--%>
        <%--    var a = '${blogAndUsers.remove(0)}';--%>
        <%--}--%>

        <%--console.log(array);--%>

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
