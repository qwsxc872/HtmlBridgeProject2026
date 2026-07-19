#!/data/data/com.termux/files/usr/bin/bash

FILE="app/src/main/java/org/example/htmlbridge/PythonBridge.java"

cat > "$FILE" <<'JAVA'
package org.example.htmlbridge;

import android.webkit.JavascriptInterface;


public class PythonBridge {


    public interface Listener {

        void onEvent(
            String id,
            String event
        );

        void onText(
            String id,
            String text
        );

    }


    private Listener listener;


    public PythonBridge(
        Listener listener
    ){

        this.listener = listener;

    }



    @JavascriptInterface
    public void event(
        String id,
        String event
    ){

        System.out.println(
            "EVENT: "
            + id
            + " "
            + event
        );


        if(listener != null){

            listener.onEvent(
                id,
                event
            );

        }

    }



    @JavascriptInterface
    public void setText(
        String id,
        String text
    ){

        System.out.println(
            "TEXT: "
            + id
            + " "
            + text
        );


        if(listener != null){

            listener.onText(
                id,
                text
            );

        }

    }

}
JAVA


echo "PythonBridge updated"

