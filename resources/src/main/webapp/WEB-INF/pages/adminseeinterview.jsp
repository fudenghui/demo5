<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 7:27
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
    <title>查看受邀面试</title>
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
        <div>
            <div id="menu_admin">
                <a href="">首页</a><br>
                <a href="seeDepart">查看部门职位</a><br>
                <a href="adminSeeDeliver?curentPage=1">查看招聘投递</a><br>
                <a href="adminSeeInterview?curentPage=1">查看受邀面试</a><br>
                <a href="goAddRecruit">添加招聘信息</a><br>
                <a href="adminSeeRecruits?curentPage=1">查看招聘信息</a><br>
                <a href="">个人中心</a><br>
            </div>
            <div id="contenter_admin">
                <c:forEach items="${sessionScope.interviewList}" var="interview">
                    邀请人id：<input readonly="readonly"  value="${interview.adminId}"/>
                    面试部门id：<input readonly="readonly"  value="${interview.departId}"/>
                    面试职位id：<input readonly="readonly" value="${interview.positionId}"/><br>
                    受邀用户id：<input readonly="readonly"  value="${interview.userId}">
                    面试时间：<input name="interviewTime" value="${interview.interviewTime}"/>
                    面试地址：<input name="location" value="${interview.location}">
                    联系电话：<input name="phone" value="${interview.phone}"><br>
                    <form action="addStaff" method="post">
                        薪资：<input name="salary">
                        <input type="hidden" name="id" value="${interview.id}">
                        <input type="submit" value="录用">
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
