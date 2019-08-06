function notnull(email){//邮件名空
    var x=document.getElementById(email);
    if(x.value==null || x.value==""){
        alert("Your email cannot be empty")
        return false;
    }
    else return true;
}
function checkemailformat(eamil){
    var x=document.getElementById(eamil);
    var pat=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    var valid=pat.test(x.value);
    if(!valid){
         alert("Your email format is not correct");
        return false;
    }
    else return true;
}
function notnulln(uname){//用户名空
    var x=document.getElementById(uname);
    if(x.value==null || x.value==""){
        alert("Your username cannot be empty")
        return false;
    }
    else return true;
}
function notnullp(pwd){//密码空
    var x=document.getElementById(pwd);
    if(x.value==null || x.value==""){
        alert("Your password cannot be empty")
        return false;
    }
    else {
        if(x.value.length<6){
            alert("Your password is at least 6 bits long");
            return false;
        }else{
            return true;
        }
    }
}
function pwdcheck(pwd,pwdconfirm){//密码不一致
    var x=document.getElementById(pwd);
    var y=document.getElementById(pwdconfirm);
    if(x.value!=y.value){
        alert("The passwords you entered do not match");
        return false;
    }else{
        return true;
    }
}
function birthdaycheck(birthday){//生日空
    var x=document.getElementById(birthday);
    if(x.value==null || x.value==""){
        alert("Your birthday cannot be empty");
        return false;
    }
    else return true;
}
function pincheck(pin){//验证码空
    var x=document.getElementById(pin);
    if(x.value==null || x.value==""){
        alert("Your Verification code cannot be empty")
        return false;
    }
    else{
        return true;
    }
}

function checklogin(email,pwd,pwdconfirm,pin){
    if(notnull(email)){
        if(notnullp(pwd)){
            if(pwdcheck(pwd,pwdconfirm)){
                if(pincheck(pin)){
                    if(checkemailformat(email)){
                        //alert("Successfully");
                        return true;
                    }
                }
            }
        }
    }
}
function checkreg(eamil,uname,pwd,pwdconfirm,birthday,pin){
    if(notnull(eamil)){
        if(notnulln(uname)){
            if(notnullp(pwd)){
                if(pwdcheck(pwd,pwdconfirm)){
                    if(birthdaycheck(birthday)){
                        if(pincheck(pin)){
                            if(checkemailformat(eamil)){
                                //alert("Successfully");
                                return true;
                            }
                        }
                    }
                }
            }
        }
    }
    alert("??")
}
