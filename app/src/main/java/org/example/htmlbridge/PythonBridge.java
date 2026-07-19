package org.example.htmlbridge;

import android.webkit.JavascriptInterface;

public class PythonBridge {

    @JavascriptInterface
    public void buttonClicked(String text) {
        System.out.println("HTML Button Clicked: " + text);
    }
}
