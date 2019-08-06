
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>login</title>

    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="javascript/jquery-3.4.1.min.js" type="text/javascript" ></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascript/check.js" type="text/javascript"></script>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="css/zoomslider1.css" />
    <script type="text/javascript">
        function _hyz() {
            var img = document.getElementById("imgVerifyCode");
            // 需要给出一个参数，这个参数每次都不同，这样才能干掉浏览器缓存！
            img.src = "VerifyCodeServlet?a=" + new Date().getTime();
        }
    </script>
    <style>
        body {
            font-family: 'Muli', sans-serif;
            background: url(img/bg6.jpg) no-repeat;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            background-size:cover;
            background-attachment: fixed;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            var msg = $('#msg').val();
            if(msg == "用户名或密码错误"){
                alert("用户名或密码错误！");
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
<div class="back" >
    <jsp:include page="mytop.jsp"></jsp:include>
    <div class="header-main">
        <h2>Login Now</h2>
        <div class="">
            <div class="">
                <div class="header-left-bottom">
                    <form action="login" method="post">
                        <input type="hidden" name="method" value="login">
                        <div class="icon1">
                            <input  id="userName" type="text" name="userName" placeholder="userName" required=""/>
                        </div>
                        <div class="icon1">
                            <input id="password" name="password" type="password" placeholder="Password" required=""/>
                        </div>
                        <div class="verifi">
                            <div class="ico2">
                                <input name="VerifyCode" id="pin" type="text" placeholder="PIN" required=""/>
                            </div>
                            <img id="imgVerifyCode" class="checkimg" src="VerifyCodeServlet" onclick="_hyz()" >
                        </div>
                        <div class="login-check">
                            Identity：
                            <input type="radio" name="authority" value="0" checked="checked"/> Member
                            <input type="radio" name="authority" value="1" /> Manager
                        </div>
                        <div class="bottom" style="margin: 3em 0 0;">
                            <input type="submit" value="Log in" />
<%--                            <input type="submit" value="Log in"  />--%>
                        </div>
                        <p><a href="jump2">I want to register</a></p>
                        <p><a href="findpwdPage">Forget Password</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>@ 2019 Funny Movies Login Form . All rights reserved | Design by Our Team</p>
    </div>
</div>
</body>
</html>
