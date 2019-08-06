<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>mhead</title>
<link rel="stylesheet" type="text/css" href="css/manager.css">
	<style>

		.navbar-header h1 {
			font-size: 2em;
			display: block;
			text-transform: uppercase;
		}
		.navbar-header h1 a {
			color: #FFFFFF;
			text-decoration: none;
			display: inline-block;
			line-height: 78px;
			font-weight: bold;
			margin-top: 1.2%;
			margin-left: 9%;
		}
		h1 span {
			color: #02a388;
			font-size: 1.5em;
		}
	</style>
</head>
<body>
<div class="pdiv1">

	<div class="navbar-header">
		<h1><a href="welcome" target="_top"><span>F</span>unny <span>M</span>ovies</a></h1>
	</div>
</div>
</body>
</html>