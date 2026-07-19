#!/data/data/com.termux/files/usr/bin/bash

FILE="app/src/main/java/org/example/htmlbridge/BridgeView.java"

python - <<'PY'
from pathlib import Path

p=Path("app/src/main/java/org/example/htmlbridge/BridgeView.java")

s=p.read_text()

if "setLayoutParams" not in s:

    s=s.replace(
        "addJavascriptInterface(",
        """
        setLayoutParams(
            new android.widget.FrameLayout.LayoutParams(
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT,
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT
            )
        );


        addJavascriptInterface("""
    )

p.write_text(s)

print("layout added")
PY

