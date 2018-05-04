<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 下午 3:35
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
    <title>管理员发薪页面</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
           /* $("#giveMoney").click(function () {
                $.ajax({
                    type:"post",
                    url:"addSalary",
                    data:{},
                    success:function (obj) {

                    }
                })
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
                <div id="contenter_admin_left">
                    <form action="addSalary" method="post">
                        <select name="salaryMonth">
                            <c:forEach items="${sessionScope.dateList}" var="date">
                                <option>${date}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="发布" id="giveMoney">
                    </form>
                </div>
                <div id="contenter_admin_right">
                    薪资复议记录：
                    <table>
                        <tr>
                            <td>工号</td>
                            <td>薪资时间</td>
                            <td>复议金额</td>
                            <td>复议描述</td>
                            <td>复议状态</td>
                            <td>申请时间</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${sessionScope.recList}" var="rec">
                            <tr>
                                <td>${rec.staffId}</td>
                                <td>${rec.recDate}</td>
                                <td>${rec.recMoney}</td>
                                <td>${rec.recContent}</td>
                                <td>
                                    <c:if test="${rec.recState==1}">
                                        处理中
                                    </c:if>
                                    <c:if test="${rec.recState==2}">
                                        已通过
                                    </c:if>
                                    <c:if test="${rec.recState==0}">
                                        未通过
                                    </c:if>
                                </td>
                                <td>${rec.recTime}</td>
                                <td>
                                    <form action="goWp" method="post">
                                        <input type="hidden" name="id" value="${rec.id}">
                                        <input type="submit" value="通过" id="pass">
                                    </form>
                                    <form action="updateRecState" method="post">
                                        <input type="hidden" name="id" value="${rec.id}">
                                        <input type="submit" value="不通过" id="nopass">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
