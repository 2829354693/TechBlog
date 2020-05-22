<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/5/20
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <jsp:include page="base.jsp"/>
</head>
<body>
<div style="margin: auto">
    <h2>您已退出登录或登录已失效！</h2>
</div>
</body>
<script type="text/javascript">

    layui.use('layer', function () {
        var layer = layui.layer;

        if (${empty sessionScope.user}) {
                layer.confirm('您已退出登录或登录已失效！', {
                    btn: ['去登录', '主页']
                }, function () {
                    location.href = "../user/login";
                }, function(){
                    location.href="../";
                });
        }
    });

</script>
</html>
