<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26 0026
  Time: 下午 2:32
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
    <title>邀请面试</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
      /*  function check() {
            var phone=document.getElementById("telPhone").value;
            var str=/^[1][0-9]{10}$/;
            if (!str.test(phone)){
                alert("电话号码不符合格式")
                return false;
            }else {
                return true;
            }
        }*/
        $(function () {
            $("#interviewSub").submit(function () {
                var phone=document.getElementById("telPhone").value;
                var str=/^[1][0-9]{10}$/;
                //language=JSRegexp
                var timeStr=/^((2[0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|(((2[0-9])(0[048]|[2468][048]|[13579][26])|((0[048]|[2468][048]|[3579][26])00))-02-29)\\s+([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;
                var time=$("#interviewTime").val();
                var flag=true;
                $("input").each(function () {
                    if ($(this).val()==""){
                        alert("输入框不能为空")
                        flag=false;
                    }
                })
                if(flag=false){
                    return false;
                }else {
                    if ((!str.test(phone)) || (!timeStr.test(time))) {
                        alert("时间格式不符合或者电话号码不符合格式")
                        return false;
                    } else {
                        return true;
                    }
                }
            })
            $("#menu_admin a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#menu_admin a").mouseout(function () {
                $(this).toggleClass("a");
            });
            /*$("#interviewTime").blur(function () {
                var time=$(this).val();
                if (timeStr.test(time)){
                    $("#span").html("√");
                    $("#span").css("background-color","green");
                }else {
                    $("#span").html("请输入格式为yyyy-MM-dd HH:mm:ss");
                    $("#span").css("background-color","red");
                }
            });*/
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
            <a href="goAddSalary">发布薪资单</a>
            <a href="">个人中心</a>
        </div>
        <div id="contenter_admin">
            <div id="addInterview">
                请填写邀请信息：
                <form action="addInterview1" method="post" id="interviewSub">
                    <input type="hidden"  name="adminId" value="${sessionScope.interview1.adminId}"/>
                    面试部门id：<input readonly="readonly" name="departId" value="${sessionScope.interview1.departId}"/>
                    面试职位id：<input readonly="readonly" value="${sessionScope.interview1.positionId}" name="positionId"/><br>
                    <input type="hidden"  name="userId" value="${sessionScope.interview1.userId}">
                    面试时间：<input type="text" name="interviewTime" id="interviewTime"/><span id="span">格式为yyyy-MM-dd HH:mm:ss</span><br>
                    面试地址：<input name="location">
                    联系电话：<input name="phone" id="telPhone"><br>
                    <input type="hidden" name="deliverResumeId" value="${sessionScope.interview1.deliverResumeId}">
                    <input type="submit" value="邀请面试">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
