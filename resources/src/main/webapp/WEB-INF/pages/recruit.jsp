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
            var userName=$("#user").html();
            var level=$("#level").html();
            if(userName!=""){
                $("#sp").css("display","block");
            }
            $(".tr").click(function () {
                var resume=$(this).find("input").get(0);
                var resumeId=$(resume).val();
                $("#recruitId").attr("value",resumeId);
            });
            if (level=="1"){
                $.ajax({
                    type:"post",
                    url:"seeResumes",
                    data:{"userName":userName},
                    success:function (obj) {
                        $("#resumeId").html("<option>请选择简历</option>");
                        for(var i=0;i<obj.length;i++){
                            $("#resumeId").append("<option>"+obj[i].id+"</option>");
                        }
                    }
                })
                $(".menu_right").css("display","block");
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
            <div id="login_menu">
                <span id="sp">欢迎<span id="user">${sessionScope.user.name}</span></span>
                <span id="level">${sessionScope.user.level}</span>
                <input type="button" value="登录" id="log1">
                <input type="button" value="注册" id="reg">
            </div>
        </div>
    </div>
    <div id="menu">
        <div id="menu_left">
            <a href="goFirst">首页</a>
            <a href="seeRecruits?curentPage=1">招聘</a>
            <a id="goUser">个人中心</a>
        </div>
    </div>
    <div id="contenter">
        <div id="content_left">
            <table>
                <c:forEach items="${sessionScope.recruitList}" var="recruit">
                    <tr class="tr">
                        <input type="hidden" value="${recruit.id}">
                        <td>部门：${recruit.depart.departName}</td>
                        <td>职位：${recruit.position.positionName}</td>
                        <td>招聘人数：${recruit.number}</td>
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
        <div id="content_right">
            <div class="menu_right">
                简历选择：<select name="resumeId" id="resumeId">
                          </select>
                <input type="hidden" name="recruitId" id="recruitId">
                <input type="button" value="投递" id="deliver">
            </div>
        </div>
    </div>
</div>
</body>
</html>
