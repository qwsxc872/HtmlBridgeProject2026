from kivy.uix.widget import Widget

class HtmlWidget(Widget):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        self.dom_id = ""
        self.tag = "div"

    def set_html(self, html):
        print("set_html:", html)

    def run_js(self, js):
        print("run_js:", js)

    def get_attr(self, name):
        print("get_attr:", name)

    def set_attr(self, name, value):
        print("set_attr:", name, value)
