#!/data/data/com.termux/files/usr/bin/bash

cat > .github/workflows/android.yml <<'YAML'
name: Build APK

on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:

  build:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v4


      - uses: actions/setup-python@v5
        with:
          python-version: "3.11"


      - name: Setup Android
        uses: android-actions/setup-android@v3


      - name: Accept Android licenses
        run: |
          yes | sdkmanager --licenses


      - name: Install Buildozer
        run: |
          python -m pip install --upgrade pip
          pip install buildozer==1.5.0 cython==0.29.37


      - name: Build APK
        env:
          BUILDOZER_WARN_ON_ROOT: 0
        run: |
          buildozer android debug


      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: apk
          path: bin/*.apk
YAML


echo "workflow fixed"

