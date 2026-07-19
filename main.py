
import sys
from pathlib import Path

sys.path.insert(
0,
str(Path(__file__).parent/'app/python')
)


from kivy.app import App
from webview import WebView


class Main(App):

    def build(self):

        return WebView(
            source="html/index.html"
        )


Main().run()
