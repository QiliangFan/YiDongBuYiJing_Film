<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <style>
        body {
            font-family: 'Muli', sans-serif;
            background: url(img/xhr.jpg) no-repeat;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            background-size:cover;
            background-attachment: fixed;
            height:100%;
        }
        html{
            height:100%;
        }
        .input1{
            outline-style: none ;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 15px 11px;
            width: 70px;
            font-size: 13px;
            /*font-weight: 700;*/
            font-family: "Microsoft soft";
            height: 6px;
        }
        .input2{
            outline-style: none ;
            border: 1px solid #FC7D01;
            border-radius: 3px;
            width: 60px;
            font-size: 0.85em;
            font-weight: initial;
            font-family: "Microsoft soft";
            margin-left:15px;
            vertical-align:middle;
            height: 34px;
            padding-left: 9px;
            background-color: #FC7D01;
            color: #FFF;
        }
        .input3{
            outline-style: none ;
            border: 1px solid #ccc;
            border-radius: 3px;
            width: 70px;
            font-size: 13px;
            font-weight: 700;
            font-family: "Microsoft soft";
            margin-left:15px;
            vertical-align:middle;
            height: 30px;
        }
        .two-flex{
            /*margin: 90px;*/
            display:flex;
            flex-direction: row;
            width: 90%;
            margin-top: 75px;
            margin-left: 3%;
        }

        .twoflex-left{
            width:13.5%;
            margin-bottom: 20px;
            margin-right: 20px;
            margin-left: 15%;
        }

        .twoflex-right{
            width:60%;
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
            align-items: center;
            justify-content: center;
            margin-left: 20px;
        }

        .film-content{
            width:100%;
            display: flex;
            flex-direction: column;
            word-wrap:break-word;
            word-break: break-all;
            overflow: hidden;
        }
        img[alt]{
            width:100%;

        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/zoomslider2.css" />

    <script type="text/javascript" src="js/movieinfo.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var msg = $('#msg').val();
            if(msg == "评分成功"){
                alert("评分成功");
                $('#msg').val('');
            }
            if(msg == "评分失败"){
                alert("评分失败");
                $('#msg').val('');
            }
            if(msg == "发表影评成功"){
                alert("发表影评成功");
                $('#msg').val('');
            }
            if(msg == "发表影评失败"){
                alert("发表影评失败");
                $('#msg').val('');
            }
        })

    </script>
</head>
<body>
<input style="display: none" value="${msg}" id="msg">
<%--<%--%>
<%--    List<String[]> afilmlist=(List<String[]>)request.getAttribute("afilm");--%>
<%--%>--%>
<div class="back">
    <jsp:include page="mytop.jsp"></jsp:include>
    <div class="main">
        <div class="wrap">

        </div>
        <div>
            <c:forEach items="${filmReviewsByMovie}" var="filmReview" varStatus="status">
                <c:set var="user" value="${usersByUser.get(status.index)}"/>
            <hr style="width:1000px;background-color:gray;height: 1px;border: none;margin-top: 11px;" />
            <div class="two-flex">
                <div class="twoflex-left">
                    <a style="width:100%;" href="">
                        <img src="${moviesByMovie.img}" alt="review" />
                    </a>
                </div>
                <div class="twoflex-right">
                    <div class="film-content">
                        <div style="text-align:center; font-size: 1em;color:rgb(16, 119, 221);"><span style="color:white;margin-right: 1.5%;">电影名字：</span>${moviesByMovie.movieName}</div><p> </p>
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 5%;"><span style="color:white;margin-right: 1.5%;">影评作者：</span>${user.userName}</div><p> </p>
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 5%;"><span style="color:white;margin-right: 1.5%;">时间：</span>${filmReview.commentTime}</div>
                        <div style="text-indent:20px;color:white;font-size:0.9em;margin-top: 5%;"><p>${filmReview.review}</p></div>
                        <div style="margin-top: 130px;margin-left: 70%;"><a href="GetAllReplyBy?filmReviewId=${filmReview.id}" style="color: white">点此查看热评</a></div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <hr style="width:1000px;background-color:gray;height: 1px;border: none;margin-top: 11px;" />
        </div>
        <div>
            <input id="forgetemail" style="display:none;" value="${sessionScope.user.id }">

            <form onsubmit="return check1('${sessionScope.user.userName}')" action="writeFilmReview" method="post">
                <div style="display:flex;flex-direction:column;align-items:center;justify-content:flex-start;">
                    <input id="userId" name="userId" style="display:none;" value="${sessionScope.user.id}">
                    <input id="movieId" name="movieId" style="display:none;" value="${moviesByMovie.id}">
                    <textarea rows="5" cols="100" name="review" id="review" placeholder="唱歌不如跳舞，看影评不如写影评~~" style="font-size: 13px;"></textarea>
                    <input style="align-self:center;margin-top:20px;margin-bottom:20px;" type="submit" class="input3" value="提交"/>
                </div>
            </form>
        </div>

        <script type="text/javascript">
            $(document).ready(function() {
                $().UItoTop({ easingType: 'easeOutQuart' });

            });
        </script>
    </div>
</div>
</body>
</html>