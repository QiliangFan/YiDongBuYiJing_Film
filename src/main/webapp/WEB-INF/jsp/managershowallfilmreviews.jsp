<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/4
  Time: 1:51
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

    <script type="text/javascript">

        function deletes(id){
            var f=confirm("是否确定删除？");
            if(f){
                location.href="managerDeleteFilmReview?filmReviewId="+id;
            }else{
                alert("您取消删除");
            }
        }

    </script>

</head>
<body>
<div class="table">
    <table width="90%" class="table" style="text-align:center; margin-top:50px; width: 900px;
    margin-left: 80px;">
        <tr>
            <td style="width:50px; background-color:#f7f7f7;">内容</td>
            <td style="width:50px;background-color:#f7f7f7;">评论时间</td>
            <td style="width:50px; background-color:#f7f7f7;">阅读人数</td>
            <td style="width:10px;background-color:#f7f7f7;">好评数</td>
            <td style="width:10px;background-color:#f7f7f7;">差评数</td>
            <td style="width:50px;background-color:#f7f7f7;">操作</td>
        </tr>
        <c:forEach items="${filmReviews}" var="filmReview">
            <tr>
                <td style="vertical-align: inherit;">${filmReview.review}</td>
                <td style="vertical-align: inherit;">${filmReview.commentTime}</td>
                <td style="vertical-align: inherit;">${filmReview.readNum}</td>
                <td style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align:inherit;">${filmReview.goodNum}</td>
                <td style="overflow:hidden;word-break:keep-all;white-space:nowrap;
        text-overflow:ellipsis;vertical-align: inherit;">${filmReview.badNum}</td>

                <td style="vertical-align: inherit;">


                    <input type="button" style="margin-top:8px;height:22px;width: 40px;
               margin-left: 0px;margin-bottom:8px;" class="button button1"
                           onclick="deletes(${filmReview.id})" value="删除"/></td>
            </tr>
        </c:forEach>


    </table>
</div>



</body>
</html>
