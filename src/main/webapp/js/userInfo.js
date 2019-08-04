var userName = "";
var password = "";
var eamil = "";
var birthday = "";
var gender = "";
var authority = "";
var image = "";
var user_prefer = 0;
var clock_interval =0;

var allMovieType = [
    "剧情",
    "喜剧",
    "动作",
    "爱情",
    "惊悚",
    "科幻",
    "动画"
];
var choose = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
]

var cur_page = 1;
var offset = 0;
var limit = 10;
var reply = []
var pageMax = 0;
//
//
function errorImg(imgSrc) {
    imgSrc.src = "/Movies/img/liangUser.png";
}

window.onload = function () {
    getData();
    handleLeftBar();
    personalInfo();
    getPrefer();
    $("button[value='1']").on("click", function () {
        if ($("button[value='1']").hasClass("active")) {
            choose[0] = 0;
            $("button[value='1']").removeClass("active");
        } else {
            choose[0] = 1;
            $("button[value='1']").addClass("active");
        }
    });
    $("button[value='2']").on("click", function () {
        if ($("button[value='2']").hasClass("active")) {
            choose[1] = 0;
            $("button[value='2']").removeClass("active");
        } else {
            choose[1] = 1;
            $("button[value='2']").addClass("active");
        }
    });
    $("button[value='3']").on("click", function () {
        if ($("button[value='3']").hasClass("active")) {
            choose[2] = 0;
            $("button[value='3']").removeClass("active");
        } else {
            choose[2] = 1;
            $("button[value='3']").addClass("active");
        }
    });
    $("button[value='4']").on("click", function () {
        if ($("button[value='4']").hasClass("active")) {
            choose[3] = 0;
            $("button[value='4']").removeClass("active");
        } else {
            choose[3] = 1;
            $("button[value='4']").addClass("active");
        }
    });
    $("button[value='5']").on("click", function () {
        if ($("button[value='5']").hasClass("active")) {
            choose[4] = 0;
            $("button[value='5']").removeClass("active");
        } else {
            choose[4] = 1;
            $("button[value='5']").addClass("active");
        }
    });
    $("button[value='6']").on("click", function () {
        if ($("button[value='6']").hasClass("active")) {
            choose[5] = 0;
            $("button[value='6']").removeClass("active");
        } else {
            choose[5] = 1;
            $("button[value='6']").addClass("active");
        }
    });
    $("button[value='7']").on("click", function () {
        if ($("button[value='7']").hasClass("active")) {
            choose[6] = 0;
            $("button[value='7']").removeClass("active");
        } else {
            choose[6] = 1;
            $("button[value='7']").addClass("active");
        }
    });

    $("tr:odd").css("background-color","#ffe8c4");
    $("tr:even").css("background-color","rgba(231,215,52,0.38)");
};

function getPrefer() {
    $.ajax({
        url: "getPrefer",
        type: "POST",
        dataType: "json",
        async: true,
        contentType:"application/json;charset=UTF8",
        error: function (data) {
            console.log("failed=>getPrefer")
            console.log(data);
        },
        success: function (data) {
            console.log("success=>getPrefer");
            console.log(data);
            director = data["director"];
            actor = data["actor"];
            movieType = data["movieType"];
            user_prefer = data["id"];
            for (var i = 0; i < allMovieType.length; i++) {
                var reg = new RegExp(allMovieType[i]);
                if (reg.test(movieType)) {
                    choose[i] = 1;
                } else {
                    choose[i] = 0;
                }
            }
            $("#director").val(director);
            $("#actor").val(actor);
            for(var i=0;i<choose.length;i++)
            {
                if(choose[i]==1) {
                    $("button[value='" +( i + 1) + "']").addClass("active");
                }else{
                    $("button[value='" + (i + 1 )+ "']").removeClass("active");
                }

            }
        }
    })
}

setInterval(function () {
    for (var i = 0; i < choose.length; i++) {
        if (choose[i] == 1) {
            $("button[value='" + (i+1) + "']").addClass("active");
        } else {
            $("button[value='" + (i+1) + "']").removeClass("active");
        }
    }
}, 1000);

function handleLeftBar() {
    $(".leftBar a").hide();
    $(".leftBar").on("mouseenter", function () {
        clock = setTimeout(function () {
            $(".leftBar a").fadeIn(500);
        }, 500)
    });
    $(".leftBar").on("mouseleave", function () {
        $(".leftBar a").fadeOut(200);
        clearTimeout(clock)
    })
}

//
//
// function getformData($form) {
//     var unindexed_array = $form.serializeArray();
//     var indexed_array = {};
//     $.map(unindexed_array, function (n, i) {
//         indexed_array[n["name"]] = n["value"];
//     });
//     return indexed_array;
// }

