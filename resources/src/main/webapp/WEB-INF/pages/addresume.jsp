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
    <title>编辑简历</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">

    </script>
</head>
<body>
    <div id="resume_body">
        <div id="user_menu">
            <a href="goUserInfo">账户信息</a><br>
            <a href="seeResume">个人简历信息</a><br>
            <a href="goAddResume">编辑简历</a><br>
            <a href="seeInterview?curentPage=1">面试邀请查看</a><br>
        </div>
        <div id="user_content">
            <form method="post" action="addResume">
                姓名：<input name="userName"/>年龄：<input name="age"><br>
                性别：<input name="sex">电话：<input name="phone"><br>
                身份证号：<input name="cardId"><br>
                邮箱：<input name="email">
                状态：<select name="state">
                        <option>在职</option>
                        <option>离职</option>
                        <option>在校</option>
                      </select><br>
                学历：<input name="edu">
                毕业院校：<input name="school">
                专业：<input name="major"><br>
                期望薪资：<input name="expSal"><br>
                就业经历：<textarea name="workOld" cols="50" rows="10"></textarea><br>
                自我评价：<textarea name="rate" cols="50" rows="10"></textarea>
                <input type="submit" value="保存">
            </form>
        </div>
    </div>
</body>
</html>
