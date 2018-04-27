<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/25 0025
  Time: 上午 11:31
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
            $("#t_body tr").click(function () {
                var id=$(this).find("td").get(0);
                location.href="goStaffCtrl?id="+$(id).html();
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
    <div>
        <div id="menu_admin">
            <a href="">首页</a><br>
            <a href="seeDepart">查看部门职位</a><br>
            <a href="adminSeeDeliver?curentPage=1">查看招聘投递</a><br>
            <a href="adminSeeInterview?curentPage=1">查看受邀面试</a><br>
            <a href="goAddRecruit">添加招聘信息</a><br>
            <a href="adminSeeRecruits?curentPage=1">查看招聘信息</a><br>
            <a href="">个人中心</a><br>
        </div>
        <div id="contenter_admin">
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
                            <td>${staff.id}</td>
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
</div>
</body>
</html>
