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
            <div id="content_staff_left">
                <form method="post" action="addReconsider">
                    薪资单时间：<select name="recDate">
                        <option>请选择时间</option>
                        <c:forEach items="${sessionScope.salaryList}" var="salary">
                            <option>${salary.salaryDate}</option>
                        </c:forEach>
                    </select>
                    复议金额：<input name="recMoney"><br>
                    复议描述：<textarea name="recContent" cols="50" rows="5"></textarea><br>
                    <input type="submit" value="申请薪资复议">
                </form>
                <div>
                    薪资复议记录：
                    <table>
                        <tr>
                            <td>薪资时间</td>
                            <td>复议金额</td>
                            <td>复议描述</td>
                            <td>复议状态</td>
                            <td>申请时间</td>
                        </tr>
                        <c:forEach items="${sessionScope.recList}" var="rec">
                            <tr>
                                <td>${rec.recDate}</td>
                                <td>${rec.recMoney}</td>
                                <td>${rec.recContent}</td>
                                <td>
                                    <c:if test="${rec.recState==1}">
                                        处理中
                                    </c:if>
                                    <c:if test="${rec.recState==2}">
                                        已通过
                                    </c:if>
                                    <c:if test="${rec.recState==0}">
                                        未通过
                                    </c:if>
                                </td>
                                <td>${rec.recTime}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div id="content_staff_right">
                <c:forEach items="${sessionScope.salaryList}" var="salary">
                    ${salary}
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
