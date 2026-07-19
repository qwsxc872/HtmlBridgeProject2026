#!/data/data/com.termux/files/usr/bin/bash

FILE=".github/workflows/android.yml"

python - <<'PY'
from pathlib import Path

p = Path(".github/workflows/android.yml")

s = p.read_text()

block = """
      - name: Install Android Build Tools
        run: |
          sdkmanager "platform-tools" "platforms;android-34" "build-tools;35.0.0"

"""

marker = "      - name: Build APK\n"

if "Install Android Build Tools" not in s:
    s = s.replace(marker, block + marker)
    print("SDK Build Tools added")
else:
    print("Already exists")

p.write_text(s)
PY

