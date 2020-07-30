#!/bin/bash

# sudo ln -s /home/caler/wk/nvim/manjaro_config/hdmi1.sh    /etc/profile.d/

cvt 3840 2160
xrandr --newmode "3840x2160_30.00"  712.75  3840 4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
xrandr --addmode HDMI1  "3840x2160_30.00"
xrandr --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
