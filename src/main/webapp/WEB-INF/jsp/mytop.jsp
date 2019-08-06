<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-19
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
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
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="javascript/modernizr-2.6.2.min.js"></script>
    <script src="javascript/jquery-1.11.1.min.js"></script>
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
<div id="demo-1" class="banner-inner">
    <div class="">
        <!--/header-w3l-->
        <div class="header-w3-agileits" id="home">
            <div class="inner-header-agile part2">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1><a  href=""><span>F</span>unny <span>M</span>ovies</a></h1>
                    </div>
                    <!-- navbar-header -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="welcome">Home</a></li>
                            <li class="dropdown active">
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
    </div>
</div>
<!-- Dropdown-Menu-JavaScript -->
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
</body>
</html>
