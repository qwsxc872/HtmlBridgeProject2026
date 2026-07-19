from kivy.uix.widget import Widget

try:
    from jnius import autoclass

    PythonActivity = autoclass(
        "org.kivy.android.PythonActivity"
    )

    BridgeView = autoclass(
        "org.example.htmlbridge.BridgeView"
    )

    HAVE_ANDROID = True

except Exception as e:

    HAVE_ANDROID = False

    ERROR = e


class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        self.source = source

        if HAVE_ANDROID:

            activity = PythonActivity.mActivity

            self.view = BridgeView(activity)

            self.view.loadUrl(
                "file:///android_asset/html/index.html"
            )

            print("REAL WEBVIEW")

        else:

            print("FAKE WEBVIEW")
            print(ERROR)
