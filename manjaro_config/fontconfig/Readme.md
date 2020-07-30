# manjaro 显示中文问题修复过程

找了几个帖子装了几个字体，都是win显示问题


测试两个文件生效情况

~/.config/fontconfig/fonts.conf
~/.fonts.conf
```
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
 <match target="font">
  <edit mode="assign" name="rgba">
   <const>none</const>
   <!-- 可选参数 : rgb bgr vrgb vbgr none -->
  </edit>
 </match>
 <match target="font">
  <edit mode="assign" name="hinting">
   <bool>true</bool>
   <!--可选参数 :  true false -->
  </edit>
 </match>
 <match target="font">
  <edit mode="assign" name="hintstyle">
   <const>hintslight</const>
   <!--可选参数 : hintnone hintslight hintmedium hintfull -->
  </edit>
 </match>
 <match target="font">
  <edit mode="assign" name="antialias">
   <bool>true</bool>
   <!--可选参数 :  true false -->
  </edit>
 </match>
 <dir>/usr/share/fonts</dir>
</fontconfig>
```

