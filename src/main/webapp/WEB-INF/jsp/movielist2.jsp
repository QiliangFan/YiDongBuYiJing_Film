<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-20
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        import {pagination} from "../../js/pagination";

        var pageSize = 18;

        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); }
        $(function(){
            $("#first").click(function () {
                pagination(1,pageSize,${selectType},${orderBy},${sortType});
            });
            $("#pre").click(function () {
                pagination(${currentPage-1},pageSize,${selectType},${orderBy},${sortType});
            });
            $("#next").click(function () {
                pagination(${currentPage+1},pageSize,${selectType},${orderBy},${sortType});
            });
            $("#last").click(function () {
                pagination(${totalPage},pageSize,${selectType},${orderBy},${sortType});
            });
        })

    </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/zoomslider3.css" />
</head>
<body>
<!--/content-inner-section-->
<jsp:include page="mytop.jsp"></jsp:include>
<div class="w3_content_agilleinfo_inner">
    <div class="agile_featured_movies">
        <h3 class="agile_w3_title">Requested <span>Movies</span> </h3>
        <div class="wthree_agile-requested-movies">
<c:forEach var="movie" items="${list}">
    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
        <a href="/MovieInf?movie=${movie}"><img src=${movie.img} title=${movie.movieName} class="img-responsive" alt=" ">
            <div class="w3l-action-icon"></div>
        </a>
        <div class="mid-1 agileits_w3layouts_mid_1_home">
            <div class="w3l-movie-text">
                <h6 style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><a href="">${movie.movieName}</a></h6>
            </div>
            <div class="mid-2 agile_mid_2_home">
                <div class="block-stars">
                    <ul class="w3l-ratings">
                        <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                        <li><a href="#"><fmt:formatNumber type="number" value="${movie.grade/movie.numOfPeople}" pattern="0.0" maxFractionDigits="1"/></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</c:forEach>
        </div>
        <div class="blog-pagenat-wthree">
            <ul>
                <li><a id="first" class="frist">First</a></li>
                <c:if test="${currentPage>1}">
                    <li><a id="pre" class="frist">Prev</a></li>
                </c:if>
                <li><a href="#">${currentPage}</a></li>
                <c:if test="${currentPage<totalPage}">
                    <li><a id="next" class="last">Next</a></li>
                </c:if>
                <li><a id="last" class="last">Last</a></li>
            </ul>
        </div>
    </div>
</div>
<script src="javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.zoomslider.min.js"></script>
<script src="js/main.js"></script>
<script src="js/simplePlayer.js"></script>
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
</body>
</html>