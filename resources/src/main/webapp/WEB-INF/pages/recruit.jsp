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
            $("#log1").click(function () {
                $("#loginArea").css("display","block");
            });
            $("#log2").click(function () {
                $.ajax({
                    type:"post",
                    url:"login",
                    data:{"name":$("#name").val(),"pass":$("#pass").val(),"cl":$("#cl option:selected").val()},
                    success:function (obj) {
                        $("#loginArea").css("display","none");
                        $("#user").val(${sessionScope.user.name});
                        $("#user").attr("type","text");
                    }
                })
            });
            $("#reg").click(function () {
                location.href="goRegister";
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
                if($("#user").val()==""){
                    alert("请先登录");
                }else {
                    location.href="goUserInfo";
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
            <input type="hidden" readonly="readonly" value="${sessionScope.user.name}" id="user">
            <input type="button" value="登录" id="log1">
            <input type="button" value="注册" id="reg">
        </div>
    </div>
    <div id="menu">
        <a href="goFirst">首页</a>
        <a href="seeRecruits?curentPage=1">招聘</a>
        <a id="goUser">个人中心</a>
    </div>
    <div id="contenter">
        <table>
            <c:forEach items="${sessionScope.recruitList}" var="recruit">
                <tr>
                    部门：<td>${recruit.depart.departName}</td>
                    职位：<td>${recruit.position.positionName}</td>
                    招聘人数：<td>${recruit.number}</td>
                    <td>
                        <input type="hidden" name="recruitId" value="${recruit.id}" id="recruitId">
                        简历选择：<select name="resumeId" id="resumeId">
                            <c:forEach items="${sessionScope.resumes}" var="resume">
                                <option>${resume.id}</option>
                            </c:forEach>
                        </select>
                        <input type="button" value="投递" id="deliver">
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
