<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 4:13
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
    <title>查看招聘信息</title>
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
                <table>
                    <c:forEach items="${sessionScope.recruitList}" var="recruit">
                        <tr>
                            <td>部门：${recruit.depart.departName}</td>
                            <td>职位：${recruit.position.positionName}</td>
                            <td>招聘人数：${recruit.number}</td>
                            <td>发布状态:
                                <c:if test="${recruit.recruitState}==0">
                                    未发布
                                </c:if>
                                <c:if test="${recruit.recruitState}==1">
                                    已发布
                                </c:if>
                                <c:if test="${recruit.recruitState}==2">
                                    已结束
                                </c:if>
                            </td>
                            <td>
                                <form action="updateRecruitState" method="post">
                                    <input type="hidden" name="recruitId" value="${recruit.id}">
                                    <input type="submit" value="发布">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>开始时间：${recruit.startTime}</td>
                            <td>结束时间：${recruit.overTime}</td>
                        </tr>
                        <tr>
                            <td>招聘要求：${recruit.demand}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
