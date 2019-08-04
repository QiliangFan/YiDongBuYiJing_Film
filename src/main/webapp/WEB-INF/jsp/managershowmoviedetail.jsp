<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/3
  Time: 19:34
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

    <link rel="stylesheet" type="text/css" href="css/managershowmoviedetail.css">
</head>
<body>

<div class="view">
    <div class="title">
        <a href="managerToShowAllMovies"><img src="../../img/return.png"
                                              style="height: 40px;width: 40px;"></a>
        <h1>
            ${movie.movieName}
        </h1>
    </div>
    <div class="content">
        <div class="picture">
            <img src="${ movie.img}" style="width: 300px;
    float: left;
    margin-right: 100px;
    margin-left: 20px;">
        </div>
        <div class="information">
            <span>导演:</span> ${movie.director}
            <br>
            <br>
            <span>编剧:</span>${movie.screenWriter}
            <br><br>
            <span>主演:</span> ${movie.actor}
            <br><br>
            <span>类型:</span> ${movie.movieKind}
      <br>
            <span>发行地区:</span> ${movie.country}
<br>
            <span>上映日期:</span> ${ movie.releaseDate}
            <br><br>
        </div>
        <div class="describe">
            <span style="font-weight: bold;">电影介绍:</span>
            <br>
            ${movie.description}
        </div>
    </div>
</div>

</body>
</html>
