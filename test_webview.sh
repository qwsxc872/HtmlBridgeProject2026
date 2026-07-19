#!/data/data/com.termux/files/usr/bin/bash

echo "Checking HTML"
ls -l /sdcard/HtmlBridgeProject/html/index.html

echo
echo "Checking Java"
ls app/src/main/java/org/example/htmlbridge/

echo
echo "Checking WebView"
grep -R "setJavaScriptEnabled" app/src/main/java/

echo
echo "Checking Bridge"
grep -R "addJavascriptInterface" app/src/main/java/
