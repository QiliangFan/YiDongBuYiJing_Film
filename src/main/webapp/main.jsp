<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-08-03
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Movies</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/movieinfo.js"></script>
    <%--    <script type="text/javascript" src="javascript/jquery-3.4.1.min.js" ></script>--%>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- pop-up -->
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //pop-up -->
    <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="javascript/modernizr-2.6.2.min.js"></script>
</head>

<body>

<div class="">
    <div id="demo-1" data-zs-src='["img/111.jpg", "img/666.jpg", "img/555.jpg","img/4.jpg"]' data-zs-overlay="dots">
        <div class="demo-inner-content">
            <!--/header-w3l-->
            <div class="header-w3-agileits" id="home">
                <div class="inner-header-agile">
                    <nav class="navbar navbar-default">
                        <!--头部-->
                        <div class="navbar-header">
                            <h1><a  href=""><span>F</span>unny<span>M</span>ovies</a></h1>
                        </div>
                        <!-- navbar-header -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="">Home</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <li>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="PageServlet">All</a></li>
                                                    <li><a href="AllServlet?kind=热门&currentpageno=1">Hot</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="AllServlet?kind=最新&currentpageno=1">new</a></li>
                                                    <li><a href="AllServlet?kind=热映&currentpageno=1">Now</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="AllServlet?kind=高分&currentpageno=1">top score</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>


                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Country <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <li>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="AllServlet?kind=华语&currentpageno=1">China</a></li>
                                                    <li><a href="AllServlet?kind=欧美&currentpageno=1">America</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="AllServlet?kind=日本&currentpageno=1">Japan</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="AllServlet?kind=韩国&currentpageno=1">Korea</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="">A - z list</a></li>
                                <li><a href="#contactForm">Contact</a></li>
                                <c:if test="${user.id==null}">
                                    <li id="showname" style="display: inline-block;"><a href="admin.jsp">Login and Register</a></li>
                                </c:if>
                                <c:if test="${user.id!=null}">
                                    <li id="showname2" style="display: none;"><a href="userinfo.jsp">${sessionScope.email}</a></li>
                                    <li id="showname3" style="display: none;"><a href="LogoutServlet">log out !</a></li>
                                </c:if>
                            </ul>

                        </div>
                        <div class="clearfix"> </div>
                    </nav>
                    <div class="w3ls_search">
                        <div class="cd-main-header">
                            <ul class="cd-header-buttons">
                                <li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
                            </ul> <!-- cd-header-buttons -->
                        </div>
                        <div id="cd-search" class="cd-search">
                            <form action="FindServlet" method="post">
                                <input name="searchcontent" type="search" placeholder="Search...">
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <!--//header-w3l-->
            <!--/banner-info-->

            <!--/banner-ingo-->
        </div>
    </div>
    <script src="javascript/jquery-1.11.1.min.js"></script>
    <!-- Dropdown-Menu-JavaScript -->
    <script>
        $(document).ready(function(){
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- //Dropdown-Menu-JavaScript -->
    <script type="text/javascript" src="javascript/jquery.zoomslider.min.js"></script>
    <!-- search-jQuery -->
    <script src="javascript/main.js"></script>
    <script src="javascript/simplePlayer.js"></script>
    <script>
        $("document").ready(function() {
            $("#video").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video1").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video2").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video3").simplePlayer();
        });
    </script>
    <c:if test="${user.id==null}">
        <div class="hot1">
            <div class="populardiv">
                <ul class="popularul">
                    <li ><div class="popularfont">
                        热门电影
                    </div></li>
                    <li><a href="" title="more movies"> 全部热门电影 》 </a></li>
                </ul>
                <div class="box">
                    <c:forEach items="${listShowNumOfPeople}" var="movie">
                        <div>
                            <div class="div5">
                                <ul>
                                    <li style="text-align:center;">
                                        <a href="MovieInf.jsp?movie=${movie}  name=${movie.movieName}">
                                            <img src="${movie.img}" style="padding-left:70px;padding-top:5px;padding-right:50px" alt="${movie.movieName}">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <div class="div6">
                                <ul>
                                    <li style="text-align:center;"><a style="padding-left:50px;padding-top:0px;" href="" title=${movie.movieName}>${movie.movieName}</a></li>
                                </ul>
                            </div>
                            <div class="div7">
                                <ul>
                                    <li style="text-align:center;"><a href="" style="padding-left:50px;color:rgb(226, 171, 81);">
                                        <fmt:formatNumber type="number" value="${movie.grade/movie.numOfPeople}" pattern="0.0" maxFractionDigits="1"/></a></li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <img src="img/mainad.jpg" style="width: 60%;margin-left: 6%;margin-top: 3%;">
        </div>
    </c:if>
    <c:if test="${user.id!=null}">
    <div class="hot1">
        <div class="populardiv">
            <ul class="popularul">
                <li ><div class="popularfont">
                    为你推荐
                </div></li>
                <li><a href="" title="more movies"> 全部推荐电影 》 </a></li>
            </ul>
            <div class="box">
                <c:forEach items="${listShowPrefer}" var="movie">
                <div>
                    <div class="div5">
                        <ul>
                            <li style="text-align:center;">
                                <a href="MovieInf.jsp?movie=${movie}  name=${movie.movieName}">
                                            <img src="${movie.img}" style="padding-left:70px;padding-top:5px;padding-right:50px;" alt="${movie.movieName}">
                                </a>
                            </li>
                        </ul>
                    </div>
                    <br>
                    <div class="div6">
                        <ul>
                            <li style="text-align:center;"><a style="padding-left:50px;padding-top:0px;" href="" title=${movie.movieName}>${movie.movieName}</a></li>
                        </ul>
                    </div>
                    <div class="div7">
                        <ul>
                            <li style="text-align:center;"><a href="" style="padding-left:50px;color:rgb(226, 171, 81);">
                                <fmt:formatNumber type="number" value="${movie.grade/movie.numOfPeople}" pattern="0.0" maxFractionDigits="1"/></a></li>
                        </ul>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    </c:if>

    <div class="hot">
        <div class="populardiv">
            <ul class="popularul">
                <li ><div class="popularfont">
                    高分电影
                </div></li>
                <li style="width: 3%;"><a href="" title="more movies"> 最新 </a></li>
                <li style="width: 3%;"><a href="" title="hot" > 热门 </a></li>
                <li style="width: 3%;"><a href="" title="grade" > 高分 </a></li>
                <li style="width: 3%;"><a href="" title="chinese" > 华语 </a></li>
                <li style="width: 3%;"><a href="" title="America" > 欧美 </a></li>
                <li style="width: 3%;"><a href="" title="Japan" > 日本 </a></li>
                <li style="width: 3%;"><a href="" title="Korea" > 韩国 </a></li>
                <li style="width: 4%;"><a href="" title="more movies" > 更多》  </a></li>
            </ul>
            <div class="box">
                <c:forEach items="${listShowScore}" var="movie">
                    <div>
                        <div class="div5">
                            <ul>
                                <li style="text-align:center;">
                                    <a href="MovieInf.jsp?movie=${movie}  name=${movie.movieName}">
                                            <img src="${movie.img}" style="padding-left:70px;padding-top:5px;padding-right:50px;" alt="${movie.movieName}">
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <br>
                        <div class="div6">
                            <ul>
                                <li style="text-align:center;"><a style="padding-left:50px;padding-top:0px;" href="" title=${movie.movieName}>${movie.movieName}</a></li>
                            </ul>
                        </div>
                        <div class="div7">
                            <ul>
                                <li style="text-align:center;"><a href="" style="padding-left:50px;color:rgb(226, 171, 81);">
                                    <fmt:formatNumber type="number" value="${movie.grade/movie.numOfPeople}" pattern="0.0" maxFractionDigits="1"/></a></li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <img src="img/888.gif" style="width: 50%;margin-left: 6%;margin-top: 3%;height: 30%;">
        <%--        <img src="img/yingpinglogo.jpg" style="width: 40%;margin-left: 6%;margin-top: 3%;height: 30%;">--%>
    </div>
    <footer class="footer">
        <div class="img1">
            <img src="">
        </div>
        <div class="last">
            <form onsubmit="return check1(${sessionScope.email})" action="AddContactServlet" class="contact-form" method="post" name="contactForm" id="contactForm">
                <h3 class="text-uppercase">Contact with me</h3>
                <input id="movieNameg" name="movieNameg" style="display:none;" value=>
                <input type="text" class="form-control" placeholder="Your Name" id="name" name="name">
                <input type="email" class="form-control" placeholder="Your Email" id="emailc" name="emailc">
                <textarea class="form-control" placeholder="Your Message" id="content" name="content"></textarea>
                <button type="submit">Send</button>
            </form>
        </div>
    </footer>
</div>
</body>
</html>
