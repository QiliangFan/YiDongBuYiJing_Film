<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>个人信息界面</title>
<%--    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/md5.js"></script>
    <link rel="stylesheet" type="text/css" href="/Movies/bootstrap-4.3.1-dist/css/bootstrap.min.css"></link>
    <script type="text/javascript" src="js/userinfo.js"></script>
    <%--    <script type="text/javascript" src="javascript/jquery-3.4.1.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="css/zoomslider3.css"/>
    <link rel="stylesheet" type="text/css" href="css/addmovie.css">
    <link rel="stylesheet" type="text/css" href="css/userInfo.css">

    <%--    <script type="text/javascript" src="js/movieinfo.js"></script>--%>
    <style type="text/css">
        .a-upload {
            margin-left: 4%;
            margin-top: 5%;
            margin-bottom: 6%;
            /*margin-right: 25%;*/
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            /*overflow: hidden;*/
            display: inline-block;
            *display: inline;
            *zoom: 1;
            text-decoration-line: none;
        }

        .a-upload  input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }

        .fileinput-button {
            position: relative;
            display: inline-block;
            overflow: hidden;
        }

        .fileinput-button input{
            position:absolute;
            right: 0px;
            top: 0px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px;
        }
    </style>
</head>


<body class="container-fluid" style="padding: 0;">
<jsp:include page="staticTop.jsp"></jsp:include>
<script type="text/javascript" src="js/userinfo.js"></script>
<div class="row userInfo" style="width:100%;height: 70%;padding: 0;margin:0;">
    <div class="col-md-1" style="padding: 0;margin:0;">
        <div class="leftBar" style="margin-top:40%;">
            <div class="row">
                <a href="javascript:void(0)"><img src="img/liangUser.png"></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="personalInfo()"><span class="choose" style="color: white;">账号信息</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myHoby()"><span class="choose" style="color: white;">个人喜好</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myReply()"><span class="choose" style="color: white;">我的回复</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myHistory()"><span class="choose" style="color: white;">历史记录</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myComments()"><span class="choose" style="color: white;">我的留言</span></a>
            </div>
        </div>
    </div>
    <div class="col-md-11" style="padding: 0;margin:0;">
        <!--用户信息-->
        <div id="personalInfo" class="row PersonalInfo" style="padding: 0;margin:0;">
            <div class="col-md-3 headImgContainer" style="padding: 0;margin:0;">
                <img id="headImage" onerror="errorImg(this)" src="img/liangUser.png" title="用户头像">
            </div>
            <div class="col-md-9" style="padding: 0;margin:0;text-align: center;">
                <form action="modifyUserInfo" onsubmit="return submitForm()" id="modifyUserInfo" method="post"
                      enctype="multipart/form-data" style="margin-top:80px;">
                    <input type="hidden" id="hideId" name="id">
                    <input type="hidden" id="hideUserName" name="userName">
                    <input type="hidden" id="hideEmail" name="email">
                    <input type="hidden" id="hideAuthority" name="authority">
                    <input type="hidden" name="password" id="password">
                    <input type="hidden" name="confirmpassword" id="confirmpassword">

                    <span class="modifyItem" id="username">用户名:</span><br>
                    <span class="modifyItem" id="email">邮箱:</span><br>
                    <span class="modifyItem">性别:<input style="width: 2vw;" type="radio" name="gender"
                                                       value="男">男&nbsp;<input style="width: 2vw;" type="radio"
                                                                               value="女" name="gender">女<br></span>
                    <span class="modifyItem">生日:<input type="date" name="birthday"></span><br>
                    <span class="modifyItem">密码:<input id="fpassword" type="password" name="fpassword"> </span><br>
                    <span class="modifyItem">确认密码:<input id="fconfirmpassword" type="password" name="fconfirmpassword"></span><br>
