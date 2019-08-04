<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/3
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/managershowallmovies.css">

    <script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>showmovie</title>
    <script type="text/javascript">
        function details(id)
        {
            location.href="managerShowMovieDetails?movieId="+id;

        }
        function deletes(id){
            var f=confirm("是否确定删除？");
            if(f){
                location.href="managerDeleteMovie?movieId="+id;
            }else{
                alert("您取消删除");
            }
        }

        function update(id){
            location.href="managerUpdateMovie?movieId="+id;
        }
    </script>
</head>
<body>
<div class="table">
<table width="90%" class="table" style="text-align:center; margin-top:50px; width: 900px;
    margin-left: 80px;">
    <tr>
        <td style="width:50px; background-color:#f7f7f7;">电影名称</td>
        <td style="width:50px; background-color:#f7f7f7;">上映时间</td>
        <td style="width:50px;background-color:#f7f7f7;">制片国家</td>
        <td style="width:50px; background-color:#f7f7f7;">电影类型</td>
        <td style="width:50px;background-color:#f7f7f7;">编剧</td>
        <td style="width:50px;overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;background-color:#f7f7f7;">导演</td>
        <td style="width:50px;overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;background-color:#f7f7f7;">演员</td>
        <td style="width:50px;background-color:#f7f7f7;">操作</td>
    </tr>
    <c:forEach items="${movies}" var="movie">
       <tr>
          <td style="vertical-align: inherit;">${movie.movieName}</td>
           <td style="vertical-align:inherit;">${movie.releaseDate}</td>
           <td style="vertical-align: inherit;">${movie.country}</td>
           <td style="vertical-align: inherit;">${movie.movieKind}</td>
           <td style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align:inherit;">${movie.screenWriter}</td>
           <td style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align: inherit;">${movie.director}</td>
           <td style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align:inherit;">${movie.actor}</td>

           <td style="vertical-align: inherit;">
               <input type="button"
                      style="height:22px;width: 40px;margin-left: 0px;margin-top:8px;"
                      class="button button1" onclick="details(${movie.id})" value="详情"/>
               <input type="button"
                      style="height:22px;width: 40px;margin-left: 0px;margin-top:8px;"
                      class="button button1" onclick="update(${movie.id})" value="修改"/>

               <input type="button" style="margin-top:8px;height:22px;width: 40px;
               margin-left: 0px;margin-bottom:8px;" class="button button1"
                      onclick="deletes(${movie.id})" value="删除"/></td>
       </tr>
    </c:forEach>


</table>
</div>
<div class="pagechange" style="padding-left: 300px;">
    <ul class="pagination">
        <%--   向左翻页 --%>
        <c:choose>
            <c:when test="${totalPage eq 1}">
                <li class="disabled">
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li >
                    <a href="managerToShowAllMovies?pageIndex=${currentPage-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <%--    向左翻页结束--%>
        <%--  页码  --%>
        <c:forEach begin="1" end="${totalPage}" var="i">
            <c:choose>
                <c:when test="${i eq currentPage}">
                    <li class="active">
                        <a href ="managerToShowAllMovies?pageIndex=${i}">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class=>
                        <a href ="managerToShowAllMovies?pageIndex=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <%--    页码结束--%>
        <%--  向右翻页  --%>
        <c:choose>
            <c:when test="${currentPage eq totalPage}">
                <li class="disabled">
                    <a href="#" aria-label="next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li >
                    <a href="managerToShowAllMovies?pageIndex=${currentPage+1}" aria-label="Previous">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <%--   向右翻页结束 --%>
    </ul>
</div>

</body>
</html>
