from htmlwidget import HtmlWidget

class HtmlLabel(HtmlWidget):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.tag = "label"
