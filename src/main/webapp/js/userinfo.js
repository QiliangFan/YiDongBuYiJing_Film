$(function () {
    $.ajax({
        url:"UserInfoServlet",
        type:"post",
        dataType:"json",
        data:JSON.stringify({}),
        error:function (data) {
            console.log(data);
        },
        success:function (data) {
            console.log(data);
            var birthday = data.birthday;
            if(data.gender=="1"){
                var gender = "女";
            }else if (data.gender =="0") {
                var gender = "男";
            }else{
                var gender = "未知";
            }
            var username = data.username;
            var email = data.email;
            var authority = data.authority;
            var pwd = data.pwd;
            $("input[name='username']").val(username);
            $("input[name='birthday']").val(birthday);
            $("input[name='gender']").val(gender);
            $("input[name='pwd']").val(pwd);
            $("input[name='email']").val(email);
            $("input[name='authority']").val(authority);
            $("input[name='emailold']").val(email);
        }
    })
})