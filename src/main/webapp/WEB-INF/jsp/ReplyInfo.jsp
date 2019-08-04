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
            background: url(img/dx.jpg) no-repeat;
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
            margin: 90px;
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
<%--<%--%>
<%--    List<String[]> afilmlist=(List<String[]>)request.getAttribute("afilm");--%>
<%--%>--%>
<div class="back">
    <jsp:include page="mytop.jsp"></jsp:include>
    <div class="main">
        <div class="wrap">

        </div>
        <div>

                <c:forEach items="${replies}" var="reply" varStatus="status">
                    <c:set var="user" value="${users.get(status.index)}"/>
            <hr style="width:1000px;background-color:gray;height: 1px;border: none;margin-top: 11px;" />
            <div class="two-flex">
                <div class="twoflex-left">
                    <a style="width:100%;" href="">

                        <img src="${movie.img}" alt="review" />
                    </a>
                </div>
                <div class="twoflex-right">
                    <div class="film-content">

                        <div style="text-align:center; font-size: 1em;color:rgb(16, 119, 221);"><span style="color:white;margin-right: 1.5%;">电影名：</span>${movie.movieName}</div><p> </p>
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 5%;"><span style="color:white;margin-right: 1.5%;">评论用户：</span>${user.userName}</div><p> </p>
                        <div style="text-align:center;font-size: 1em;color:rgb(16, 119, 221);margin-top: 5%;"><span style="color:white;margin-right: 1.5%;">评论时间：</span>${reply.replyTime}</div>
                        <div style="text-indent:20px;color:white;font-size:0.9em;margin-top: 5%;"><p>${reply.content}</p></div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <hr style="width:1000px;background-color:gray;height: 1px;border: none;margin-top: 11px;" />
        </div>
        <div>
            <input id="forgetemail" style="display:none;" value="${sessionScope.user.id }">

            <form onsubmit="return checkreply()" action="writeReply" method="post">
                <div style="display:flex;flex-direction:column;align-items:center;justify-content:flex-start;">
                    <input id="userId" name="userId" style="display:none;" value="${sessionScope.user.id}">
                    <input id="filmReviewId" name="filmReviewId" style="display:none;" value="${replies.get(0).filmReview.id}">
                    <textarea rows="5" cols="100" name="content" id="content" placeholder="写些看法吧~~" style="font-size: 13px;"></textarea>
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