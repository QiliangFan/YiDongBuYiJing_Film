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
    <script type="text/javascript">
        $(document).ready(function(){
            // var id = $('#user1').val();
            // alert(id);

            var msg = $('#msg').val();
            if(msg == "1"){
                alert("留言成功");
                $('#msg').val('');
            }
            if(msg == "0"){
                alert("留言失败");
                $('#msg').val('');
            }
            if(msg == "找回密码失败"){
                alert("找回密码失败");
                $('#msg').val('');
            }
            if(msg == "留言成功"){
                alert("留言成功");
                $('#msg').val('');
            }
            if(msg == "留言失败"){
                alert("留言失败");
                $('#msg').val('');
            }
        })
    </script>
    <script type="text/javascript">
        function search(e) {
            var e = e||window.event;
            if (e.keyCode==13) {
                var val = document.getElementById("searchcontent").value;
                // alert(val);
                document.getElementById("searchcontent").value = '';
                window.event.returnValue = false;
                window.location.href = "searchMovies?selectType=Keyword&orderBy=DESC&sortType=Time&value="+encodeURIComponent(val);
            }
        }
    </script>
</head>

<body>
<input style="display: none" value="${msg}" id="msg">
<input style="display: none" value="${sessionScope.user}" id="user1">
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
                                <li class="active"><a href="welcome">Home</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <li>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="searchMovies?selectType=All&orderBy=ASC&sortType=numOfPeople">All</a></li>
                                                    <li><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Time">Hot</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Time">new</a></li>
                                                    <li><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Time">Now</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Grade">top score</a></li>
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
                                                    <li><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=中国">China</a></li>
                                                    <li><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=美国">America</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=日本">Japan</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=韩国">Korea</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#contactForm">Contact</a></li>
                                <c:if test="${sessionScope.user==null&&sessionScope.user.userName==null}">
                                    <li id="showname" ><a href="jump">Login and Register</a></li>
                                </c:if>
                                <%
                                    System.out.println(session.getAttribute("user"));
                                %>
                                <c:if test="${sessionScope.user!=null&&sessionScope.user.userName!=null}">
                                    <li id="showname2" ><a href="toUserInfo">${sessionScope.user.userName}</a></li>
                                    <li id="showname3"><a href="logout">log out !</a></li>
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
<%--                            <form action="searchMovies" method="post">--%>
                                <form action="" method="">
<%--                                <input name="value" type="search" placeholder="Search...">--%>
                                <input name="value" id="searchcontent" type="search" placeholder="Search..." onkeydown="search(arguments[0])">
                                <input style="display: none" name="selectType" value="Keyword">
                                <input style="display: none" name="orderBy" value="DESC">
                                <input style="display: none" name="sortType" value="Time">
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
    <c:if test="${sessionScope.user.userName==null}">
        <div class="hot1">
            <div class="populardiv">
                <ul class="popularul">
                    <li ><div class="popularfont">
                        热门电影
                    </div></li>
                    <li><a href="searchMovies?selectType=All&orderBy=DESC&sortType=numOfPeople" title="more movies"> 全部热门电影 》 </a></li>
                </ul>
                <div class="box">
                    <c:forEach items="${listShowNumOfPeople}" var="movie">
                        <div>
                            <div class="div5">
                                <ul>
                                    <li style="text-align:center;">
                                        <a href="findMovieInfo?id=${movie.id}">
                                            <img src="${movie.img}" style="padding-left:70px;padding-top:5px;padding-right:50px" alt="${movie.movieName}">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <div class="div6">
                                <ul>
                                    <li style="text-align:center;"><a style="padding-left:50px;padding-top:0px;" href="findMovieInfo?id=${movie.id}" title=${movie.movieName}>${movie.movieName}</a></li>
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
    <c:if test="${sessionScope.user.userName!=null}">
    <div class="hot1">
        <div class="populardiv">
            <ul class="popularul">
                <li ><div class="popularfont">
                    为你推荐
                </div></li>
                <li><a href="recommend?currentPage=1&userid=${sessionScope.user.id}" title="more movies"> 全部推荐电影 》 </a></li>
            </ul>
            <div class="box">
                <c:forEach items="${listShowPrefer}" var="movie">
                <div>
                    <div class="div5">
                        <ul>
                            <li style="text-align:center;">
                                <a href="findMovieInfo?id=${movie.id}">
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
                <li style="width: 3%;"><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Time" title="more movies"> 最新 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=All&orderBy=DESC&sortType=numOfPeople" title="hot" > 热门 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=All&orderBy=DESC&sortType=Grade" title="grade" > 高分 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=中国" title="chinese" > 中国 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=美国" title="America" > 美国 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=日本" title="Japan" > 日本 </a></li>
                <li style="width: 3%;"><a href="searchMovies?selectType=Country&orderBy=DESC&sortType=Time&value=韩国" title="Korea" > 韩国 </a></li>
            </ul>
            <div class="box">
                <c:forEach items="${listShowScore}" var="movie">
                    <div>
                        <div class="div5">
                            <ul>
                                <li style="text-align:center;">
                                    <a href="findMovieInfo?id=${movie.id}">
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
            <form onsubmit="return check1(${sessionScope.user.userName})" action="writeMessage" class="contact-form" method="post" name="contactForm" id="contactForm">
                <h3 class="text-uppercase">Contact with me</h3>
                <input id="userId" name="userId" style="display:none;" value="${sessionScope.user.id}">
                <input type="text" class="form-control" placeholder="Your Name" id="userName" name="userName">
                <textarea class="form-control" placeholder="Your Message" id="content" name="content"></textarea>
                <button type="submit">Send</button>
            </form>
        </div>
    </footer>
</div>
</body>
</html>
