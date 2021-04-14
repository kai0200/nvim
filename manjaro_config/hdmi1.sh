#!/bin/bash

# sudo ln -s /home/caler/wk/nvim/manjaro_config/hdmi1.sh    /etc/profile.d/
xrandr --newmode "3840x2160_30.00"  712.75  3840 4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
xrandr --addmode HDMI1 3840x2160_30.00
xrandr --output HDMI1 --mode 3840x2160_30.00
xrandr --dpi 120 --output HDMI1 -s  3840x2160

#cvt 3840 2160
#xrandr --newmode "3840x2160_30.00"  712.75  3840 4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
#xrandr --addmode HDMI1  "3840x2160_30.00"
#xrandr --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off

#xrandr --output eDP1 --mode 1366x768 --scale 2x2 --pos 0x1392 --rotate normal --output DP1 --off --output HDMI1 --primary --mode 3840x2160 --scale 1x1 --pos 1366x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off

# run arandr 
#xrandr --output eDP1 --mode 1366x768 --scale 2x2 --pos 0x1392 --rotate normal --output DP1 --off --output HDMI1 --primary --mode 3840x2160 --scale 1x1 --pos 2732x768 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
