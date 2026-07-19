
from kivy.properties import ColorProperty
from htmlwidget import HtmlWidget

class HtmlButton(HtmlWidget):

    background_color = ColorProperty((1,1,1,1))

    def on_text(self,*args):
        self.sync()

    def on_background_color(self,*args):
        self.sync()
