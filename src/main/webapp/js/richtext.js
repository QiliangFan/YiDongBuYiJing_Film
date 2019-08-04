var fontArr=[
    "Brush Script MT, Brush Script Std, cursive",
    "sans-serif",
    "Comic Sans MS, Comic Sans, cursive",
    "serif",
];
var font_cur=0;
var colorArr=[
    "AliceBlue",
    "AntiqueWhite",
    "Aqua",
    "Aquamarine",
    "Black",
    "BlueViolet",
    "BurlyWood",
    "Chocolate",
    "Coral",
    "Darkorange",
    "DarkTurquoise"
];
var color_cur=0;
var fontSizeArr=[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7"
];
var fontSize_cur=0;

$(function () {
    moveColors();
    $("#about").on("click",function () {
        var alert=window.alert;
        window.alert=about;
        window.alert();
        window.alert=alert;
    })

    $("#more").on("click",function () {
        var alert=window.alert;
        window.alert=more;
        window.alert();
        window.alert=alert;
    })
    $("span.myspan").hide();
    $("div.leftBar").on("mouseenter",function () {
        clt=setTimeout(function () {
            $("span.myspan").fadeIn(300);
            $("img.displaynone").fadeIn(300);
        },200)
        $("span.myspan").css("font-size","1.8vw");
        $("span.myspan").css("transition","font-size 0.5s");
    });
    $("div.leftBar").on("mouseleave",function () {
        $("span.myspan").fadeOut(300);
        $("img.displaynone").fadeOut(300)
        clearTimeout(clt);
    })


})

function exec(command,value=null) {
    document.execCommand(command,false,value);
}


function bold(){
    let selection=window.getSelection();
    if(selection){
        exec("bold");
    }
}

function italic() {
    let selection=window.getSelection();
    if(selection){
        exec("italic");
    }
}

function underline() {
    let selection=window.getSelection();
    if(selection){
        exec("underline");
    }
}

function alignLeft() {
    let selection=window.getSelection();
    if(selection){
        exec("justifyLeft");
    }
}

function alignRight(){
    let selection=window.getSelection();
    if(selection){
        exec("justifyRight");
    }
}

function alignMiddle() {
    let selection=window.getSelection();
    if(selection){
        exec("justifyCenter");
    }
}
function justifyFull() {
    let selection=window.getSelection();
    if(selection){
        exec("justifyFull");
    }
}

function orderedList(){
    let selection=window.getSelection();
    if(selection){
        exec("insertOrderedList");
    }
}

function unorderedList() {
    let selection=window.getSelection();
    if(selection){
        exec("insertUnorderedList");
    }
}

function font() {
    let selection=window.getSelection();
    if(selection){
        exec("fontName",fontArr[(font_cur++)%3]);
    }
}

function fontColor() {
    let selection=window.getSelection();
    if(selection){
        exec("foreColor",colorArr[(color_cur++)%(colorArr.length-1)]);
        $("a[title='font color']").css("background",colorArr[(color_cur-1)%(colorArr.length-1)]);
    }
}

function insertImage() {
    let selection=window.getSelection();
    var url=prompt("请输入图片的URL地址。");
    if(selection){
        exec('insertImage',url)
    }
}

function clearSelected() {
    let selection=window.getSelection();
    if(selection){
        exec('delete');
    }
}

function addfile() {
    alert("对不起，纯前端用不了ajax不知道怎么从url中读取文件或页面内容，暂未实现");
    var selction=window.getSelection();
    if(selction){

    }
}

function addVideo() {
    alert("功能暂未实现");
}

function insertHTML(){
    var myurl=prompt("请输入你的URL")
    var selection=window.getSelection();
    if(selection){
        exec("insertHTML","<a href='"+myurl+"'>"+myurl+"</a>");
    }
}
function insertTable() {
    alert("作者还在想怎么实现动态添加不同行不同列的可编辑table");
}

function fontSizeDown() {
    var selection=window.getSelection();
    if(selection){
        
        exec("fontSize",fontSizeArr[(fontSize_cur--)%6]);
    }
}

function fontSizeUp() {
    var selection=window.getSelection();
    if(selection){
        if(fontSize_cur<0) fontSize_cur+=6;
        exec("fontSize",fontSizeArr[(fontSize_cur++)%6]);
    }
}

function removeStyle() {
    var selection=window.getSelection();
    if(selection){
        exec("removeFormat");
    }
}

var sign=1;
function code(){
    if(sign===1) {
        $("div#richtext").text($("div#richtext").html());
        sign=0;
    }else{
        $("div#richtext").html($("div#richtext").text());
        sign=1;
    }
}

function myprint() {
    var dom=document.getElementById("richtext");
    var win=window.open("");
    win.document.write(dom.outerHTML);
    win.print();
    win.close();
}

var text="";
function paste() {
        exec("insertHTML",text);
}

function copy() {
    var selection=window.getSelection();
    text=selection.toString();
    if(selection){
        exec("copy")
    }
}

function about(data) {
    $div=$("<div></div>");
    $p=$("<p></p>");
    $text=$(document.createTextNode("侬想知道啥子嘛？"));
    $div.css("position","absolute");
    $div.addClass("myalert");
    $p.addClass("myp")
    $div.css("padding","0")
    $div.css("width","60vw");
    $div.css("height","80vh");
    $div.css("margin","auto");
    $div.css("left","23vw");
    $div.css("top","10vh");
    $div.css("z-index",55);
    $div.css("background","url('./img/bear.gif') no-repeat");
    $div.css("background-size","cover");
    $div.append($p);
    $p.append($text);
    console.log($p.text())
    $div.show()
    $("div.container-fluid").append($div)
    $div.on("click",function () {
        setTimeout("$div.fadeOut(400);",500);
            $div.animate({right:"80px"},500);
    })
    console.log()
}

function more(data) {
    $div1=$("<div></div>");
    $p1=$("<p></p>");
    $text1=$(document.createTextNode("侬又想知道啥子嘛？"));
    $div1.css("position","absolute");
    $div1.addClass("myalert1");
    $p1.addClass("myp1")
    $div1.css("padding","0")
    $div1.css("width","60vw");
    $div1.css("height","80vh");
    $div1.css("margin","auto");
    $div1.css("left","23vw");
    $div1.css("top","10vh");
    $div1.css("z-index",55);
    $div1.css("background","url('./img/more.gif') no-repeat");
    $div1.css("background-size","cover");
    $div1.append($p1);
    $p1.append($text1);
    console.log($p1.text())
    $div1.show()
    $("div.container-fluid").append($div1)
    $div1.on("click",function () {
        setTimeout("$div1.fadeOut(400);",500);
        $div1.animate({right:"80px"},500);
    })
    console.log()
}

var colors=[
    "#ff787b",
    "#119aff",
    "#4c13ff",
    "#ff0ccf",
    "#16ffc4",
    "#3dff18",
    "#fff415",
    "#fffafe",
    "#040104",
    "#ff000a",
    "#11b1d9",
    "#bdf21d",
    "#f2af1d",
    "#dc1181",

];

function moveColors() {
    for(var i=1;i<=7;i++){
        $("#t"+i).css("top",i*12.5+"vh");
    }
    setInterval(function () {
        for(var i=1;i<=7;i++){
            $("#t"+i).css("background-color",colors[Math.floor(Math.random()*100)%(colors.length)]);
        }
    },1000+Math.floor(Math.random()*100)-50);
}



