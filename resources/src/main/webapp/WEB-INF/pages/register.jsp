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
    <title></title>
</head>
<body>
<form action="register" method="post">
    账号：<input name="name"><br>
    密码：<input name="pass"><br>
    <input type="submit" value="注册">
</form>
</body>
</html>
