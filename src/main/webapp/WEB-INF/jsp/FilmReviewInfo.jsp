<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-08-03
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.println(basePath);
%>
<html>
<head>
    <title>FilReviewInfo</title>
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
            background: url(img/bbb.jpg) no-repeat;
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
            margin: 30px;
            display:flex;
            flex-direction: row;
            width: 80%;
        }

        .twoflex-left{
            width:15%;
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
</head>
<body>

<div class="back">

    <jsp:include page="mytop.jsp" ></jsp:include>
        <div class="main">
<%--    <%@include file="/WEB-INF/jsp/mytop.jsp"%>--%>
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
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 3%;"><span style="color:white;margin-right: 1.5%;">影评作者：</span>${user.userName}</div><p> </p>
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 3%;">
                            <span style="color:white;margin-right: 1.5%;">时间：</span>${filmReview.commentTime}</div><p> </p>
                        <div style="text-indent:20px;color:white;font-size:0.9em;margin-top: 3%;"><p>${filmReview.review}</p></div>
                    </div>
                </div>
            </div>
    </c:forEach>
            <hr style="width:1000px;background-color:gray;height: 1px;border: none;margin-top: 11px;" />
        </div>
        <div>
            <input id="forgetemail" style="display:none;" value="${sessionScope.email }">

            <form onsubmit="return checkfilmreview()" action="writeFilmReview" method="post">
                <div style="display:flex;flex-direction:column;align-items:center;justify-content:flex-start;">
                    <input id="userId" name="userId" style="display:none;" value="${sessionScope.user.id }">
                    <input id="movieId" name="movieId" style="display:none;" value="${movie.id}">
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
