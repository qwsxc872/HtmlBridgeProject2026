from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label


class Main(App):

    def build(self):
        root = BoxLayout(orientation="vertical")

        self.lbl = Label(text="مرحله اول آماده است")

        btn = Button(text="مرحله بعد")

        btn.bind(on_press=self.clicked)

        root.add_widget(self.lbl)
        root.add_widget(btn)

        return root

    def clicked(self, *args):
        self.lbl.text = "در مرحله بعد WebView واقعی اضافه می‌شود"


Main().run()
