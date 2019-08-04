<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/4
  Time: 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/managershowallmovies.css">


</head>
<body>
<div class="table">
    <table width="90%" class="table" style="text-align:center; margin-top:50px; width: 900px;
    margin-left: 80px;">
        <tr>
            <td style="width:50px; background-color:#f7f7f7;">用户Id</td>
            <td style="width:50px;background-color:#f7f7f7;">内容</td>
        </tr>
        <c:forEach items="${messages}" var="message">
            <tr>
                <td style="vertical-align: inherit;">${message.userId}</td>
                <td style="vertical-align: inherit;">${message.content}</td>

            </tr>
        </c:forEach>


    </table>
</div>



</body>
</html>
