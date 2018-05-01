<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26 0026
  Time: 下午 4:31
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
    <title>查看部门职位</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            var userName=$("#user").html();
            if(userName!=""){
                $("#sp").css("display","block");
            }
            $("#left_depart a").mouseout(function () {
                $(this).toggleClass("a");
            });
            $("#left_depart a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#left_depart a").click(function () {
                var name=$(this).html();
                $("#departName").val(name);
                $("#middle_position").css("display","block");
                $.ajax({
                    type:"post",
                    url:"seePosition",
                    data:{"departName":name},
                    success:function (obj) {
                        $("#positions").html("");
                        for(var i=0;i<obj.length;i++){
                            $("#positions").html($("#positions").html()+"<a>"+obj[i].positionName+"</a>");
                        }
                        $.ajax({
                            type:"post",
                            url:"staffSeeStaffByDep",
                            data:{"departName":name},
                            success:function (obj1) {
                                $("#t_body").html("");
                                for(var i=0;i<obj1.length;i++){
                                    var staff=obj1[i];
                                    $("#t_body").html($("#t_body").html()+
                                        "<tr><td>"+staff.id+"</td><td>"+staff.staffRealName+"</td><td>"+staff.sex+"</td><td>"+staff.age+"</td><td>"+staff.phone+"</td><td>"+staff.email+"</td></tr>");
                                }
                            }
                        })
                    }
                });
            });
        })
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
                密码：<input name="pass" id="pass"><br>
                <select name="cl" id="cl">
                    <option>游客</option>
                    <option>员工</option>
                </select>
                <input type="button" value="登录" id="log2">
            </div>
            <input type="hidden" value="${sessionScope.user.name}" id="user">
            <input type="button" value="登录" id="log1">
            <input type="button" value="注册" id="reg">
        </div>
    </div>
    <div id="menu">
        <a href="goFirst">首页</a>
        <a href="staffSeeDepart">查看部门职位</a>
        <a href="seeTrain">培训</a>
        <a href="seeSalary">薪资</a>
        <a href="seeWardPunish">奖惩</a>
        <a href="seeCheck">考勤</a>
    </div>
    <div id="contenter_staff">
        <div id="left_depart">
            <c:forEach items="${sessionScope.departs}" var="depart">
                <a>${depart.departName}</a>
            </c:forEach>
        </div>
        <div id="middle_position">
            <div id="positions">

            </div>
        </div>
        <div id="right_staff">
            <table>
                <tr>
                    <td>工号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>手机号</td>
                    <td>邮箱</td>
                </tr>
                <tbody id="t_body">
                <c:forEach items="${sessionScope.staffList}" var="staff">
                    <tr>
                        <td><a>${staff.id}</a></td>
                        <td>${staff.staffRealName}</td>
                        <td>${staff.sex}</td>
                        <td>${staff.age}</td>
                        <td>${staff.phone}</td>
                        <td>${staff.email}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

