<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/4
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/manageradditem.css">
    <title>Title</title>

</head>
<body>
<form action="managerUpdateUser" method="post" class="bootstrap-frm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${user.id}">
    用户名：<input type="text" name="userName" value="${user.userName}"><br>
    <input type="hidden" name="password" value="${user.password}">
    邮箱：<input type="text" name="email" value="${user.email}"><br>
    生日：<input type="text" name="birthday"id="input_date"value="${user.birthday}"><br>
    性别：<input type="text" name="gender"value="${user.gender}"><br>
    身份：<input type="text" name="authority"value="${user.authority}"><br>
    用户头像：
    <img src="${user.image}" style="height:60px;width:60px;">

    <div class="a-upload" >

    <div align="center">
        <span class="fileinput-button" >
            <span>上传头像</span>
            <input type="file" name="img" style="position: absolute;right: 0px;top: 0px;opacity: 0;-ms-filter: 'alpha(opacity=0)';font-size: 200px;">
        </span>
    </div>
</div><br>
    <br><br>
    <input type="submit" value="提交" class="sub" style="margin-left: 130px;">
</form>
</body>
</html>
