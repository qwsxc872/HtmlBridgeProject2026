#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

cat > "$FILE" <<'PY'
from kivy.uix.widget import Widget
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.core.window import Window


class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        self.size = Window.size

        Window.bind(
            on_resize=self.resize
        )


        try:

            from jnius import autoclass

            Activity = autoclass(
                "org.kivy.android.PythonActivity"
            )

            BridgeView = autoclass(
                "org.example.htmlbridge.BridgeView"
            )

            self.view = BridgeView(
                Activity.mActivity
            )

            self.view.loadUrl(
                "file:///sdcard/HtmlBridgeProject/html/index.html"
            )

            print(
                "REAL ANDROID WEBVIEW"
            )


        except Exception as e:

            print(
                "TERMUX PREVIEW MODE"
            )

            print(e)


            self.box = BoxLayout(
                orientation="vertical",
                size_hint=(None,None),
                size=(500,200)
            )


            self.label = Label(
                text=
                "HtmlBridge Preview\n\n"
                "Android WebView will run in APK",
                font_size=25
            )


            self.box.add_widget(
                self.label
            )

            self.add_widget(
                self.box
            )


            self.center_box()


    def resize(self,window,w,h):

        self.size=(w,h)

        self.center_box()


    def center_box(self):

        if hasattr(self,"box"):

            self.box.pos=(
                (self.width-self.box.width)/2,
                (self.height-self.box.height)/2
            )
PY


echo "preview layout reset"

