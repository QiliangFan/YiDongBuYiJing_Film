<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-18
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.security.MessageDigest"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="javascript/jquery-3.4.1.min.js" type="text/javascript" ></script>
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
    <script type="text/javascript">
        $(document).ready(function(){
            var msg = $('#msg').val();
            console.log(msg);
            if(msg == "注册失败"){
                alert("注册失败！");
                $('#msg').val('');
            }
            if(msg == "验证码错误"){
                alert("验证码错误！");
                $('#msg').val('');
            }
        })
    </script>
</head>
<body>
<input style="display: none" value="${msg}" id="msg">
<div class="back">
    <jsp:include page="mytop.jsp"></jsp:include>
    <div class="header-main">
        <h2>Register</h2>

        <div class="header-left-bottom">
            <form action="register" method="post" onsubmit="return checkreg('email','user','pwd','pwdconfirm','birthday','pin')">
                <input type="hidden" name="method" value="login">
                <div class="icon1">
                    <input id="email" type="email" name="email" placeholder="Email" required=""/>
                </div>
                <div class="icon1">
                    <input id="user" type="text" name="userName" placeholder="userName" required=""/>
                </div>
                <div class="icon1">
                    <input id="pwd" type="password" name="password" placeholder="Password" required=""/>
                </div>
                <div class="icon1">
                    <input id="pwdconfirm" type="password" name="confirmpassword" placeholder="Confirm Password" required=""/>
                </div>
                <div class="verifi">
                    <div class="ico2">
                        <input type="text" name="birthday" id="birthday" placeholder="Your BirthDay" onmousedown="date()" required=""/>
                    </div>
                </div>
                <div class="login-check">
                    Gender :
                    <input type="radio" name="gender" value="0" /> Male
                    <input type="radio" name="gender" value="1" /> Female
                    <input type="radio" name="gender" value="2" checked="checked"/> Secret
                </div>
                <div class="verifi">
                    <div class="ico2">
                        <input name="VerifyCode" id="pin" type="text" placeholder="PIN" required=""/>
                    </div>
                    <img id="imgVerifyCode" class="checkimg" src="VerifyCodeServlet" onclick="_hyz()" >
                </div>
                <div class="bottom" style="margin: 0.6em 0 0;">
                    <input type="submit" value="Register"<%-- onclick="checkreg('email','user','pwd','pwdconfirm','birthday','pin')"--%>/>

                </div>
                <p><a href="jump">I want to login</a></p>
            </form>
        </div>

    </div>
    <div class="copyright">
        <p>@ 2019 Funny Movies Register Form . All rights reserved | Design by Xiaojie</p>
    </div>
</div>
</body>
</html>
