#!/data/data/com.termux/files/usr/bin/bash

FILE="/sdcard/HtmlBridgeProject/html/index.html"

python - <<'PY'
from pathlib import Path

p=Path("/sdcard/HtmlBridgeProject/html/index.html")

s=p.read_text()

s=s.replace(
'''<button onclick="test()">TEST JS</button>''',
'''<button onclick="test()">TEST JS</button>

<button onclick="bridgeTest()">TEST BRIDGE</button>'''
)


s=s.replace(
'''function test(){
    document.getElementById("txt").innerHTML="JavaScript OK";
}''',
'''function test(){
    document.getElementById("txt").innerHTML="JavaScript OK";
}


function bridgeTest(){

    if(window.pythonBridge){

        pythonBridge.event(
            "testButton",
            "click"
        );

        document.getElementById("txt").innerHTML=
        "Bridge Called";

    }else{

        document.getElementById("txt").innerHTML=
        "Bridge Missing";

    }

}'''
)


p.write_text(s)

print("bridge test added")
PY

