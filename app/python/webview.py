from pathlib import Path
from kivy.uix.widget import Widget
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button


PROJECT_DIR = Path("/sdcard/HtmlBridgeProject")
HTML_FILE = PROJECT_DIR / "html/index.html"


class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        print("HTML:", HTML_FILE)

        layout = BoxLayout(
            orientation="vertical"
        )

        title = Label(
            text="HtmlBridge Engine\n\n"
                 + ("HTML FOUND" if HTML_FILE.exists()
                    else "HTML NOT FOUND"),
            font_size=30
        )

        btn = Button(
            text="Open HTML Test",
            font_size=25
        )

        btn.bind(
            on_press=self.test
        )

        layout.add_widget(title)
        layout.add_widget(btn)

        self.add_widget(layout)


    def test(self, *args):

        print("HTML CONTENT:")
        
        try:
            print(
                HTML_FILE.read_text()
            )
        except Exception as e:
            print(e)
