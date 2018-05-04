<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/20 0012
  Time: 8:57
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
    <title>主页面</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            var userName=$("#user").html();
            if(userName!=""){
                $("#sp").css("display","block");
            }
            $("#log1").click(function () {
                location.href="goLogin";
            });
            $("#reg").click(function () {
                location.href="goRegister";
            });
            $("#menu a").mouseover(function () {
               $(this).toggleClass("a");
            });
            $("#menu a").mouseout(function () {
                $(this).toggleClass("a");
            });
            $("#deliver").click(function () {
                if($("#user").val()==""){
                    alert("请先登录");
                }else {
                    $.ajax({
                        type:"post",
                        url:"addDeliverResume",
                        data:{"recruitId":$("#recruitId").val(),"resumeId":$("#resumeId option:selected").val()},
                        success:function (obj) {

                        }
                    })
                }
            });
            $("#goUser").click(function () {
                if($("#user").html()==""){
                    alert("请先登录");
                }else {
                    if ($("#level").html()=='1'){
                        location.href="goUserInfo";
                    }else if ($("#level").html()=='2'){
                        location.href="goStaff";
                    }else {
                        location.href="goAdmin";
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div>
        <div id="top">
            <div id="logo">
                欢迎来到XXXXX公司
            </div>
            <div id="login">
                <div id="login_menu">
                    <span id="sp">欢迎<span id="user">${sessionScope.user.name}</span></span>
                    <span id="level">${sessionScope.user.level}</span>
                    <input type="button" value="登录" id="log1">
                    <input type="button" value="注册" id="reg">
                </div>
            </div>
        </div>
        <div id="menu">
            <a href="goFirst">首页</a>
            <a href="seeRecruits?curentPage=1">招聘</a>
            <a id="goUser">个人中心</a>
        </div>
        <div id="contenter" class="contenter">

        </div>
    </div>
</body>
</html>

