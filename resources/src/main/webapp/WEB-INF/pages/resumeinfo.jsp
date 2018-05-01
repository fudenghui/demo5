<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 10:47
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
    <title>简历详情</title>
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
    <div id="resume_body">
        <div id="user_menu">
            <a href="goFirst">首页</a>
            <a href="goUserInfo">账户信息</a>
            <a href="seeResume">个人简历信息</a>
            <a href="goAddResume">编辑简历</a>
            <a href="seeInterview?curentPage=1">面试邀请查看</a>
        </div>
        <div id="user_content">
            <form method="post" action="updateResume">
                <input type="hidden" value="${sessionScope.resumeInfo.id}">
                姓名：<input name="userName" value="${sessionScope.resumeInfo.userName}"/>年龄：<input name="age" value="${sessionScope.resumeInfo.age}"><br>
                性别：<input name="sex" value="${sessionScope.resumeInfo.sex}">电话：<input name="phone" value="${sessionScope.resumeInfo.phone}"><br>
                身份证号：<input name="cardId" value="${sessionScope.resumeInfo.cardId}"><br>
                邮箱：<input name="email" value="${sessionScope.resumeInfo.email}">
                状态：<input name="state" value="${sessionScope.resumeInfo.state}"/><br>
                学历：<input name="edu" value="${sessionScope.resumeInfo.edu}">
                毕业院校：<input name="school" value="${sessionScope.resumeInfo.school}">
                专业：<input name="major" value="${sessionScope.resumeInfo.major}"><br>
                期望薪资：<input name="expSal" value="${sessionScope.resumeInfo.expSal}"><br>
                就业经历：<textarea name="workOld" cols="50" rows="10" >${sessionScope.resumeInfo.workOld}</textarea><br>
                自我评价：<textarea name="rate" cols="50" rows="10">${sessionScope.resumeInfo.rate}</textarea><br>
                <input type="submit" value="保存">
            </form>
        </div>
    </div>
</body>
</html>
