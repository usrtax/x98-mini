#!/usr/bin/env coffee

> aqdm:Aqdm
  zx/globals:
  @rmw/thisdir
  utax/walk
  path > join
  ./restore
  aqdm

{default:aqdm} = Aqdm

ROOT = thisdir(import.meta)
cd ROOT

< main = =>
  await $"./conn.sh"
  await $"./init.sh"

  li = []
  for await i from walk join ROOT,'apk'
    if i.endsWith '.apk'
      li.push i

  for i from aqdm li
    await $"adb install #{i}"

  tvlauncher = "com.google.android.tvlauncher"
  #tvlauncher = "com.yxt.mboxlaunchernew"
  await $"adb shell pm uninstall --user 0 #{tvlauncher} || true"
  await restore()
  return

if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
  process.exit()

