package org.example.htmlbridge;

import android.app.Activity;
import android.webkit.WebSettings;
import android.webkit.WebView;

public class BridgeView extends WebView {

    public BridgeView(Activity activity) {

        super(activity);

        WebSettings s = getSettings();

        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        s.setAllowFileAccess(true);
        s.setAllowContentAccess(true);

        addJavascriptInterface(
            new BridgeInterface(),
            "PythonBridge"
        );

    }

}
