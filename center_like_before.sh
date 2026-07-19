#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

python - <<'PY'
from pathlib import Path

p = Path("/sdcard/HtmlBridgeProject/python/webview.py")

s = p.read_text()

s = s.replace(
'from kivy.uix.boxlayout import BoxLayout',
'''from kivy.uix.boxlayout import BoxLayout
from kivy.uix.floatlayout import FloatLayout'''
)

old = '''box = BoxLayout(
                orientation="vertical"
            )


            box.add_widget(
                Label(
                    text=
                    "HtmlBridge Preview\\\\n\\\\n"
                    "Android WebView will run in APK",
                    font_size=25
                )
            )


            self.add_widget(box)'''

new = '''root = FloatLayout()

            box = BoxLayout(
                orientation="vertical",
                size_hint=(0.8, 0.3),
                pos_hint={"center_x":0.5, "center_y":0.5}
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

            self.add_widget(root)'''

if old in s:
    s=s.replace(old,new)
else:
    print("old block not found")

p.write_text(s)

print("center fixed")
PY

