import sys
from pathlib import Path

sys.path.insert(
    0,
    str(Path(__file__).parent / "app/python")
)

from kivy.app import App
from kivy.uix.widget import Widget
from kivy.clock import Clock

from jnius import autoclass


class Root(Widget):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        Clock.schedule_once(self.start_bridge, 0.5)

    def start_bridge(self, dt):

        PythonActivity = autoclass(
            "org.kivy.android.PythonActivity"
        )

        HtmlBridgeEngine = autoclass(
            "org.example.htmlbridge.HtmlBridgeEngine"
        )

        activity = PythonActivity.mActivity

        engine = HtmlBridgeEngine(activity)

        engine.start(
            "file:///android_asset/html/index.html"
        )

        print("Bridge started")


class Main(App):

    def build(self):
        return Root()


Main().run()
