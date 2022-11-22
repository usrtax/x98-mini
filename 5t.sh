#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

./conn.sh
adb push init/5t.rc /etc/init
adb reboot
