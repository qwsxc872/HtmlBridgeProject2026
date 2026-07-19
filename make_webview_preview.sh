#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

cat > "$FILE" <<'PY'
from kivy.uix.widget import Widget
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout


class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        try:

            from jnius import autoclass

            Activity = autoclass(
                "org.kivy.android.PythonActivity"
            )

            BridgeView = autoclass(
                "org.example.htmlbridge.BridgeView"
            )

            activity = Activity.mActivity

            self.view = BridgeView(activity)

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


            box = BoxLayout(
                orientation="vertical"
            )


            box.add_widget(
                Label(
                    text=
                    "HtmlBridge Preview\n\n"
                    "Android WebView will run in APK",
                    font_size=25
                )
            )


            self.add_widget(box)
PY


echo "webview.py created"

