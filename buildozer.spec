[app]

title = HtmlBridge

package.name = htmlbridge

package.domain = org.test

source.dir = .

source.include_exts = py,kv,html,js,css

source.include_patterns = app/html/*

version = 0.1

requirements = python3,kivy

orientation = portrait

fullscreen = 0


# Android

android.api = 34

android.minapi = 24

android.archs = arm64-v8a, armeabi-v7a

android.permissions = INTERNET

android.enable_androidx = True

android.add_src = app/src/main/java

android.allow_backup = True


# جلوگیری از مشکلات Gradle

android.gradle_dependencies = androidx.appcompat:appcompat:1.6.1


[buildozer]

log_level = 2

warn_on_root = 0
