<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/27 0027
  Time: 下午 1:35
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
    <title>管理员查看添加培训信息</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            $("#menu_admin a").mouseover(function () {
                $(this).toggleClass("a");
            });
            $("#menu_admin a").mouseout(function () {
                $(this).toggleClass("a");
            });
            $("#depart").change(function () {
                var name=$("#depart option:selected").val();
                $.ajax({
                    type:"post",
                    url:"getStaffByDep",
                    data:{"departName":name},
                    success:function (obj){
                        $("#trainStaff").html("<input type='checkbox' id='selAll'>全选<br>");
                        for(var i=0;i<obj.length;i++){
                            $("#trainStaff").append("<input type='checkbox' name='staffId' class='sel' value='"+obj[i].id+"'>"+obj[i].staffRealName);
                        }
                        $("#selAll").click(function () {
                            if ($(this).is(':checked')){
                                $(".sel").prop("checked",true);
                            }else {
                                $(".sel").prop("checked",false);
                            }
                        });
                        $(".sel").click(function () {
                            var allSel=false;
                            $(".sel").each(function () {
                                if (!$(this).is(':checked')){
                                    allSel=true;
                                }
                            });
                            if (allSel){
                                $("#selAll").prop("checked",false);
                            }else {
                                $("#selAll").prop("checked",true);
                            }
                        });
                    }
                });
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
            <div id="addTrain">
                <form action="addTrain" method="post">
                    <h5>培训对象</h5>
                    部门名称：<select name="departName" id="depart">
                                 <option>请选择部门</option>
                                 <c:forEach items="${sessionScope.departs}" var="depart">
                                    <option>${depart.departName}</option>
                                 </c:forEach>
                              </select><br>
                    员工：<div id="trainStaff">
                          </div>
                    <h5>培训内容</h5>
                    <textarea name="content" cols="50" rows="10"></textarea><br>
                    开始时间：<input name="trainStartTime"><br>
                    结束时间：<input name="trainEndTime"><br>
                    培训地址：<input name="location"><br>
                    <input type="submit" value="添加培训">
                </form>
            </div>
            <div id="seeTrain">
                <c:forEach items="${sessionScope.trains}" var="train">
                    培训对象：
                    ${train}
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
