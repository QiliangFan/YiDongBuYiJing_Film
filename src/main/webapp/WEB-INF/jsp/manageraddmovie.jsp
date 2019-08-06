<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/3
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/manageradditem.css">
    <title>增加电影</title>

</head>
<body>
<form action="managerAddMovie" method="post" class="bootstrap-frm" enctype="multipart/form-data">
    电影片名：<input type="text" name="movieName"><br>
    上映日期： <input type="text" name="releaseDate"><br>
    制片国家：<input type="text" name="country"><br>
    编剧：<input type="text" name="screenWriter"><br>
    类型：<input type="text" name="movieKind"><br>
    导演：<input type="text" name="director"><br>
    演员：<input type="text" name="actor"><br>
    电影简介：<input type="text" name="description"><br>
    海报： <div class="a-upload">
    <div align="center">
        <span class="fileinput-button" >
            <span>上传海报</span>
            <input type="file" name="image" style="position: absolute;right: 0px;top: 0px;opacity: 0;-ms-filter: 'alpha(opacity=0)';font-size: 200px;">
        </span>
    </div>
</div><br>
    <br><br><br>
    <input type="submit" value="提交" class="sub">
</form>

</body>
</html>
