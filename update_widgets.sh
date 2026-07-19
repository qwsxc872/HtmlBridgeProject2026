#!/data/data/com.termux/files/usr/bin/bash

BASE="/sdcard/HtmlBridgeProject/python"
HTML="/sdcard/HtmlBridgeProject/html"

mkdir -p "$BASE"

cat > "$BASE/htmlwidget.py" <<'PY'
from kivy.uix.widget import Widget


class HtmlWidget(Widget):

    def __init__(
        self,
        widget_id,
        text="",
        **kwargs
    ):
        super().__init__(**kwargs)

        self.widget_id = widget_id
        self.text = text


    def set_text(self,text):

        self.text = text

        print(
            "HTML UPDATE:",
            self.widget_id,
            text
        )
PY


cat > "$BASE/htmllabel.py" <<'PY'
from htmlwidget import HtmlWidget


class HtmlLabel(HtmlWidget):

    def __init__(
        self,
        widget_id,
        text="",
        font_size=20,
        color="white",
        **kwargs
    ):

        super().__init__(
            widget_id,
            text,
            **kwargs
        )

        self.font_size = font_size
        self.color = color

        print(
            "LABEL:",
            widget_id,
            text
        )
PY


cat > "$BASE/htmlbutton.py" <<'PY'
from htmlwidget import HtmlWidget


class HtmlButton(HtmlWidget):

    def __init__(
        self,
        widget_id,
        text="Button",
        on_press=None,
        **kwargs
    ):

        super().__init__(
            widget_id,
            text,
            **kwargs
        )

        self.on_press = on_press


    def press(self):

        print(
            "BUTTON PRESS:",
            self.widget_id
        )

        if self.on_press:
            self.on_press()
PY


cat > "$BASE/htmltextbox.py" <<'PY'
from htmlwidget import HtmlWidget


class HtmlTextBox(HtmlWidget):

    def __init__(
        self,
        widget_id,
        text="",
        hint_text="",
        multiline=False,
        password=False,
        **kwargs
    ):

        super().__init__(
            widget_id,
            text,
            **kwargs
        )

        self.hint_text = hint_text
        self.multiline = multiline
        self.password = password


    def input(self,value):

        self.text = value

        print(
            "TEXT CHANGE:",
            value
        )
PY


cat > "$HTML/bridge.js" <<'JS'
window.KivyBridge={

widgets:{},


register:function(id,obj){

    this.widgets[id]=obj;

},


setText:function(id,text){

    if(this.widgets[id]){

        this.widgets[id].innerText=text;

    }


    if(window.pythonBridge){

        pythonBridge.setText(id,text);

    }

},


event:function(id,event){

    if(window.pythonBridge){

        pythonBridge.event(id,event);

    }

}

};
JS


echo "Widgets engine updated"
