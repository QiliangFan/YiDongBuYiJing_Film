<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script language="JavaScript">
        $(function () {
            $("#test").click(function () {

                $.ajax({
                    url:"/Movies/searchMovie",                             <%--调用方法 --%>
                    data:{
                        currentPage:1,
                        pageSize:10,
                        selectType:"All",
                        orderBy:"ASC",
                        sortType:"Time"
                    },                      <%-- --%>
                    type:"post",                               <%-- 请求方式--%>
                    success:function (data) {                         <%-- 回调函数--%>
                        //服务器端相应的json数据
                        if(data.code == 0)
                        {

                        }
                        else
                        {
                            //查询失败
                            alert("查询失败");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<h2>Hello World!</h2>

<button id="test">点我</button>
</body>
</html>
