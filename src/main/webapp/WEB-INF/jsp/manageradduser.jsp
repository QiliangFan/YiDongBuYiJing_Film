<%--
  Created by IntelliJ IDEA.
  User: Zyrmj
  Date: 2019/8/3
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="css/manageradditem.css">

    <script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" ></script>

    <script type="text/javascript">

        $(function(){
            $("#input_date").datetimepicker({
                bootcssVer:3,  //bootstrap-datetimepicker＋bootstrap v3，但这个插件使用的时候，并没有和V3相匹配，仍然调用的是bootstrap V2的图标 把bootcssVer的值直接设为3，否则datetimepicker不会显示出上、下个月的箭头
                format: 'yyyy-mm-dd',
                minView: 'month',//设置时间选择为年月日 去掉时分秒选择
                todayBtn: true, //如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。如果是true的话，"Today" 按钮仅仅将视图转到当天的日期，如果是"linked"，当天日期将会被选择
                autoclose: true, //当选择一个日期之后是否立即关闭此日期时间选择器。
                keyboardNavigation: true, //是否允许通过方向键改变日期。
                forceParse: true, //当选择器关闭的时候，是否强制解析输入框中的值。
                todayHighlight: 1  //如果为true, 高亮当前日期
            }).on("click", function () {
                //設置可选的最后日期為當前日期
                $("#input_date").datetimepicker("setEndDate", getToday())
            });
        });

        //獲取當前日期
        function getToday(){
            var today = new Date()
            var year = today.getFullYear();
            var month = today.getMonth() + 1;
            var day = today.getDate();
            var todayStr = year+"-"+month+"-"+day;
            return todayStr;
        }
    </script>
</head>
<body>
<form action="managerAddUser" method="post" class="bootstrap-frm">
    用户名：<input type="text" name="userName"><br>
    密码:<input type="text" name="password"><br>
    邮箱：<input type="text" name="email"><br>
    生日：<input type="text" name="birthday"id="input_date"><br>
    性别：<input type="text" name="gender"><br>
    身份：<input type="text" name="authority"><br>
    用户头像： <a href="javascript:;" class="a-upload" style="padding-bottom: 5%;">
    <input type="file" style="margin-left: 4%;margin-top: 3%;" name="img" id="">上传文件
</a><br>
    <br><br>
    <input type="submit" value="提交" class="sub" style="margin-left: 130px;">
</form>



</body>
</html>
