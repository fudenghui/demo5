<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 1:00
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
    <div id="top">
        <div id="logo">
            欢迎来到XXXXX公司
        </div>
        <div id="login">
            <div id="loginArea">
                <form action="login" method="post">
                    账号：<input name="name"><br>
                    密码：<input name="pass"><br>
                    <select name="cl">
                        <option>游客</option>
                        <option>员工</option>
                    </select>
                    <input type="submit" value="登录" id="log2">
                </form>
            </div>
            <input type="button" value="登录" id="log1">
            <input type="button" value="注册" id="reg">
        </div>
    </div>
    <div id="menu">
        <a href="">首页</a>
        <a href="">招聘</a>
        <a href="">个人中心</a>
    </div>
    <div id="contenter">
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
</body>
</html>
