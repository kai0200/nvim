#

## Install

```sh
curl https://sh.rustup.rs -sSf | sh
export PATH="$HOME/.cargo/bin:$PATH"
rustup override set stable
rustup update stable
git clone https://github.com/jwilm/alacritty.git
cd alacritty
make app

cp -r target/release/osx/Alacritty.app /Applications/
```

## 字体安装

```
brew tap homebrew/cask-fonts
brew cask install font-sourcecodepro-nerd-font-mono -v
```


# Alacritty and Spacevim 配色
https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/

Alacritty 主题
https://github.com/toggle-corp/alacritty-colorscheme  # 配置方法
https://github.com/toggle-corp/alacritty-colorscheme  # 库1
https://github.com/eendroroy/alacritty-theme.git      # 库2


# 这个网站找主题
https://github.com/mbadolato/iTerm2-Color-Schemes.git # alacritty, iTerm2 等的schemes
https://github.com/shuhei/colortty                    # colortty 主题转换

https://ethanschoonover.com/solarized/
https://github.com/overcache/NeoSolarized
https://github.com/shuhei/colortty
http://xfyuan.github.io/2020/07/patch-sf-mono-to-nerd-font/  # 字体整合 TODO

# Spacevim

```
# ~/.SpaceVim.d/init.toml
colorscheme = "gruvbox"
#colorscheme = "solarized"
#colorscheme = "NeoSolarized"
#colorscheme_bg = "dark"
# Disable guicolors in basic mode, many terminal do not support 24bit
# true colors
enable_guicolors = true
```


# Alacritty

```
# ~/.config/alacritty/alacritty.yml
# Colors (Gruvbox Dark)
colors:
  bright:
    black: '#7f7061'
    blue: '#719586'
    cyan: '#7db669'
    green: '#aab01e'
    magenta: '#c77089'
    red: '#f73028'
    white: '#e6d4a3'
    yellow: '#f7b125'
  cursor:
    cursor: '#e6d4a3'
    text: '#1e1e1e'
  normal:
    black: '#1e1e1e'
    blue: '#377375'
    cyan: '#578e57'
    green: '#868715'
    magenta: '#a04b73'
    red: '#be0f17'
    white: '#978771'
    yellow: '#cc881a'
  primary:
    background: '#1e1e1e'
    foreground: '#e6d4a3'
  selection:
    background: '#e6d4a3'
    text: '#534a42'
```
