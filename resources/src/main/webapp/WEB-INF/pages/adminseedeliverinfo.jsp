<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26 0026
  Time: 下午 1:25
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
    <title>查看投递详情</title>
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
                <a href="goAddRecruit">添加招聘信息</a><br>
                <a href="adminSeeRecruits?curentPage=1">查看招聘信息</a><br>
                <a href="">个人中心</a><br>
            </div>
            <div id="contenter_admin">
                <input type="hidden" value="${sessionScope.deliverResume.id}">
                姓名：<input name="userName" value="${sessionScope.deliverResume.userName}"/>年龄：<input name="age" value="${sessionScope.deliverResume.age}"><br>
                性别：<input name="sex" value="${sessionScope.deliverResume.sex}">电话：<input name="phone" value="${sessionScope.deliverResume.phone}"><br>
                身份证号：<input name="cardId" value="${sessionScope.deliverResume.cardId}"><br>
                邮箱：<input name="email" value="${sessionScope.deliverResume.email}">
                状态：<input name="state" value="${sessionScope.deliverResume.state}"/><br>
                学历：<input name="edu" value="${sessionScope.deliverResume.edu}">
                毕业院校：<input name="school" value="${sessionScope.deliverResume.school}">
                专业：<input name="major" value="${sessionScope.deliverResume.major}"><br>
                期望薪资：<input name="expSal" value="${sessionScope.deliverResume.expSal}"><br>
                就业经历：<textarea name="workOld" cols="50" rows="20" content="${sessionScope.deliverResume.workOld}"></textarea><br>
                自我评价：<textarea name="rate" cols="50" rows="10" content="${sessionScope.deliverResume.rate}"></textarea>
                <form action="addInterview" method="post">
                    <input type="hidden" value="${sessionScope.deliverResume.id}" name="deliverResumeId">
                    <input type="hidden" value="${sessionScope.deliverResume.recruitId}" name="recruitId"/>
                    <input type="hidden" value="${sessionScope.deliverResume.userId}" name="userId"/>
                    <input type="submit" value="邀请面试">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
