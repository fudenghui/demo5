<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/20 0012
  Time: 8:57
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
    <title>主页面</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            $("#log1").click(function () {
                $("#loginArea").css("display","block");
            });
            $("#log2").click(function () {
                $("#loginArea").css("display","none");
            });
            $("#reg").click(function () {
                location.href="goRegister";
            });
        });
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
                    <form action="login" method="post">
                        账号：<input name="name"><br>
                        密码：<input name="pass"><br>
                        <select name="cl">
                            <option>游客</option>
                            <option>员工</option>
                        </select>
                        <input type="submit" value="登录" id="log2">
                    </form>
                </div>
                <input type="button" value="登录" id="log1">
                <input type="button" value="注册" id="reg">
            </div>
        </div>
        <div id="menu">
            <a href="">首页</a>
            <a href="">招聘</a>
            <a href="">个人中心</a>
        </div>
        <div id="contenter">

        </div>
    </div>
</body>
</html>

