<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
<<<<<<< HEAD
<jsp:forward page="/welcome"></jsp:forward>
<h2>Hello World!</h2>
=======
        <script>
            window.location.href="toUserInfo"
        </script>
>>>>>>> 3d4a2df8581f325c2f61070cf3657ec6ac227a4a
</body>
</html>
