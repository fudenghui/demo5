<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 7:31
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
    <div>
        <input readonly="readonly" value="欢迎${sessionScope.user.name}"/>
    </div>
    <div id="resume_body">
        <div id="user_menu">
            <a href="goUserInfo">账户信息</a><br>
            <a href="seeResume">个人简历信息</a><br>
            <a href="goAddResume">编辑简历</a><br>
            <a href="seeInterview?curentPage=1">面试邀请查看</a><br>
        </div>
        <div id="user_content">

        </div>
    </div>
</body>
</html>
