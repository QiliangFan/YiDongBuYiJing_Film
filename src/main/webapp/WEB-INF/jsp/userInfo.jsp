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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/userInfo.js"></script>
    <link rel="stylesheet" type="text/css" href="/Movies/bootstrap-4.3.1-dist/css/bootstrap.min.css"></link>
    <link rel="stylesheet" type="text/css" href="css/userInfo.css">
</head>
<body class="container-fluid" style="padding: 0;margin:0;">
<div class="row" style="height: 30%;" style="padding: 0;margin:0;"></div>
<div class="row userInfo" style="height: 70%" style="padding: 0;margin:0;">
    <div class="col-md-1" style="padding: 0;margin:0;">
        <div class="leftBar">
            <div class="row">
                <a href="javascript:void(0)"><img src="img/liangUser.png"></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="personalInfo()"><span class="choose">账号信息</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myHoby()"><span class="choose">个人喜好</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myReply()"><span class="choose">我的回复</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myHistory()"><span class="choose">历史记录</span></a>
            </div>
            <div class="row">
                <a href="javascript:void(0)" onclick="myComments()"><span class="choose">我的留言</span></a>
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
                <form action="modifyUserInfo" id="modifyUserInfo" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="hideId" name="id">
                    <input type="hidden" id="hideUserName" name="userName">
                    <input type="hidden" id="hideEmail" name="email">
                    <input type="hidden" id="hideAuthority" name="authority">
                    <input type="hidden" id="hidePassword" name="password">


                    <span class="modifyItem" id="username">用户名:</span><br>
                    <span class="modifyItem" id="email">邮箱:</span><br>
                    <span class="modifyItem">性别:<input type="radio" name="gender" value="男">男&nbsp;<input type="radio"
                                                                                                          value="女"
                                                                                                          name="gender">女<br></span>
                    <span class="modifyItem">生日:<input type="date" name="birthday"></span><br>
                    <span class="modifyItem">密码:<input type="password" name="password"> </span><br>
                    <span class="modifyItem">确认密码:<input type="password" name="confirmpassword"></span><br>
                    <span class="modifyItem">上传头像:<input type="file" name="headimage"></span><br>
                    <span class="modifyItem" style="text-align: center"><input type="submit" value="确认修改"></span>
                </form>
            </div>
        </div>

        <!--个人喜好-->
        <div id="myHoby" class="row myHoby" style="padding: 0;margin:0;">
            <div class="row" style="width:100%;margin: 0;padding: 0;">
                <form class="myForm" onsubmit="return false;">
                    <span>喜欢的导演:<input name="director"></span><br>
                    <span>喜欢的演员:<input name="actor"></span><br>
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
                        <button  class="mybutton" value="1">剧情</button>
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
        <div id="myReply" class="row MyReply" style="padding: 0;margin:0;">
            <div class="row"
                 style="overflow:auto;width:100%;padding: 0;margin: 0;display: flex;flex-direction: column;align-items: center;">
                <table class="mytable" border="2px" width="80%">
                    <tr>
                        <th>标题</th>
                        <th>内容</th>
                        <th>回复时间</th>
                        <th>评论的影评</th>
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
                <table class="mytable" border="2px" width="80%">
                    <tr>
                        <th>时间</th>
                        <th>操作</th>
                        <th>电影</th>
                    </tr>
                    <c:forEach items="${requestScope.myHistory}" var="item">
                        <tr>
                            <td>${item.time}</td>
                            <td>${item.event}</td>
                            <td>${item.movie.movieName}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>


        <!--我的留言-->
        <div id="myComments" class="row MyComments" style="padding: 0;margin:0;">
            <div class="row"
                 style="overflow:auto;width:100%;padding: 0;margin: 0;display: flex;flex-direction: column;align-items: center;">
                <table class="mytable" border="2px" width="80%">
                    <tr>
                        <th>我的留言</th>
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
