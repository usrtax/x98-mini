# x98 mini 备忘

## 空鼠使用

1. 空鼠点击右上角的鼠标按钮可以切换鼠标的开启，关闭鼠标后过一会鼠标就会自动隐藏
1. 空鼠是依靠体感来移动鼠标，长按 OK 可以拖拽滚动屏幕

## 软件说明

1. tvbox /  Pluto-Player 在顶部导航的首页上点击 OK 可以切换展示源
1. 秒看电视、小鲸电视可以看电视台 , 点 ok 可以选台
1. 有时候退出直播软件了还有声音，运行下屏幕上的内存清理即可
1. 悟空输入法扫描二维码可以在手机上输入（手机和盒子要连接同一个 wifi）
1. 点腾讯的 Start 可以云游戏
1. 如果有大容量移动硬盘，可以外挂并开启 FTP（当然需要一些配置）
1. 蘑菇云游戏有不少大作，比如奥日与黑暗森林，赛博朋克 2077， 但是需要手柄和充值
1. 如果有些应用按返回不能回到桌面，那就长按返回 3 秒就可以回到桌面

## 网盘资源

1. 网盘视频可以在这里搜索 https://www.rrdynb.com
1. 百度云盘和阿里云盘都可以直接播放
1. 夸克浏览器是装的手机版，需要配合空鼠才能用而且有点卡，但是可以点底部云文件，可以看夸克网盘视频。百度网盘视频资源经常失效，阿里网盘又太贵（夸克网盘拼
多多一年 6T 才 16 元）。夸克网盘貌似没法滚动（比如生活大爆炸有 12 季，电视一屏只能显示 9 季），可以按修改时间排序、按修改时间正序倒序来看全部内容 (用起
来比较麻烦，有钱还是买阿里网盘配合电视用比较好)

## 高墙之外

1. 翻墙可以在少数派购买 https://reurl.cc/NGAMmq , 购买后选择一键订阅，然后选择复制链接地址
1. 如果想开机后自动启动 clash 翻墙，打开 clash 后，设置-> 应用，打开自动重启 , 它会在重启 1 分钟后自动连上翻墙
1. smarttube 登录 youtbue 需要翻墙，在电脑上输入登录代码后要等十秒钟它会自动跳出，别点确定（否则无法登录）
1. 空鼠使用语音助手的时候需要长按遥控器语音按钮 , 并且翻墙
1. 如果想全家全局翻墙，可以买个红米 ax6000, 参考 [红米 ax6000 刷 openwrt 教程，轻松 1000M 科学外网，比软路由更好 ?](https://www.youtube.com/watch?v=FCv
CTyjoeq4)
1. 可以 kodi 看海外电视台

## 刷入 slimbox ATV

从[这里下载 slimbox ATV 的包](https://disk.yandex.ru/d/rYHc437Q-I_w0g) [说明页面](https://slimboxtv.ru/x98-mini/)

晶晨的芯片刷机都是一样的

安装 3.2 版本的刷机软件 [Amlogic USB Burning Tool v3.2.0.exe](https://wwa.lanzoui.com/iu0Lmwc2x4d)

用棉签棍捅住 x98 mini 的 AV 口 

然后插入连着笔记本双公头的 USB 线（无需连接电源）

等软件出现 Hub 1-9 再松开棉签 (6 秒左右)

然后选择下载的镜像刷机即可

## 获取 root

请在安装应用之前运行，否则会因为 busybox 占用了 su 导致 Magisk 失败

首先

adb connect 机顶盒 IP

然后运行
```
adb root && adb remount && adb reboot 
```

然后运行 Magisk ，按提示再次重启

## 安装应用

可以用本代码仓库的

用 ./init.coffee 安装应用

## 备份恢复

### 备份

./backup.coffee

### 恢复

可以从我的百度网盘 > 备份 > x98mini > 下载 backup 放到当前目录

### kodi

#### 备份

系统上装有 Alpha Backup Pro

点菜单，系统设置，然后点加号可以备份系统设置

tvbox , Kodi 也用 Alpha Backup Pro 备份，tvbox 备份完整数据，kodi 备份外部数据

不要备份全部软件，不然恢复会导致问题

然后用 ./restore.coffee 恢复

#### 恢复

./AppBackup.push.sh

先用 Alpha Backup Pro  -> 左边菜单，系统设置，恢复系统设置

然后点右上角备份

点底部外部数据，选中 Kodi，然后点右上时间箭头图标还原

然后点底部完整数据，选择 tvbox，然后点右上时间箭头图标还原

会请求超级用户授权，确定

恢复后记得删除导入的备份释放磁盘空间

./AppBackup.rm.sh

## adb 连接盒子

adb connect tv && adb root && adb remount && adb shell

## 查看已经安装的应用

adb shell pm list packages

## 查看 cpu

adb shell 'cat /proc/cpuinfo' | grep Processor

## busybox

到 https://busybox.net/downloads/binaries/ 找到对应的 cpu 的二进制

wget https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv8l

## usb 移动硬盘开机挂载

编辑 ./init/5t.rc

其中 /dev/block/sda 是 usb 设备 , kiss-ftpd 是启动 ftp，方便上传电影

可以通过 `ls /dev/block` 加插拔来判断

然后运行 ./5t.sh (会重启机顶盒)

不知道为什么，slimbox atv 上 ftp 传输速度比自带的系统快很多，如下图，普通 5g wifi 可以跑到 12MB
![](https://raw.githubusercontent.com/gcxfd/img/gh-pages/lteZLH.png)

## 列出已经安装的应用

adb shell pm list packages|rg launch

## 连接多个设备后只想连接到单个设备

adb kill-server
adb start-server
