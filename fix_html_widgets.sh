#!/data/data/com.termux/files/usr/bin/bash

HTML="/sdcard/HtmlBridgeProject/html/index.html"

cat > "$HTML" <<'HTML'
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<meta name="viewport"
content="width=device-width,initial-scale=1">

<style>

body{
    background:#202020;
    color:white;
    direction:rtl;
    text-align:center;
    font-family:sans-serif;
    padding:40px;
}


html-label{
    display:block;
    font-size:30px;
    margin:20px;
}


html-button{
    display:block;
    background:#1976d2;
    color:white;
    padding:15px;
    margin:20px auto;
    width:220px;
    border-radius:10px;
    font-size:22px;
}


html-textbox{
    display:block;
    margin:20px auto;
}


input{
    width:80%;
    padding:15px;
    font-size:22px;
    direction:rtl;
}


</style>

</head>


<body>


<html-label id="title">
سلام HtmlBridge
</html-label>


<html-textbox id="name">
<input placeholder="نام خود را وارد کنید">
</html-textbox>


<html-button id="btn">
تست دکمه
</html-button>


<p id="result">
منتظر ورودی...
</p>



<script src="bridge.js"></script>


<script>

document
.getElementById("btn")
.onclick=function(){

document
.getElementById("result")
.innerHTML="Button OK";

}


</script>


</body>

</html>
HTML


echo "HTML widgets fixed"

