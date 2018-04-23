<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 9:23
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
    <title>添加招聘</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<body>
    <div id="recruit_body">
        <form method="post" action="addRecruit">
            部门名称：<select name="departName">
                        <c:forEach items="${sessionScope.departList}" var="depart">
                            <option>${depart.departName}</option>
                        </c:forEach>
                      </select>
            职位名称：<select name="positionName">
                        <c:forEach items="${sessionScope.positionList}" var="position">
                            <option>${position.positionName}</option>
                        </c:forEach>
                      </select>
            <input type="submit" value="发布">
        </form>
    </div>
</body>
</html>
