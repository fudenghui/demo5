<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/20 0020
  Time: 下午 5:27
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
    <title>游客注册</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script language="JavaScript">
        var str=/^([a-zA-Z0-9]|[\u4e00-\u9fa5]){6,18}$/;
        var str1=/^[a-zA-Z][a-zA-Z0-9]{5,18}$/;
        $(function() {
            alert($("#error").val())
            if ($("#error").val()=='0'){
                alert("注册失败");
            }
            $("#name").keyup(function () {
                var name=$(this).val();
                if (str.test(name)){
                    $("#span").html("长度为6-18位,字母数字汉字组成");
                    $("#span").css("color","black");
                }else {
                    $("#span").html("长度为6-18位,字母数字汉字组成");
                    $("#span").css("color","red");
                }
            });
            $("#pass").keyup(function () {
                var pass=$(this).val();
                if (str.test(pass)){
                    $("#sp1").html("长度为6-18位,字母开头的数字字母组成");
                    $("#sp1").css("color","black");
                }else {
                    $("#sp1").html("长度为6-18位,字母开头的数字字母组成");
                    $("#sp1").css("color","red");
                }
            });
            $("#pass1").keyup(function () {
                var pass=$("#pass").val();
                var pass1=$(this).val();
                if (pass1==pass){
                    $("#sp2").html("√");
                    $("#sp2").css("color","green");
                }else {
                    $("#sp2").html("密码不一致");
                    $("#sp2").css("color","red");
                }
            });
            $("#name").blur(function () {
                var name=$(this).val();
                $.ajax({
                    type:"post",
                    url:"getUser",
                    data:{"name":name},
                    success:function (obj) {
                        var o=obj;
                        if (o==0){
                            $("#span").html("用户名已存在");
                            $("#span").css("color","red");
                        }else {
                            if (!str.test(name)){
                                $("#span").html("长度为6-18位,字母数字汉字组成");
                                $("#span").css("color","red");
                                return;
                            }
                            $("#span").html("√");
                            $("#span").css("color","green");
                        }
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
    <input type="hidden" value="${error}" id="error">
</div>
<div id="menu">
    <a href="goFirst">返回首页</a>
</div>
<div id="contenter" class="contenter">
    <div id="register">
        <form action="register" method="post">
            账号：<input name="name" id="name"><span id="span">长度为6-18位,字母数字汉字组成</span><br><br>
            密码：<input type="password" name="pass" id="pass"><span id="sp1">长度为6-18位,字母开头数字字母组成</span><br><br>
            确认密码：<input type="password" name="pass1" id="pass1"><span id="sp2">请确认密码</span><br><br>
            <input type="submit" value="注册">
        </form>
    </div>
</div>
</body>
</html>
