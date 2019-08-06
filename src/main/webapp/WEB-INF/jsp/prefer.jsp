
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.security.MessageDigest"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="js/md5.js" type="text/javascript"></script>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/flatpickr.dark.min.css" />
    <link rel="stylesheet" type="text/css" href="css/zoomslider1.css" />
    <script type="text/javascript" src="javascript/flatpickr.js" ></script>
    <title>register</title>
    <style>
        body {
            font-family: 'Muli', sans-serif;
            background: url(img/bg7.jpg) no-repeat;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            background-size:cover;
            background-attachment: fixed;
            margin:0px;
            padding:0px;
            width: 100%;
            height: 100%;
        }
    </style>
    <script type="text/javascript">
        function date(){
            document.getElementById("birthday").flatpickr();
        }
        function _hyz() {
            var img = document.getElementById("imgVerifyCode");
            // 需要给出一个参数，这个参数每次都不同，这样才能干掉浏览器缓存！
            img.src = "VerifyCodeServlet?a=" + new Date().getTime();
        }
    </script>
    <script src="javascript/check.js" type="text/javascript"></script>
</head>
<body>
<div class="back">
    <jsp:include page="mytop.jsp"></jsp:include>
    <div class="header-main">
        <h2>Please choose your favourite</h2>

        <div class="header-left-bottom">
            <form action="adduserprefer" method="post">
                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                    <select  style="width:100%;text-align: center;" class="icon1" name="movieType">
                        <option value=""></option>
                        <option value="剧情" >剧情</option>
                        <option value="喜剧" >喜剧</option>
                        <option value="动作" >动作</option>
                        <option value="爱情" >爱情</option>
                        <option value="惊悚" >惊悚</option>
                        <option value="科幻" >科幻</option>
                        <option value="动画" >动画</option>
                    </select>

                <div class="icon1">
                    <input id="actor" type="text" name="actor" placeholder="Your Prefer Actor" required=""/>
                </div>
                <div class="icon1">
                    <input id="director" type="text" name="director" placeholder="Your Prefer Director" required=""/>
                </div>
                <div class="bottom" style="margin: 0.6em 0 0;">
                    <input type="submit" value="Prefer" />
                </div>
            </form>
        </div>

    </div>
    <div class="copyright">
        <p>@ 2019 Funny Movies Register Form . All rights reserved | Design by Our Team</p>
    </div>
</div>
</body>
</html>
