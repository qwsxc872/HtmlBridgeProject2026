
from kivy.uix.widget import Widget
from kivy.properties import (
    StringProperty,
    NumericProperty,
    BooleanProperty
)

class HtmlWidget(Widget):

    html_id = StringProperty("")

    text = StringProperty("")

    disabled = BooleanProperty(False)

    opacity = NumericProperty(1.0)

    def sync(self):
        print("SYNC:", self.__class__.__name__, self.text)
