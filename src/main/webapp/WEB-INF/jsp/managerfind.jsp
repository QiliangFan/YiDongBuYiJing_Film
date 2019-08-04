<%--
  Created by IntelliJ IDEA.
  User: 50593
  Date: 2019-07-21
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/zoomslider2.css" />
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="css/manager.css">
    <title>manager</title>
</head>
<frameset rows="20%,80%">

    <frame noresize="noresize" src="/Movies/static/mhead.jsp">


    <frameset noresize="noresize" cols="20%,80%">
        <frame noresize="noresize" src="/Movies/static/mleft.jsp">
        <frame noresize="noresize" src="/Movies/static/mright.jsp" name="rights">
    </frameset>
</frameset>
<body>

</body>
</html>
