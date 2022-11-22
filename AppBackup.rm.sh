#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

adb shell 'rm -rf /storage/emulated/0/AppBackup'
