package org.example.htmlbridge;

import android.webkit.JavascriptInterface;
import android.util.Log;

public class BridgeInterface {

    @JavascriptInterface
    public void post(String msg){

        Log.d("HtmlBridge", msg);

    }

}
