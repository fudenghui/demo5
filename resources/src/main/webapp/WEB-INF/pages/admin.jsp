<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 3:35
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
    <title>管理员页面</title>
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

            </div>
        </div>
    </div>
</body>
</html>
