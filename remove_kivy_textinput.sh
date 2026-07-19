#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

sed -i '/from kivy.uix.textinput import TextInput/d' "$FILE"

sed -i '/TextInput(/,+4d' "$FILE"

echo "Kivy TextInput removed"

