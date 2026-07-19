from htmlwidget import HtmlWidget

class HtmlButton(HtmlWidget):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.tag = "button"
