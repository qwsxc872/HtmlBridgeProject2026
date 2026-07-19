#!/data/data/com.termux/files/usr/bin/bash

HTML="/sdcard/HtmlBridgeProject/html/index.html"

cat > "$HTML" <<'HTML'
<html>

<head>

<meta charset="utf-8">

<style>

body{

background:#202020;
color:white;

direction:rtl;
text-align:center;

font-family:tahoma;

font-size:30px;

}


input{

width:80%;
height:60px;

font-size:28px;

direction:rtl;

text-align:right;

}


button{

font-size:28px;

padding:15px 40px;

}


</style>

</head>


<body>


<h1>
تست فارسی HtmlBridge
</h1>


<input
id="name"
placeholder="نام خود را وارد کنید">


<br><br>


<button onclick="test()">
تست
</button>


<p id="txt">
آماده
</p>


<script>

function test(){

document.getElementById("txt").innerHTML =
document.getElementById("name").value;

}

</script>


</body>

</html>
HTML


echo "Farsi HTML test installed"

