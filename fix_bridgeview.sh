#!/data/data/com.termux/files/usr/bin/bash

FILE="app/src/main/java/org/example/htmlbridge/BridgeView.java"

cat > "$FILE" <<'JAVA'
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
            new PythonBridge(null),
            "pythonBridge"
        );


    }


}
JAVA


echo "BridgeView fixed"

