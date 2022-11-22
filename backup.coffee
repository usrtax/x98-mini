#!/usr/bin/env coffee

> zx/globals:
  @rmw/thisdir
  path > join
  utax/read
  fs > mkdirSync

ROOT = thisdir(import.meta)
BACKUP = join ROOT,'backup'

for i from ['data','sdcard']
  mkdirSync join(BACKUP,i),{
    recursive:true
  }

backup_txt = read join ROOT,'backup.txt'
for app from backup_txt.split('\n')
  app = app.trim()
  if not app
    continue
  await $"adb pull /data/data/#{app} backup/data || true"
  await $"adb pull /sdcard/Android/data/#{app} backup/sdcard || true"
