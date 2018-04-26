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
    <title>招聘信息页面</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            if($("#user").html()!=""){
                $(".sp").css("display","block");
            }
            $("#log1").click(function () {
                $("#loginArea").css("display","block");
            });
            $("#log2").click(function () {
                $.ajax({
                    type:"post",
                    url:"login",
                    data:{"name":$("#name").val(),"pass":$("#pass").val(),"cl":$("#cl option:selected").val()},
                    success:function (obj) {
                        alert(obj.level);
                        $("#loginArea").css("display","none");
                        $("#user").html(obj.name);
                        $("#level").html(obj.level+"");
                        $("#sp").css("display","block");
                        if ($("#level").html()=="1"){
                            $.ajax({
                                type:"post",
                                url:"getResumes",
                                data:{"userId":obj.id},
                                success:function (obj1) {
                                    $("#resumeId").html("");
                                    for(var i=0;i<obj1.length;i++){
                                        $("#resumeId").html($("#resumeId").html()+"<option>"+obj1[i].id+"</option>");
                                    }
                                    $("#menu_right").css("display","block");
                                }
                            })
                        }
                    }
                })
            });
            $("#reg").click(function () {
                location.href="goRegister";
            });

            $("#deliver").click(function () {
                if($("#user").html()==""){
                    alert("请先登录");
                }else {
                    $.ajax({
                        type:"post",
                        url:"addDeliverResume",
                        data:{"recruitId":$("#recruitId").val(),"resumeId":$("#resumeId option:selected").val()},
                        success:function (obj) {
                            alert("投递成功")
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
            <div id="loginArea">
                账号：<input name="name" id="name"><br>
                密码：<input type="password" name="pass" id="pass"><br>
                <select name="cl" id="cl">
                    <option>游客</option>
                    <option>员工</option>
                </select>
                <input type="button" value="登录" id="log2">
            </div>
            <span id="sp">欢迎<span id="user">${sessionScope.user.name}</span></span>
            <span id="level">${sessionScope.user.level}</span>
            <input type="button" value="登录" id="log1">
            <input type="button" value="注册" id="reg">
        </div>
    </div>
    <div id="menu">
        <div id="menu_left">
            <a href="goFirst">首页</a>
            <a href="seeRecruits?curentPage=1">招聘</a>
            <a id="goUser">个人中心</a>
        </div>
        <div id="menu_right">
            简历选择：<select name="resumeId" id="resumeId">
            <c:forEach items="${sessionScope.resumes}" var="resume">
                <option>${resume.id}</option>
            </c:forEach>
        </select>
        </div>
    </div>
    <div id="contenter">
        <table>
            <c:forEach items="${sessionScope.recruitList}" var="recruit">
                <tr>
                    <td>部门：${recruit.depart.departName}</td>
                    <td>职位：${recruit.position.positionName}</td>
                    <td>招聘人数：${recruit.number}</td>
                    <td>
                        <input type="hidden" name="recruitId" value="${recruit.id}" id="recruitId">
                        <input type="button" value="投递" id="deliver">
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
</body>
</html>
