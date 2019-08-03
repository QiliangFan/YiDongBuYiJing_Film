<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-19
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        function showtitle(){
            var x=document.getElementById("showname");
            var y=document.getElementById("showname2");
            var z=document.getElementById("showname3");
            //alert(x.style.display);
            <%--var email=${sessionScope.email};--%>
            <%--var emailn="${sessionScope.email}";--%>
            var emailn= "<%=session.getAttribute("email")%>";
            // console.log(email);
            //alert(x.style.display);
            if(emailn=="null"||emailn==""){
                if(x.style.display=="none")
                {
                    x.style.display="inline-block";
                }
                if(y.style.display=="inline-block"){
                    y.style.display=="none";
                }
                if(z.style.display=="inline-block"){
                    z.style.display=="none";
                }
            }else {
                if(x.style.display=="inline-block"){
                    x.style.display="none";
                }
                if(y.style.display=="none"){
                    y.style.display="inline-block";
                }
                if(z.style.display=="none"){
                    z.style.display="inline-block";
                }
            }
        }
    </script>
</head>
<body onload="showtitle()">
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
                            <li><a href="main.jsp">Home</a></li>
                            <li class="dropdown active">
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
                            <li><a href="main.jsp#contactForm" target="_top">Contact</a></li>
                            <li id="showname" style="display: inline-block;"><a href="admin.jsp">Login and Register</a></li>
                            <li id="showname2" style="display: none;"><a href="#">Hello! ${sessionScope.email}</a></li>
                            <li id="showname3" style="display: none;"><a href="LogoutServlet">log out !</a></li>
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
    </div>
</div>
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
