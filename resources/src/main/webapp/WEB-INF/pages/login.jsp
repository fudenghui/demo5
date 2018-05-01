<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/20 0020
  Time: 下午 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>游客注册</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<div>
<div>
<a href="goFirst">首页</a>
</div>
<form action="login" method="post">
    账号：<input name="name" id="name"><br>
    密码：<input type="password" name="pass" id="pass"><br>
    <select name="cl" id="cl">
        <option>游客</option>
        <option>员工</option>
    </select>
    <input type="submit" value="登录">
</form>
</body>
</html>
