#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/html/bridge.js"

cat > "$FILE" <<'JS'
window.HtmlBridge = {

    setText:function(id,text){

        let el=document.getElementById(id);

        if(el){

            el.innerText=text;

        }


        if(window.pythonBridge){

            pythonBridge.setText(
                id,
                text
            );

        }

    },


    buttonClick:function(id){

        if(window.pythonBridge){

            pythonBridge.event(
                id,
                "click"
            );

        }

    },


    getValue:function(id){

        let el=document.getElementById(id);

        if(el){

            return el.value;

        }

        return "";

    }

};
JS


echo "bridge.js updated"

