<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 10:05
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
    <title>个人中心</title>
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
            $("#passOld").keyup(function () {
                var passOld=$("#pass").val();
                var pass1=$(this).val();
                if (pass1==passOld){
                    $("#span").html("√");
                    $("#span").css("color","green");
                }else {
                    $("#span").html("密码与原密码不一致");
                    $("#span").css("color","red");
                }
            });
            var str1=/^[a-zA-Z][a-zA-Z0-9]{5,18}$/;
            $("#passNew").keyup(function () {
                var passNew=$("#passNew").val();
                if (str1.test(passNew)){
                    $("#sp1").html("√");
                    $("#sp1").css("color","green");
                }else {
                    $("#sp1").html("长度为6-18位,字母开头数字字母组成");
                    $("#sp1").css("color","red");
                }
            });
            $("#passNew1").keyup(function () {
                var passNew=$("#passNew").val();
                var passNew1=$("#passNew1").val();
                if (passNew1==passNew){
                    $("#sp2").html("√");
                    $("#sp2").css("color","green");
                }else {
                    $("#sp2").html("两次输入密码不一致");
                    $("#sp2").css("color","red");
                }
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
            <a href="goFirst">返回首页</a>
            <a href="goUserInfo">账户信息</a>
            <a href="seeResume">个人简历信息</a>
            <a href="goAddResume">编辑简历</a>
            <a href="seeInterview?curentPage=1">面试邀请查看</a>
        </div>
    </div>
    <div id="resume_body">
        <div id="user_content">
            <table>
                <tr>
                    <td>用户名</td>
                    <td>密码</td>
                </tr>
                <tr>
                    <td>${sessionScope.user.name}</td>
                    <td>******
                        <input type="hidden" value="${sessionScope.user.pass}" id="pass">
                    </td>
                </tr>
            </table>
            <fieldset>
                <legend>修改密码</legend>
                <form action="updateUser" method="post">
                    原密码：<input type="password" name="passOld" id="passOld"><span id="span">填写原密码</span><br>
                    新密码：<input type="password" name="passNew" id="passNew"><span id="sp1">长度为6-18位,字母开头数字字母组成</span><br>
                    确认密码：<input type="password" name="passNew1" id="passNew1"><span id="sp2">请确认新密码</span><br>
                    <input type="submit" value="修改密码">
                </form>
            </fieldset>
        </div>
    </div>
</body>
</html>
