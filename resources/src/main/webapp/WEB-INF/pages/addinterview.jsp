<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26 0026
  Time: 下午 2:32
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
    <div id="top_admin">
        <div id="logo_admin">
            欢迎来到XXXXX公司
        </div>
    </div>
    <div>
        <div id="menu_admin">
            <a href="goFirst">首页</a>
            <a href="seeDepart">查看部门职位</a>
            <a href="adminSeeDeliver?curentPage=1">查看招聘投递</a>
            <a href="adminSeeInterview?curentPage=1">查看受邀面试</a>
            <a href="goAddRecruit">添加招聘信息</a>
            <a href="adminSeeRecruits?curentPage=1">查看招聘信息</a>
            <a href="adminaddtrain?curentPage=1">查看添加培训信息</a>
            <a href="adminAddWardPunish?curentPage=1">查看添加奖惩</a>
            <a href="">个人中心</a>
        </div>
        <div id="contenter_admin">
            请填写邀请信息：
            <form action="addInterview1" method="post">
                邀请人id：<input readonly="readonly" name="adminId" value="${sessionScope.interview1.adminId}"/><br>
                面试部门id：<input readonly="readonly" name="departId" value="${sessionScope.interview1.departId}"/><br>
                面试职位id：<input readonly="readonly" value="${sessionScope.interview1.positionId}" name="positionId"/><br>
                受邀用户id：<input readonly="readonly" name="userId" value="${sessionScope.interview1.userId}"><br>
                面试时间：<input name="interviewTime"/>
                面试地址：<input name="location">
                联系电话：<input name="phone">
                <input type="hidden" name="deliverResumeId" value="${sessionScope.interview1.deliverResumeId}">
                <input type="submit" value="邀请面试">
            </form>
        </div>
    </div>
</div>
</body>
</html>
