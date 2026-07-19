
from htmlwidget import HtmlWidget


class HtmlLabel(HtmlWidget):

    def set_text(self, value):

        self.text = value

        js = f"""
        document.getElementById('{self.html_id}')
        .innerHTML = `{value}`;
        """

        print(js)

        return js
