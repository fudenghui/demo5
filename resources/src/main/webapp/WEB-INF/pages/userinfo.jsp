<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 10:05
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
    <title>个人中心</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<body>
    <div>
        <div id="user_menu">
            <a href="">账户信息</a><br>
            <a href="">个人简历信息</a><br>
            <a href="">编辑简历</a><br>
        </div>
        <div id="user_content">
            <table>
                <tr>
                    <td>用户名</td>
                    <td>密码</td>
                </tr>
                <tr>
                    <td>${sessionScope.user.name}</td>
                    <td>******</td>
                </tr>
            </table>
            <fieldset>
                <legend>修改密码</legend>
                <form action="updateUser" method="post">
                    原密码：<input type="password" name="passOld"><br>
                    新密码：<input type="password" name="passNew"><br>
                    确认密码：<input type="password" name="passNew1"><br>
                    <input type="submit" value="修改密码">
                </form>
            </fieldset>
        </div>
    </div>
</body>
</html>
