import sys
from pathlib import Path

PROJECT = Path("/sdcard/HtmlBridgeProject")
PYTHON = PROJECT / "python"

if str(PYTHON) not in sys.path:
    sys.path.insert(0, str(PYTHON))

from kivy.app import App
from webview import WebView


class Main(App):

    def build(self):
        return WebView(
            source="index.html"
        )


Main().run()
