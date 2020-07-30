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

# 虚机问题

