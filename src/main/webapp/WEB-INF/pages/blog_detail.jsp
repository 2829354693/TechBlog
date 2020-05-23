<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/22
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>博客阅读</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="head.jsp"/>
<jsp:include page="base.jsp"/>

<div class="jq22-list-item">
    <div class="blog-read-main">
        <div class="blog-read-title">
            <div class="title-font">${blog.title}</div>
        </div>
        <div class="blog-read-content">
            ${blog.content}
        </div>
        <div class="read-footer">
            <div style="float: left;"><fmt:formatDate value="${blog.time}" type="both"/></div>
            <div style="float: right;">阅读(${blog.readNum})</div>
            <div style="float: right;">
                <button type="button" onclick="blogLike()">赞</button>
                点赞(<p id="blogLikeNum">${blogLikeNum}</p>
                <%--                <input type="text" id="blogLikeNum" value="${blogLikeNum}" style="border: none;width: auto">--%>
                )
            </div>
            <div style="float: right;">评论(${commentNum})</div>
        </div>

        <div class="comment-input">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">请输入评论内容</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入评论内容" id="comment_input" class="layui-textarea"></textarea>
                    </div>
                </div>
                <button type="button" onclick="comment()" style="background: #436cac" class="layui-btn">提交评论</button>
            </form>
        </div>

        <div class="blog-read-comment">
            <c:forEach items="${allComment}" var="comment">
            <div class="comment-item">
                <div>
                    <img src="//${headPicPath}/${comment.headPic}" alt="头像" width="70" height="70">
                </div>
                <div>
                    <p><a href="">${comment.username}</a></p>
                </div>
                <div>
                    <p>${comment.commentContent}</p>
                </div>
                <div>
                    <p><fmt:formatDate value="${comment.commentTime}" type="both"/></p>
                </div>
                <div>
                    <button type="button" onclick="commentLike(${comment.commentId},this)">赞</button>
                        点赞(
                    <p>${comment.commentLikeNum}</p>
                    )
                </div>
            </div>
            </c:forEach>
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
    layui.use(['jquery', 'layer'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;

        window.comment = function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "../user/login";
                });
            } else {
                var commentContent = $("#comment_input").val();
                var blogId = '${blog.id}';
                $.ajax({
                    type: 'post',
                    url: '../comment/addComment',
                    data: {"commentContent": commentContent, "blogId": blogId},
                    success: function (result) {
                        if (result != null) {
                            var headPicPath = result.headPicPath;
                            var headPic = result.headPic;
                            var username = result.username;
                            var commentContent = result.commentContent;
                            var commentTime = result.commentTime;
                            var cTime = new Date(commentTime).Format("yyyy-MM-dd HH:mm:ss");

                            var text = "";
                            text += "<div class=\"comment-item\">";
                            text += "                    <div>";
                            text += "                        <img src=\"//" + headPicPath + "/" + headPic + "\" alt=\"头像\" width=\"70\" height=\"70\">";
                            text += "                    </div>";
                            text += "                    <div>";
                            text += "                        <p><a href=\"\">" + username + "</a></p>";
                            text += "                    </div>";
                            text += "                    <div>";
                            text += "                        <p>" + commentContent + "</p>";
                            text += "                    </div>";
                            text += "                    <div>";
                            text += "                        <p>" + cTime + "</p>";
                            text += "                    </div>";
                            text += "                    <div>";
                            text += "                        <p>点赞(0)</p>";
                            text += "                    </div>";
                            text += "                </div>";

                            $(".blog-read-comment").prepend(text);

                            layer.msg("评论成功！");

                        }
                    }

                });

            }


        };

        window.blogLike = function () {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，登陆后可点赞评论', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "../user/login";
                });
            } else {
                var blogId = '${blog.id}';

                $.ajax({
                    type: 'post',
                    url: '../blog/blogLike',
                    data: {"blogId": blogId},
                    success: function (result) {
                        if (result === "alreadyLike") {
                            layer.msg("您已赞过此博客！");
                        } else if (result === "success") {
                            var blogLikeNum = $("#blogLikeNum").text();
                            var newBlogLikeNum = parseInt(blogLikeNum) + 1;
                            $("#blogLikeNum").text(newBlogLikeNum);
                            layer.msg("点赞成功！");
                        }
                    }

                });
            }
        };

        window.commentLike = function (commentId,obj) {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，登陆后可点赞评论', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "../user/login";
                });
            } else {
                $.ajax({
                    type:'post',
                    url:'../comment/commentLike',
                    data:{"commentId":commentId},
                    success:function (result) {
                        if (result==="alreadyLike"){
                            layer.msg("您已赞过此评论！");
                        }else if (result==="success"){
                            var commentLikeNum = $(obj).next("p").text();
                            var newcommentLikeNum = parseInt(commentLikeNum) + 1;
                            $(obj).next("p").text(newcommentLikeNum);
                            layer.msg("点赞成功！");
                        }
                    }
                });
            }
        };
    });

    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "H+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
</script>
</html>
