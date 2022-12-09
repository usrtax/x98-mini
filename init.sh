#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

./conn.sh

pushExe() {
  adb push $DIR/bin/$1 /vendor/xbin
  adb shell "chmod 755 /vendor/xbin/$1"
}

pushExe kiss-ftpd
pushExe ftp
pushExe busybox
#pushExe toybox
pushExe rg

adb push init/ftp.rc /etc/init
adb shell '/vendor/xbin/busybox --install /vendor/xbin/'

adb push bg.jpg /storage/emulated/0/Pictures

rmapp() {
  adb uninstall $1 || true
}

rmapp com.droidlogic.miracast
rmapp ru.full.khd.app
rmapp org.mozilla.firefox
rmapp org.courville.nova
rmapp cm.aptoide.pt
rmapp com.ionitech.airscreen
rmapp com.apkpure.aegon
rmapp com.netflix.mediaclient
rmapp com.amazon.avod.thirdpartyclient
rmapp com.google.android.youtube.tv
rmapp com.disney.disneyplus
rmapp com.cetusplay.remoteservice
rmapp com.lonelycatgames.Xplore

ash() {
  adb shell '$@'
}
#wget -c http://landley.net/toybox/bin/toybox-aarch64 -O bin/toybox
ash setprop persist.sys.language zh
ash setprop persist.sys.country CN
ash setprop persist.sys.timezone Asia/Shanghai

#adb shell 'for i in $(toybox); do ln -s toybox /system/bin/$i; done' || true
