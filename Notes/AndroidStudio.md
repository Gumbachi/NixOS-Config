# Android Studio

Tweaks to Android Studio to make it work the way I like

## Font Zoom

Settings > Editor > General

* Change font size with mouse wheel = All Editors

## Auto Import

Settings > Editor > General > Auto Import > Scroll to Kotlin

* Add unambiguous imports on the fly = true
* Optimize imports on the fly = true

## Disable Run Window

App Dropdown > Edit Configurations > General Tab (Scroll all the way down)

* Activate tool window = false

## ADB Connection

Enable Wireless Debugging on Phone

Connect with wire: `adb pair ip:port` using the ip:port from the pair with code menu

Connect Wireless: `adb connect ip:port` after pairing with the ip:port from the main menu
