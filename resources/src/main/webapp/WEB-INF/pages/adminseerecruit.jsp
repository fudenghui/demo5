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
                <a href="">查看招聘投递</a><br>
                <a href="">添加招聘信息</a><br>
                <a href="">查看招聘信息</a><br>
                <a href="">个人中心</a><br>
            </div>
            <div id="contenter_admin">
                <table>
                    <c:forEach items="${sessionScope.recruitList}" var="recruit">
                        <tr>
                            部门：<td>${recruit.depart.departName}</td>
                            职位：<td>${recruit.position.positionName}</td>
                            招聘人数：<td>${recruit.number}</td>
                            <td>
                                <form action="addDeliverResume?recuitId=${recruit.id}" method="post">
                                    简历选择：<select name="resumeId">
                                    <c:forEach items="" var="resume">
                                        <option>${resume.id}</option>
                                    </c:forEach>
                                </select>
                                    <input type="submit" value="投递">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            开始时间：<td>${recruit.startTime}</td>
                            结束时间：<td>${recruit.overTime}</td>
                        </tr>
                        <tr>
                            招聘要求：<td>${recruit.demand}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
