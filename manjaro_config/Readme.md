# 安装qq



# 修复中文显示问题
ln -s ~/wk/nvim/manjaro_config/fontconfig  ~/.config/



# 微信 问题  

- 安装

yay -S deepin-wine-wechat
yay -S deepin-wine-tim

- 卸载
sudo pacman -Rs  deepin-wine-wechat

- 微信字体问题
-

# HiDPI 高分辨率问题

先设置显示器
ln -s ~/wk/nvim/manjaro_config/hdmi1.sh 

修改此文件
~/.Xresources
```
Xft.dpi:165

```
测试显示正常


https://wiki.archlinux.org/index.php/HiDPI_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
https://ywnz.com/linuxjc/4765.html

$ xdpyinfo | grep -B 2 resolution

screen #0:
  dimensions:    3840x2160 pixels (1016x571 millimeters)
  resolution:    96x96 dots per inch

~ ❯❯❯ xrdb  ~/.Xresources                                                   
~/.Xresources
    1 | Xft.dpi:165
      |  ^~~
~ ❯❯❯ xrdb  ~/.Xresources                                                   
~ ❯❯❯ xrdb -merge  ~/.Xresources                                            
~ ❯❯❯ xrdb  -query   all                                                    
Xft.dpi:	165

# QQ  增加xsetingsd 修改/opt/deepinwine/tools/run.sh 文件
这里的让tim在高分屏大小合适的解决方案在我这体验完美! 而正如上面的兄弟说的xsetingsd比gsd-xsettings好很多, 使用方法也可以像这样改良. 只对wine进行设置应当是对其他应用干扰最小的方式了. 总结下来在arch系kde高分屏安装tim流程如下:

yay -S deepin.com.qq.office
yay -S xsettingsd
在wine的Grapics中修改dpi为210
env WINEPREFIX=$HOME/.deepinwine/Deepin-TIM deepin-wine winecfg
设置启动tim前启动xsetingsd. 修改 /opt/deepinwine/tools/run.sh:
 RunApp()
 {
+    if [[ -z "$(ps -e | grep -o xsettingsd)" ]]
+    then
+        /usr/bin/xsettingsd &
+    fi
        if [ -d "$WINEPREFIX" ]; then
                UpdateApp
        else
修一修不能输入中文等小毛病

https://www.jianshu.com/p/38ba1a2fd638  # tim 启动缺少txplatform.exe  这个是在wine 配置里enable 就可以了
缺少ncurses 报错添加一下就可以了
yay -S ncurses5-compat-libs

# 修改tim 悬浮问题
i3/config 配置文件增加
```
for_window [instance="(?i)TIM.exe"] floating enable
for_window [instance="(?i)TIM.exe"] border none

```
# 虚机问题

