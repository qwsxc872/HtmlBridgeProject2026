#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

python - <<'PY'
from pathlib import Path

p=Path("/sdcard/HtmlBridgeProject/python/webview.py")

s=p.read_text()

s=s.replace(
"from kivy.uix.floatlayout import FloatLayout",
"from kivy.uix.floatlayout import FloatLayout\nfrom kivy.core.window import Window"
)

start=s.find("root = FloatLayout()")

end=s.find("self.add_widget(root)", start)

if start!=-1 and end!=-1:

    block=s[start:end]

    new='''root = FloatLayout(
                size=Window.size
            )

            box = BoxLayout(
                orientation="vertical",
                size_hint=(None,None),
                size=(400,150),
                pos=(
                    Window.width/2-200,
                    Window.height/2-75
                )
            )

            box.add_widget(
                Label(
                    text=
                    "HtmlBridge Preview\\\\n\\\\n"
                    "Android WebView will run in APK",
                    font_size=25
                )
            )

            root.add_widget(box)

            '''

    s=s[:start]+new+s[end:]

p.write_text(s)

print("fixed center")
PY

