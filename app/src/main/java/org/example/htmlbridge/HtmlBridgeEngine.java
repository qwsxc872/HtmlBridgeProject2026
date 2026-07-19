package org.example.htmlbridge;

import android.app.Activity;
import android.widget.FrameLayout;
import android.view.ViewGroup;

public class HtmlBridgeEngine {

    private Activity activity;

    private BridgeView web;

    public HtmlBridgeEngine(Activity act){

        activity = act;

    }

    public void start(String url){

        activity.runOnUiThread(new Runnable(){

            @Override

            public void run(){

                web = new BridgeView(activity);

                FrameLayout.LayoutParams lp =
                        new FrameLayout.LayoutParams(

                        ViewGroup.LayoutParams.MATCH_PARENT,

                        ViewGroup.LayoutParams.MATCH_PARENT

                );

                activity.addContentView(
                        web,
                        lp
                );

                web.loadUrl(url);

            }

        });

    }

    public BridgeView getView(){

        return web;

    }

}
