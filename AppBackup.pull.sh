#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex
mkdir -p backup
adb pull /sdcard/AppBackup backup/
