<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/30 0030
  Time: 下午 5:31
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
    <title>查看奖惩</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            $("#menu a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#menu a").mouseout(function () {
                $(this).toggleClass("a");
            });
        })
    </script>
</head>
<body>
    <div>
        <div id="top">
            <div id="logo">
                欢迎来到XXXXX公司
            </div>
        </div>
        <div id="menu">
            <a href="goFirst">首页</a>
            <a href="staffSeeDepart">查看部门职位</a>
            <a href="seeTrain">培训</a>
            <a href="seeSalary">薪资</a>
            <a href="seeWardPunish">奖惩</a>
            <a href="seeCheck">考勤</a>
        </div>
        <div id="content_staff">
            <c:forEach items="${sessionScope.wpList}" var="wp">
                ${wp}
            </c:forEach>
        </div>
    </div>
</body>
</html>
