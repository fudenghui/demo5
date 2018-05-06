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
            var userName=$("#user").html();
            if(userName!=""){
                $("#sp").css("display","block");
            }
            $("a").mouseout(function () {
                $(this).toggleClass("a");
            });
            $("a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#left_depart a").click(function () {
                var name=$(this).html();
                $("#departName").val(name);
                $(".addPosition").css("display","block");
                $.ajax({
                    type:"post",
                    url:"seePosition",
                    data:{"departName":name},
                    success:function (obj) {
                        $("#positions").html("");
                        for(var i=0;i<obj.length;i++){
                            $("#positions").html($("#positions").html()+"<a>"+obj[i].positionName+"</a>");
                        }
                        $("#deleteForPos").html("<option value='0'>请选择职位</option>");
                        for(var i=0;i<obj.length;i++){
                            $("#deleteForPos").append("<option value='"+obj[i].id+"'>"+obj[i].positionName+"</option>");
                        }
                        $("#positions a").click(function () {
                            var posName=$(this).html();
                            $("#positionName").val(posName);
                            $.ajax({
                                type:"post",
                                url:"staffSeeStaffByPos",
                                data:{"positionName":posName},
                                success:function (obj1) {
                                    $("#t_body").html("");
                                    for(var i=0;i<obj1.length;i++){
                                        var staff=obj1[i];
                                        $("#t_body").html($("#t_body").html()+
                                            "<tr><td>"+staff.id+"</td><td>"+staff.staffRealName+"</td><td>"+staff.sex+"</td><td>"+staff.age+"</td><td>"+staff.phone+"</td><td>"+staff.email+"</td><td>"+staff.staffState+"</td></tr>");
                                    }
                                    $("#t_body tr").click(function () {
                                        var id=$(this).find("td").get(0);
                                        location.href="goStaffCtrl?id="+$(id).html();
                                    });
                                }
                            })
                        });
                        $.ajax({
                            type:"post",
                            url:"staffSeeStaffByDep",
                            data:{"departName":name},
                            success:function (obj1) {
                                $("#t_body").html("");
                                for(var i=0;i<obj1.length;i++){
                                    var staff=obj1[i];
                                    $("#t_body").html($("#t_body").html()+
                                        "<tr><td>"+staff.id+"</td><td>"+staff.staffRealName+"</td><td>"+staff.sex+"</td><td>"+staff.age+"</td><td>"+staff.phone+"</td><td>"+staff.email+"</td><td>"+staff.staffState+"</td></tr>");
                                }
                                $("#t_body tr").click(function () {
                                    var id=$(this).find("td").get(0);
                                    location.href="goStaffCtrl?id="+$(id).html();
                                });
                            }
                        })
                        $("a").mouseout(function () {
                            $(this).toggleClass("a");
                        });
                        $("a").mouseover(function () {
                            $(this).toggleClass("a");
                        });
                    }
                });
            });
            $("#t_body tr").click(function () {
                var id=$(this).find("td").get(0);
                location.href="goStaffCtrl?id="+$(id).html();
            });
            $("#delDep").click(function () {
                var id=$("#departForDel option:selected").val();
                if (id=="0"){
                    alert("请先选择部门再删除");
                    return;
                }
                location.href="deleteDep?id="+$("#departForDel option:selected").val();
            });
            $("#delPos").click(function () {
                var id=$("#deleteForPos option:selected").val();
                if (id=="0"){
                    alert("请先选择职位再删除");
                    return;
                }
                location.href="deletePos?id="+$("#deleteForPos option:selected").val();
            });
            $("#positions a").click(function () {
                var name=$(this).html();
                $("#positionName").val(name);
                $.ajax({
                    type:"post",
                    url:"staffSeeStaffByPos",
                    data:{"positionName":name},
                    success:function (obj) {
                        $("#t_body").html("");
                        for(var i=0;i<obj.length;i++){
                            var staff=obj[i];
                            $("#t_body").html($("#t_body").html()+
                                "<tr><td>"+staff.id+"</td><td>"+staff.staffRealName+"</td><td>"+staff.sex+"</td><td>"+staff.age+"</td><td>"+staff.phone+"</td><td>"+staff.email+"</td><td>"+staff.staffState+"</td></tr>");
                        }
                        $("#t_body tr").click(function () {
                            var id=$(this).find("td").get(0);
                            location.href="goStaffCtrl?id="+$(id).html();
                        });
                    }
                })
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
            <div id="left_depart">
                <form action="addDepart" method="post">
                    部门名称：<input type="text" name="departName">
                    <input type="submit" value="添加部门">
                </form>
                <select name="departId" id="departForDel">
                    <option value="0">请选择部门</option>
                    <c:forEach items="${sessionScope.departs}" var="depart">
                        <option value="${depart.id}">${depart.departName}</option>
                    </c:forEach>
                </select>
                <input type="button" value="删除部门" id="delDep"><br><br>
                <c:forEach items="${sessionScope.departs}" var="depart">
                    <a>${depart.departName}</a>
                </c:forEach>
            </div>
            <div id="middle_position">
                <div class="addPosition">
                <form action="addPosition" method="post">
                    <input type="hidden" name="departName" id="departName">
                    职位名称：<input type="text" name="positionName"><br>
                    基本薪资：<input type="text" name="baseSal">
                    <input type="submit" value="添加职位">
                </form>
                </div>
                <select name="positionId" id="deleteForPos">
                    <option value="0">请选择职位</option>
                    <c:forEach items="${sessionScope.positions}" var="position">
                        <option value="${position.id}">${position.positionName}</option>
                    </c:forEach>
                </select>
                <input type="button" value="删除职位" id="delPos"><br><br>
                <div id="positions">
                    <c:forEach items="${sessionScope.positions}" var="position">
                        <a>${position.positionName}</a>
                    </c:forEach>
                </div>
            </div>
            <div id="right_staff">
                <input type="hidden" id="positionName">
                <table>
                    <tr>
                        <td>工号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>手机号</td>
                        <td>邮箱</td>
                        <td>状态</td>
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
                            <td>${staff.staffState}</td>
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
