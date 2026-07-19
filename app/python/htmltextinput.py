from htmlwidget import HtmlWidget

class HtmlTextInput(HtmlWidget):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.tag = "input"
