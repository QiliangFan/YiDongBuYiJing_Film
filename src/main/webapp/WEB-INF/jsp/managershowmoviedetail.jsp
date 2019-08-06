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
        <a href="managerToShowAllMovies"><img src="img/back.png"
                                              style="height: 40px;width: 40px;"></a>
        <h2  style="color: darkslategrey;margin-left: 100px;">
            ${movie.movieName}
        </h2>
    </div>
    <div class="content">
        <div class="picture">
            <img src="${ movie.img}" style="width: 250px;
    height: 330px;
    float: left;
    margin-right: 100px;
    margin-left: 100px;
    border-radius: 1em;">
        </div>
        <div class="information" style="color:grey">
            <span style=" margin-right: 20px; margin-left: 30px;">导演:</span> ${movie.director}
            <br>
            <br>
            <span style=" margin-right: 20px; margin-left: 30px;">编剧:</span>${movie.screenWriter}
            <br><br>

            <span style=" margin-right: 20px; margin-left: 30px;float: left;">主演:</span>
            <div class="actor" style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align:inherit;">
            ${movie.actor}</div>

            <br>
            <span style=" margin-right: 20px; margin-left: 30px;">类型:</span> ${movie.movieKind}
      <br><br>
            <span style=" margin-right: 20px; margin-left: 30px;">发行地区:</span> ${movie.country}
<br><br>
            <span style=" margin-right: 20px; margin-left: 30px;">上映日期:</span> ${ movie.releaseDate}
            <br><br>
        </div>
        <div class="describe" style="margin-left: 33px;
    float: left;
    width: 500px;
    color: grey;
    margin-bottom: 50px;
    font-size: 15px;">
            <span style="font-weight: bold;font-size: 16px;">电影介绍:</span>
            <br><br>
            ${movie.description}
        </div>
    </div>
</div>

</body>
</html>
