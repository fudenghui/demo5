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
            <form action="addDepart" method="post">
                部门名称：<input type="text" name="departName">
                <input type="submit" value="添加部门">
            </form>
        </div>
        <div id="middle_position">
            <div id="positions">

            </div>
            <form action="addPosition" method="post">
                <input type="hidden" name="departName" id="departName">
                职位名称：<input type="text" name="positionName">
                <input type="submit" value="添加职位">
            </form>
        </div>
        <div id="right_staff">
            <table>
                <tr>
                    <td>员工id</td>
                    <td>员工姓名</td>
                </tr>
            </table>
            <c:forEach items="${sessionScope.staffList}" var="staff">
                <tr>
                    <td>${staff.id}</td>
                    <td>${staff.name}</td>
                </tr>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>

