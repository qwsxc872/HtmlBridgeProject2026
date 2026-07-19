#!/data/data/com.termux/files/usr/bin/bash

BASE="/sdcard/HtmlBridgeProject/python"
HTML="/sdcard/HtmlBridgeProject/html"

cat > $BASE/htmlparser.py <<'PY'
from html.parser import HTMLParser

from htmllabel import HtmlLabel
from htmlbutton import HtmlButton
from htmltextbox import HtmlTextBox


class BridgeParser(HTMLParser):

    def __init__(self):
        super().__init__()

        self.widgets=[]


    def handle_starttag(self,tag,attrs):

        data=dict(attrs)

        if tag=="html-label":

            w=HtmlLabel(
                data.get("id","label"),
                data.get("text",""),
                font_size=int(
                    data.get("font_size",20)
                )
            )

            self.widgets.append(w)


        elif tag=="html-button":

            w=HtmlButton(
                data.get("id","button"),
                data.get("text","Button")
            )

            self.widgets.append(w)


        elif tag=="html-textbox":

            w=HtmlTextBox(
                data.get("id","textbox"),
                hint_text=data.get(
                    "hint_text",
                    ""
                )
            )

            self.widgets.append(w)


    def result(self):

        return self.widgets
PY


cat > $HTML/index.html <<'HTML'
<html>

<head>
<meta charset="utf-8">
<title>HtmlBridge</title>
</head>


<body>


<html-label
 id="title"
 text="HtmlBridge Kivy Label"
 font_size="30">
</html-label>


<html-button
 id="btn"
 text="My Button">
</html-button>


<html-textbox
 id="name"
 hint_text="Enter Name">
</html-textbox>


</body>

</html>
HTML


echo "Parser added"
