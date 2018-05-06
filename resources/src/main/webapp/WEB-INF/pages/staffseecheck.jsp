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
    <title>查看考勤并打卡</title>
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
            <a href="addCheck">打卡</a>
            <table>
                <tr>
                    <td>上班打卡时间</td>
                    <td>打卡状态</td>
                    <td>下班打卡时间</td>
                    <td>打卡状态</td>
                </tr>
                <c:forEach items="${sessionScope.checkList}" var="check">
                    <tr>
                        <td><fmt:formatDate value="${check.onWorkTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td>${check.onworkState}</td>
                        <td><fmt:formatDate value="${check.outWorkTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${check.outworkState}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
