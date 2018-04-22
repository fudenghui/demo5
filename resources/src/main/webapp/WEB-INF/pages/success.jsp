<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/22 0022
  Time: 下午 3:27
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
    <title>成功页面</title>
</head>
<body>

</body>
</html>
