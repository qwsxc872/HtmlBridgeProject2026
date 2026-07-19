#!/data/data/com.termux/files/usr/bin/bash

FILE="app/src/main/java/org/example/htmlbridge/BridgeView.java"

python - <<'PY'
from pathlib import Path

p=Path("app/src/main/java/org/example/htmlbridge/BridgeView.java")

s=p.read_text()

s=s.replace(
'''        android.widget.FrameLayout root =
            activity.findViewById(
                android.R.id.content
            );

        root.addView(this);''',
'''        setLayoutParams(
            new android.widget.FrameLayout.LayoutParams(
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT,
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT
            )
        );


        android.widget.FrameLayout root =
            activity.findViewById(
                android.R.id.content
            );

        root.addView(this);'''
)

# حذف LayoutParams تکراری پایین
old='''        setLayoutParams(
            new android.widget.FrameLayout.LayoutParams(
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT,
                android.widget.FrameLayout.LayoutParams.MATCH_PARENT
            )
        );


'''
# فقط اولین را نگه می داریم
first=s.find(old)
second=s.find(old, first+1)

if second!=-1:
    s=s[:second]+s[second+len(old):]

p.write_text(s)

print("order fixed")
PY

