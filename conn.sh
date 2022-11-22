#!/usr/bin/env bash

#adb connect tv
adb root
adb remount
# 有时候需要第二次remount才能成功
adb remount
