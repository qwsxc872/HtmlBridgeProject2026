#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

python - <<'PY'
from pathlib import Path

p = Path("/sdcard/HtmlBridgeProject/python/webview.py")

s = p.read_text()

s = s.replace(
'''box = BoxLayout(
                orientation="vertical"
            )''',
'''from kivy.uix.anchorlayout import AnchorLayout

            root = AnchorLayout()

            box = BoxLayout(
                orientation="vertical",
                size_hint=(None, None),
                size=(500, 200)
            )'''
)

s = s.replace(
'''self.add_widget(box)''',
'''root.add_widget(box)

            self.add_widget(root)'''
)

p.write_text(s)

print("Centered")
PY

echo "Preview centered"

