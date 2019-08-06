<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/3
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

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
<form action="managerUpdateMovie" method="post" class="bootstrap-frm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${movie.id}" hidden>
    电影片名：<input type="text" name="movieName"value="${movie.movieName}"><br>
    上映日期:<input type="text" name="releaseDate" value="${movie.releaseDate}"><br>
    制片国家：<input type="text" name="country" value="${movie.country}"><br>
    编剧：<input type="text" name="screenWriter"value="${movie.screenWriter}"><br>
    类型：<input type="text" name="movieKind" value="${movie.movieKind}"><br>
    导演：<input type="text" name="director" value="${movie.director}"><br>
    演员：<input type="text" name="actor" value="${movie.actor}"><br>
    电影简介<input type="text" name="description" value="${movie.description}"><br>
    <img src="${movie.img}" style="height: 40px;width: 40px;">
    <br>
<%--    海报<input type="file" name="image" value="${movie.img}"><br>--%>
    海报： <div class="a-upload">
    <div align="center">
        <span class="fileinput-button" >
            <span>上传海报</span>
            <input type="file" name="image" value="${movie.img}" style="position: absolute;right: 0px;top: 0px;opacity: 0;-ms-filter: 'alpha(opacity=0)';font-size: 200px;">
        </span>
    </div>
</div><br>


    <input type="submit" value="提交" class="sub">
</form>

</body>
</html>
