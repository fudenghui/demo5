<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>面试邀请查看</title>
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
            <c:forEach items="${sessionScope.interviewList}" var="interview">
                邀请人id：<input readonly="readonly"  value="${interview.adminId}"/>
                面试部门id：<input readonly="readonly"  value="${interview.departId}"/>
                面试职位id：<input readonly="readonly" value="${interview.positionId}"/><br>
                受邀用户id：<input readonly="readonly"  value="${interview.userId}">
                面试时间：<input name="interviewTime" value="${interview.interviewTime}"/>
                面试地址：<input name="location" value="${interview.location}">
                联系电话：<input name="phone" value="${interview.phone}"><br>
                <form action="updateInterviewById" method="post">
                    <input type="hidden" name="interviewId" value="${interview.id}">
                    <input type="submit" value="接受面试">
                </form>
            </c:forEach>
        </div>
    </div>
</body>
</html>
