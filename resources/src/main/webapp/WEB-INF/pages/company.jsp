<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/24 0024
  Time: 下午 12:59
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
    <title>员工中心</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<body>
<div>
    <div id="top">
        <div id="logo">
            欢迎来到XXXXX公司
        </div>
        <div id="login">
            <div id="loginArea">
                账号：<input name="name" id="name"><br>
                密码：<input name="pass" id="pass"><br>
                <select name="cl" id="cl">
                    <option>游客</option>
                    <option>员工</option>
                </select>
                <input type="button" value="登录" id="log2">
            </div>
            <input type="hidden" value="${sessionScope.user.name}" id="user">
            <input type="button" value="登录" id="log1">
            <input type="button" value="注册" id="reg">
        </div>
    </div>
    <div id="menu">
        <a href="goFirst">首页</a>
        <a href="seeRecruits">招聘</a>
        <a href="gostaffInfo">个人中心</a>
    </div>
    <div id="contenter">

    </div>
</div>
</body>
</html>
