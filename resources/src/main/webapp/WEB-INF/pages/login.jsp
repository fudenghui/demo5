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
        $(function () {
            var userName = $("#user").html();
            if (userName != "") {
                $("#sp").css("display", "block");
            }
            $("#log1").click(function () {
                location.href = "goLogin";
            });
            $("#reg").click(function () {
                location.href = "goRegister";
            });
            $("#menu a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#menu a").mouseout(function () {
                $(this).toggleClass("a");
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
                <div id="login_menu">
                    <span id="sp">欢迎<span id="user">${sessionScope.user.name}</span></span>
                    <span id="level">${sessionScope.user.level}</span>
                    <input type="button" value="登录" id="log1">
                    <input type="button" value="注册" id="reg">
                </div>
            </div>
        </div>
        <div id="menu">
        <a href="goFirst">返回首页</a>
        </div>
        <div id="contenter" class="contenter">
            <div id="content_login">
                <form action="login" method="post">
                    账号：<input name="name" id="name"><br>
                    密码：<input type="password" name="pass" id="pass"><br>
                    <select name="cl" id="cl">
                        <option>游客/管理员</option>
                        <option>员工</option>
                    </select><br>
                    <input type="submit" value="登录" id="log">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