function getData() {
    $.ajax({
        url: "getUserData",
        type: "POST",
        dataType: "json",
        async: true,
        data: "",
        error: function (data) {
            //sessino中无此用户,返回主页
            alert("登录信息已失效,请重新登录!")
            // window.location.href = "/Movies";
            console.log("failed!=>getData")
            console.log(data);
        },
        success: function (data) {
            userName = data["userName"];
            email = data["email"];
            birthday = data["birthday"];
            gender = data["gender"];
            image = data["image"];
            authority = data["authority"];
            $("#username").html($("#username").html() + userName);
            $("#email").html($("#email").html() + email);
            $("input[type='date']").val(birthday);
            if (gender == "女") {
                $("input[type='radio'][value='男']").attr("checked", "checked");
            } else {
                $("input[type='radio'][value='女']").attr("checked", "checked");
            }
            $("#hideId").val(data["id"]);
            $("#hideEmail").val(data["email"]);
            $("#hideUserName").val(data["userName"]);
            $("#hideAuthority").val(data["authority"]);
            $("#password").val(data["password"]);
            $("#confirmpassword").val(data["password"]);
            if (image && image.length > 0)
                $("#headImage").attr("src", image);
            console.log("success=>getData");
            console.log(data);
        }

    })
}

function personalInfo() {
    clearInterval(clock_interval)
    $("#personalInfo").show();
    $("#myHoby").hide();
    $("#myReply").hide();
    $("#myHistory").hide();
    $("#myComments").hide();
}

function myHoby() {
    clock_interval = setInterval(function () {
        var to_director = $("input[name='director']").val();
        var to_actor = $("input[name='actor']").val();
        var str ="";
        for(var i=0;i<choose.length;i++){
            if(choose[i]==1){
                str+=allMovieType[i];
                str+=" ";
            }
        }
        $.ajax({
            url:"updatePrefer",
            type:"POST",
            dataType:"json",
            data:JSON.stringify({"id":user_prefer,"director":to_director,"actor":to_actor,"movieType":str}),
            error:function (data) {
                console.log("failed=>updatePrefer");
                console.log(data);
            },
            success:function (data) {
                getPrefer();
                console.log("success=>updatePrefer");
                console.log(data);
            }
        })
    },3000)
    $("#personalInfo").hide();
    $("#myHoby").show();
    $("#myReply").hide();
    $("#myHistory").hide();
    $("#myComments").hide();
}

function myReply() {
    clearInterval(clock_interval)
    $("#personalInfo").hide();
    $("#myHoby").hide();
    $("#myReply").show();
    $("#myHistory").hide();
    $("#myComments").hide();
}

function myHistory() {
    clearInterval(clock_interval)
    $("#personalInfo").hide();
    $("#myHoby").hide();
    $("#myReply").hide();
    $("#myHistory").show();
    $("#myComments").hide();
}

function myComments() {
    clearInterval(clock_interval)
    $("#personalInfo").hide();
    $("#myHoby").hide();
    $("#myReply").hide();
    $("#myHistory").hide();
    $("#myComments").show();
}

function submitForm() {
    var pwd1=$("input#fpassword").val();
    var pwd2=$("input#fconfirmpassword").val();
    if(pwd1&&pwd1!=""&&pwd2&&pwd2!=""){
        if(pwd1!=pwd2){
            alert("两次密码不一致,请重新输入");
            return false;
        }else{
            alert("修改成功!");
            $("input#password").val(md5(pwd1));
            $("input#confirmpassword").val(md5(pwd2));
            return true;
        }
    }else{
        alert("密码不能为空!");
        return false;
    }
}

// function getReply(offset, limit) {
//     $.ajax({
//         url: "getMyReply",
//         type: "POST",
//         dataType: "json",
//         data: JSON.stringify({"offset": offset, "limit": limit}),
//         error: function (data) {
//             console.log("failed=>getReply");
//             console.log(data);
//
//         },
//         success: function (data) {
//             console.log("success=>getReply");
//             console.log(data);
//             reply = data;
//             pageMax = Math.ceil(reply.length / 5.0);
//         }
//     })
// }
//
// // function pageUp() {
// //     if (cur_page == pageMax) {
// //         cur_page = 1;
// //         getReply(0, 5);
// //     } else {
// //         cur_page += 1;
// //         getReply((cur_page - 1) * 5, 5);
// //     }
// // }
// //
// // function pageDown() {
// //     if (cur_page == 1) {
// //         cur_page = pageMax;
// //         getReply((cur_page - 1) * 5, 5);
// //     } else {
// //         cur_page -= 1;
// //         getReply((cur_page - 1) * 5, 5);
// //     }
// // }
// //
// // function page(nth) {
// //     if (pageMax <= 0) {
// //         return false;
// //     }
// //     if (nth < 0 || nth > pageMax) {
// //         nth = 1;
// //         getReply(0, 5);
// //         cur_page = 1;
// //     }
// //
// // }