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
        $(function () {
            $("#user_menu a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#user_menu a").mouseout(function () {
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
                            <c:if test="${interview.interviewState==0}">
                                未录用
                            </c:if>
                        </td>
                        <td>
                            <form action="updateInterviewById" method="post">
                                <input type="hidden" name="interviewId" value="${interview.id}">
                                <input type="submit" value="接受面试">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
