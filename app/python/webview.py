
from kivy.uix.widget import Widget
from kivy.clock import Clock

try:
    from jnius import autoclass

    WebViewAndroid = autoclass(
        "android.webkit.WebView"
    )

    Activity = autoclass(
        "org.kivy.android.PythonActivity"
    )

    REAL_ANDROID = True

except Exception as e:

    print("Android WebView unavailable:", e)
    REAL_ANDROID = False



class WebView(Widget):

    def __init__(self, source="", **kwargs):

        super().__init__(**kwargs)

        self.source = source

        Clock.schedule_once(
            self.create_webview,
            0
        )


    def create_webview(self, dt):

        if not REAL_ANDROID:

            print(
                "Running fake mode"
            )

            return


        activity = Activity.mActivity


        self.webview = WebViewAndroid(
            activity
        )


        settings = self.webview.getSettings()

        settings.setJavaScriptEnabled(
            True
        )


        self.webview.loadUrl(
            "file:///android_asset/"
            + self.source
        )


        activity.setContentView(
            self.webview
        )


    def evaluate_javascript(self, code):

        if hasattr(self, "webview"):

            self.webview.evaluateJavascript(
                code,
                None
            )

        else:

            print(
                "WebView not ready"
            )
