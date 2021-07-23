#

## 方案二（永久性，重启也不失效）

添加 /etc/X11/xorg.conf 文件，将此模式保存为默认分辨率。
$ sudo vim /etc/X11/xorg.conf
（如果没有安装vim，可以使用“sudo gedit /etc/X11/xorg.conf”）
粘贴以下内容：
Section "Monitor"
Identifier "Configured Monitor"
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
Option "PreferredMode" "1920x1080_60.00"
EndSection
Section "Screen"
Identifier "Default Screen"
Monitor "Configured Monitor"
Device "Configured Video Device"
EndSection
Section "Device"
Identifier "Configured Video Device"
EndSection
保存。重启后就变成1920x1080了。
ps：我的系统是16.04的，默认没有xorg.conf文件。但是没关系，将上述内容保存为xorg.conf文件就行了。
 
如果只做了第一步，重启之后可能会出现类似下面的错误：
Ubuntu 无法应用原保存的显示器配置
所选模式均不匹配可能的模式：
为 CRTC 63 尝试模式
CRTC 63：尝试 800x600@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 2560x1600@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1920x1440@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1856x1392@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1792x1344@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1920x1200@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1600x1200@60Hz 模式输出在 1366x768@60Hz (通过 0)
CRTC 63：尝试 1680x1050@60Hz 模式输出在 1366x768@6

解决方法：删除/home/用户名/.config/monitors.xml，重启电脑即可。

方法 三

cvt 1920 1080
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode HDMI1  "1920x1080_60.00"
如果需要永久保存配置，可以通过更改/etc/X11/xorg.conf或者/etc/X11/xorg.conf.d/****进行保存。

# 调整亮度
xrandr --output LVDS --brightness 0.5  


添加到~/.xprofile文件重启尝试 无效
添加到~/.profile  无效
添加到/etc/profile 有效


# 尝试xorg 看看是否可以i解决此问题

# 放大倍数
xrandr --output eDP --scale 1.25x1.25

# 两倍设置     arandr
xrandr --output eDP1 --scale 2x2 --mode 1920x1080 --pos 0x0 --output DP2  --mode 3840x2160 --pos 3840x0 --primary

https://blog.csdn.net/xbrother123/article/details/52303281
https://wiki.archlinux.org
# 查看系统信息
inxi -Fx



# 不要装成 deepin-wine-tim 了，那个不能用
yay -S deepin.com.qq.office
# 修复 TIM 字体发虚
yay -S lib32-freetype2-infinality-ultimate
# Wine HiDPI 缩放
env WINEPREFIX="$HOME/.deepinwine/Deepin-TIM" winecfg


# 这个博客讲了很多值得多看看
# https://printempw.github.io/setting-up-manjaro-linux/
# 不要装成 deepin-wine-tim 了，那个不能用
yay -S deepin.com.qq.office
# 修复 TIM 字体发虚
yay -S lib32-freetype2-infinality-ultimate
# Wine HiDPI 缩放
env WINEPREFIX="$HOME/.deepinwine/Deepin-TIM" deepin-wine winecfg

https://www.limstash.com/articles/202004/1591   # arch linux 安装QQ wechat

# 启动win下的程序  安装要运行setup.exe 即可
export WINEARCH=win32  WINEPREFIX="$HOME/.deepinwine/Nethack"
cd ~/Downloads/cnethack 
wine 启动游戏.exe

# 增加xrandr /etc/profile.d/HDMI1.sh

# 问题：
- 搜狗输入法不能贴靠屏幕边缘？
- vscode 每次启动屏幕都会被改为1024x768
- 结果发现/etc/profile 文件里增加了 xrandr -s 3, 去掉以后可以了

