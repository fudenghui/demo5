<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/24 0024
  Time: 下午 2:26
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
<a href="goFirst">首页</a>
</body>
</html>