<%--                    <span class="modifyItem">上传头像:<input--%>
<%--                            style="display:inline;width: 5vw; text-decoration: none;box-shadow: #ffffff 0 0 0;border: 0;"--%>
<%--                            class="upload" type="file" name="headimage"></span><br>--%>
                    <div class="a-upload" style="height:30px ;">
                        <div align="center" style="margin-top:0px;">
        <span class="fileinput-button" >
            <span>上传海报</span>
            <input type="file" name="headimage" style="position: absolute;right: 0px;top: 0px;opacity: 0;-ms-filter: 'alpha(opacity=0)';font-size: 200px;">
        </span>
                        </div>
                    </div>


                    <span class="modifyItem" style="text-align: center;"><input style="width: 6vw;" type="submit"
                                                                                value="确认修改"></span>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="js/userinfo.js"></script>

        <!--个人喜好-->
        <div id="myHoby" class="row myHoby" style="padding: 0;margin:0;">
            <div class="row" style="width:100%;margin: 0;padding: 0;">
                <form class="myForm" onsubmit="return false;">
                    <span>喜欢的导演:&nbsp;&nbsp;<input id="director" name="director" placeholder="多个导演之间以空格分割" style="color:gray;padding:5px;font-size:13px;text-align: center;"></span><br>
                    <span>喜欢的演员:&nbsp;&nbsp;<input id="actor" name="actor" placeholder="多个演员之间以空格分割" style="color:gray;padding:5px;font-size:13px;text-align: center;"></span><br>
                    <%--                    <span>喜欢的电影类型<select>--%>
                    <%--                        <option value="剧情">剧情</option>--%>
                    <%--                        <option value="喜剧">喜剧</option>--%>
                    <%--                        <option value="动作">动作</option>--%>
                    <%--                        <option value="爱情">爱情</option>--%>
                    <%--                        <option value="惊悚">惊悚</option>--%>
                    <%--                        <option value="科幻">科幻</option>--%>
                    <%--                        <option value="动画">动画</option>--%>
                    <%--                    </select></span>--%>
                    <span>
                        <button class="mybutton" value="1">剧情</button>
                        <button class="mybutton" value="2">喜剧</button>
                        <button class="mybutton" value="3">动作</button>
                    </span>
                    <br>
                    <span>
                        <button class="mybutton" value="4">爱情</button>
                        <button class="mybutton" value="6">科幻</button>
                        <button class="mybutton" value="7">动画</button>
                    </span>
                    <br>
                    <span style="align-items: center;text-align: center;">
                        <button class="mybutton" value="5">惊悚</button>
                    </span>
                </form>
            </div>
        </div>

        <!--我的回复-->
        <div id="myReply" class="row MyReply" style="overflow:scroll;padding: 0;margin:0;">
            <div class="row"
                 style="overflow:auto;width:100%;padding: 0;margin: 0;display: flex;flex-direction: column;align-items: center;">
                <table class="mytable" border="2px" width="80%" style="height: 10%;margin-bottom: 5vh;">
                    <tr>
                        <th style="text-shadow:none;">标题</th>
                        <th style="text-shadow:none;">内容</th>
                        <th style="text-shadow:none;">回复时间</th>
                        <th style="text-shadow:none;">评论的影评</th>
                    </tr>
                    <c:forEach items="${requestScope.myReply}" var="item">
                        <tr>
                            <td>${item.title}</td>
                            <td>${item.content}</td>
                            <td>${item.replyTime}</td>
                            <td>${item.filmReview.review}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>

        <!--历史记录-->
        <div id="myHistory" class="row MyHistory" style="padding: 0;margin:0;">
            <div class="row"
                 style="overflow:auto;width:100%;padding: 0;margin: 0;display: flex;flex-direction: column;align-items: center;">
                <table class="mytable" border="1px" width="80%" style="height:35px;">
                    <tr style="background-color:#FFFFDF ">
                        <th style="text-shadow:none;">时间</th>
                        <th style="text-shadow:none;">操作</th>
                        <th style="text-shadow:none;">电影</th>
                    </tr>
                    <c:forEach var="i" begin="${(sessionScope.page-1)*10}" end="${sessionScope.page*10-1}" step="1">
                        <c:if test="${i<requestScope.historyNum}">
                            <tr>
                                <td style="text-shadow:none;">${requestScope.myHistory[i].time}</td>
                                <td style="text-shadow:none;">${requestScope.myHistory[i].event}</td>
                                <td style="text-shadow:none;">${requestScope.myHistory[i].movie.movieName}</td>
                            </tr>
                        </c:if>
                    </c:forEach>


                    <%--                    <c:forEach items="${requestScope.myHistory}" var="item">--%>
                    <%--                        <tr>--%>
                    <%--                            <td>${item.time}</td>--%>
                    <%--                            <td>${item.event}</td>--%>
                    <%--                            <td>${item.movie.movieName}</td>--%>
                    <%--                        </tr>--%>
                    <%--                    </c:forEach>--%>

                </table>
                <nav style="margin-top:50px;">
                    <ul class="pagination">
                        <li class="page-item" >
                            <a class="page-link" href="toUserInfo/historypre">Previous</a>
                        </li>
                        <c:forEach var="i" begin="1" end="${requestScope.pageNum}" step="1">
                            <li class="page-item" >
                                <a class="page-link" href="history${i}p">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="toUserInfo/historynext">Next</a>
                        </li>
                    </ul>
                </nav>

                <script>
                    setInterval(function () {
                        console.log(${sessionScope.page});
                        if(${sessionScope.page>1} ){
                            myHistory();
                        }
                    },200)

                </script>

            </div>
        </div>


        <!--我的留言-->
        <div id="myComments" class="row MyComments" style="overflow:scroll;padding: 0;margin:0;">
            <div class="row"
                 style="overflow:auto;width:100%;padding: 0;margin: 0;display: flex;flex-direction: column;align-items: center;">
                <table class="mytable" border="1px" width="80%">
                    <tr style="background-color: #FFFAF0">
                        <th style="font-size:14px;padding:6px;font-weight:550;text-shadow:none;">我的留言</th>
                    </tr>
                    <c:forEach items="${requestScope.myMessages}" var="item">
                        <tr>
                            <td>${item.content}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>

    </div>
</div>
</body>
</html>
