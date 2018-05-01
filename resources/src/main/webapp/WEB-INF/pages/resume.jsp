<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 10:02
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
    <title>个人简历</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<body>
    <div>
        <div id="top_admin">
            <div id="logo_admin">
                欢迎来到XXXXX公司
            </div>
        </div>
    </div>
    <div>
        <div id="user_menu">
            <a href="goFirst">首页</a>
            <a href="goUserInfo">账户信息</a>
            <a href="seeResume">个人简历信息</a>
            <a href="goAddResume">编辑简历</a>
            <a href="seeInterview?curentPage=1">面试邀请查看</a>
        </div>
    </div>
    <div id="resume_body">
        <div id="user_content">
            <table>
                <tr>
                    <td>简历id</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${sessionScope.resumes}" var="resume">
                    <tr>
                        <td>${resume.id}</td>
                        <td>${resume.userName}</td>
                        <td>${resume.sex}</td>
                        <td>${resume.age}</td>
                        <td>${resume.state}</td>
                        <td>
                            <form method="post" action="seeResumeInfo">
                                <input type="hidden" name="id" value="${resume.id}">
                                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                                <input type="submit" value="查看详情">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
