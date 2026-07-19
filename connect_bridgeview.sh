#!/data/data/com.termux/files/usr/bin/bash

FILE="app/src/main/java/org/example/htmlbridge/BridgeView.java"

python - <<'PY'
from pathlib import Path

p=Path("app/src/main/java/org/example/htmlbridge/BridgeView.java")

s=p.read_text()

s=s.replace(
'''        super(activity);''',
'''        super(activity);

        android.widget.FrameLayout root =
            activity.findViewById(
                android.R.id.content
            );

        root.addView(this);'''
)

p.write_text(s)

print("BridgeView attached to Activity")
PY

