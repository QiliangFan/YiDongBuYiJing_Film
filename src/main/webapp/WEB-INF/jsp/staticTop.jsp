<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
   <head>
       <base href="<%=basePath%>">
   	<meta charset="utf-8" />
       <style type="text/css">
        .top{
    height: 40%;
    width:100%;
    margin: 0;
    /*background:rgb(189, 181, 181);*/
    position: relative;
    top: 0;
}
.top ul{
  
    width: auto;
    list-style-type: none;
    white-space:nowrap;
    overflow: hidden;
    margin-left: 5%;    
    padding: 0;

}
.top li {
    float:left; 
    margin-right:2%; 
    position: relative;
    overflow: hidden;
}

.top li a{
    display: block; 
    color:white;
    text-align: center;
    padding: 3px;
    overflow: hidden;
    text-decoration: none; 
    
}
.top li a:hover{
    /*background-color: #111;*/
}
.top ul li ul{
    margin-left: -0.2px;
    background:rgb(189, 181, 181);
    position: relative;
    display: none; 

}
.top ul li ul li{
    
    float:none;
    text-align: center;
}
.top ul li:hover ul{
    display: block;
}
body{
    background:#eff3f5;
}

       </style>
        <body>
            <div class="top" style="background: url('img/11111.jpg');width:100%;background-repeat:no-repeat;height:175px;text-decoration:none; ">
                   <center> 
                    <ul>
                    <li><a href="welcome" style="font-size: 40px">HOME</a></li>
                      </ul>
                    </center>      
            </div>
        </body>
    </head>
</html>
 
