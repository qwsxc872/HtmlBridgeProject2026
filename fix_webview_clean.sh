#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/python/webview.py"

cat > "$FILE" <<'PY'
from kivy.uix.widget import Widget


class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        print("HTML WEBVIEW MODE")

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

            print("REAL HTML WEBVIEW")

        except Exception as e:

            print(
                "WEBVIEW ERROR:",
                e
            )

PY

echo "webview cleaned"

