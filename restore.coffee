#!/usr/bin/env coffee

> zx/globals:
  @rmw/thisdir
  path > join
  utax/read
  fs > readdirSync

ROOT = thisdir(import.meta)
BACKUP = join ROOT,'backup'

< default main = =>
  push = (local, remote)=>
    dir = join BACKUP,local
    for app from readdirSync dir
      await $"adb push #{dir}/#{app} /#{remote}/"
    return

  await push(
    'data'
    'data/data'
  )

  await push(
    'sdcard'
    'sdcard/Android/data'
  )

if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
  process.exit()
