# archlinux 相关配置

## U盘引导后

```sh
# 终端模式设置大字体
> setfont /usr/share/kbd/consolefonts/LatArCyrHeb-14.psfu.gz

# 更改键盘布局
> locadkeys colemark

# 更改大写和esc键盘，编辑文件
> vim keys.conf
keycode 1 = Caps_Lock
keycode 58 = Escape

# 更改键位命令
> loadkeys keys.conf 
```

## 简单vimrc

```sh
> vim ~/.vimrc
syntax on
noremap K 5k
noremap J 5j
noremap S :w<CR>
noremap Q :q<CR>
```

## Search link

```sh
# 查看连接
> ip link

# 启动网卡
> ip link set wlan0 up

# 查看都有什么wifi
> iwlist wlan0 scan | grep ESSID

# 生成连接互联网账户名密码
> wpa_passphrase 网络 密码 > 文件名
> wpa_passphrase Swift 1111aaaa > internet.conf
> wpa_supplicant  -c internet.conf  -i wlp2s0 &
> ping www.baidu.com
> dhcpcd& # 动态分配一个IP地址
> ping www.baidu.com
```

## 同步系统时间

```sh
> timedatectl  set-ntp  true
```

## 分区

```sh
> fdisk -l

> fdisk /dev/sda
m - help
p - print
g - 创建新分区清理掉原有分区表
p - print 打印新列表
w - 写入分区表

# 创建支持UEFI
n - 创建新分区
    - Partition number(1 - 128 ):1
    - First sector (): <CRj>
    - Last ...: +512M 
    - Y/N: Y
n - swap 分区休眠分区
    - P.....: 3
    - First ...: <CR>
    - Last ....: 1G
    - Y/N: Y
n - Master分区(剩余分区分给主分区) 
    - P...: 2
    - First ...: <CR>
    - Last ...:  <CR>
    - Y/N: Y
p 确认分区
w 写入分区

# 修改分区格式
> mkfs.fat -F32 /dev/sda1
> mkfs.ext4 /dev/sda2
> mkswap /dev/sda3
> swapon /dev/sda3
# 注：这里的顺序是1、引导分区，2、交换分区，3主分区
```

| BIOS 支持MBR          |           |             |                         |
| --------------------- | --------- | ----------- | ----------------------- |
| /mnt                  | /dev/sdX1 | Linux       | Remainder of the device |
| [SWAP]                | /dev/sdX2 | Linux swarp | More than 512 MiB       |
| **UEFI with GPT**     |           |             |                         |
| /mnt/boot or /mnt/efi | /dev/sdX1 | EFI system  | 260-512 MiB             |
| /mnt                  | /dev/sdX2 | Linux       | Remainder of the device |
| [SWAP]                | /dev/sdX3 | Linux swarp | More than 512 MiB       |

## Archlinux 安装

```sh
> vim /etc/pacman.conf
# 去掉注释#Color开启颜色提示

> vim /etc/pacman.d/mirrorlist
```

## 听课到时间

听课时间：[26:38]
 [听课地址](https://www.bilibili.com/video/BV11J411a7Tp)
