<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-18
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
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
        <h2>Enter your Verification and your new password</h2>

        <div class="header-left-bottom">
            <form action="findpwd" method="post">
                <div class="icon1">
                    <input id="uName" type="text" name="userName" placeholder="Your user Name" required=""/>
                </div>
                <div class="icon1">
                    <input id="pwd" type="password" name="password" placeholder="Password" required=""/>
                </div>
                <div class="icon1">
                    <input id="pwdconfirm" type="password" name="confirmpassword" placeholder="Confirm Password" required=""/>
                </div>
                <div class="icon1">
                    <input id="VerifyCode" type="text" name="VerifyCode" placeholder="VerifyCode" required=""/>
                </div>
                <div class="bottom" style="margin: 0.6em 0 0;">
                    <input type="submit" value="Find"  />

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
