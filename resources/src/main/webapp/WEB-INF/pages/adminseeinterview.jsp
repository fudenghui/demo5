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
        $(function () {
            $("#menu_admin a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#menu_admin a").mouseout(function () {
                $(this).toggleClass("a");
            });
        })
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
                <a href="goFirst">首页</a>
                <a href="seeDepart">查看部门职位</a>
                <a href="adminSeeDeliver?curentPage=1">查看招聘投递</a>
                <a href="adminSeeInterview?curentPage=1">查看受邀面试</a>
                <a href="goAddRecruit">添加招聘信息</a>
                <a href="adminSeeRecruits?curentPage=1">查看招聘信息</a>
                <a href="adminaddtrain?curentPage=1">查看添加培训信息</a>
                <a href="adminAddWardPunish?curentPage=1">查看添加奖惩</a>
                <a href="goAddSalary">发布薪资单</a>
                <a href="">个人中心</a>
            </div>
            <div id="contenter_admin">
                <div id="seeInterview">
                    <table>
                        <tr>
                            <td>面试部门</td>
                            <td>面试职位</td>
                            <td>面试时间</td>
                            <td>面试地点</td>
                            <td>联系电话</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${sessionScope.interviewList}" var="interview">
                            <tr>
                                <td>${interview.depart.departName}</td>
                                <td>${interview.position.positionName}</td>
                                <td>${interview.interviewTime}</td>
                                <td>${interview.location}</td>
                                <td>${interview.phone}</td>
                                <td>
                                    <c:if test="${interview.interviewState==1}">
                                        已录用
                                    </c:if>
                                    <c:if test="${interview.interviewState==2}">
                                        已接受
                                    </c:if>
                                    <c:if test="${interview.interviewState==3}">
                                        未接受
                                    </c:if>
                                </td>
                                <td>
                                    <form action="addStaff" method="post">
                                        <input type="hidden" name="id" value="${interview.id}">
                                        <input type="submit" value="录用">
                                    </form>
                                    <form action="updateInterviewForNoSure" method="post">
                                        <input type="hidden" name="id" value="${interview.id}">
                                        <input type="submit" value="不录用">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
