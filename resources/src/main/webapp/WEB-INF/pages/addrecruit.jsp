<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/23 0023
  Time: 上午 9:23
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
    <title>添加招聘</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        $(function () {
            $("#depart").change(function () {
                var name=$("#depart option:selected").val();
                $.ajax({
                   type:"post",
                    url:"getPositionsByDep",
                    data:{"departName":name},
                    success:function (obj) {
                       $("#position").html("<option>请选择职位</option>");
                        for(var i=0;i<obj.length;i++){
                            $("#position").html($("#position").html()+"<option>"+obj[i].positionName+"</option>")
                        }
                    }
                });
            });
        })
    </script>
</head>
<body>
    <div id="recruit_body">
        <form method="post" action="addRecruit">
                部门名称：<select name="departName" id="depart">
                            <option>请选择部门</option>
                            <c:forEach items="${sessionScope.departs}" var="depart">
                                <option>${depart.departName}</option>
                            </c:forEach>
                          </select>
                职位名称：<select name="positionName" id="position">
                            <option>请选择职位</option>
                          </select><br>
                招聘人数：<input name="number"><br>
                招聘开始时间：<input name="startTime"><br>
                招聘结束时间：<input name="overTime"><br>
                招聘需求：<<textarea name="demand"  cols="50" rows="20"></textarea><br>
             <input type="submit" value="保存">
        </form>
    </div>
</body>
</html>
