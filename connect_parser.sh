#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

cat > $FILE <<'PY'
from pathlib import Path

from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput

from htmlparser import BridgeParser


PROJECT_DIR = Path("/sdcard/HtmlBridgeProject")
HTML_FILE = PROJECT_DIR / "html/index.html"


class WebView(BoxLayout):

    def __init__(self, source="", **kwargs):

        super().__init__(
            orientation="vertical",
            spacing=20,
            padding=30,
            **kwargs
        )


        print("HTML:", HTML_FILE)


        html = HTML_FILE.read_text(
            encoding="utf-8"
        )


        parser = BridgeParser()

        parser.feed(html)


        for widget in parser.result():

            if widget.__class__.__name__ == "HtmlLabel":

                self.add_widget(
                    Label(
                        text=widget.text,
                        font_size=widget.font_size,
                        size_hint_y=None,
                        height=60
                    )
                )


            elif widget.__class__.__name__ == "HtmlButton":

                self.add_widget(
                    Button(
                        text=widget.text,
                        size_hint_y=None,
                        height=70
                    )
                )


            elif widget.__class__.__name__ == "HtmlTextBox":

                self.add_widget(
                    TextInput(
                        hint_text=widget.hint_text,
                        size_hint_y=None,
                        height=70
                    )
                )


        print("PARSER LOADED")

PY


echo "Parser connected"
