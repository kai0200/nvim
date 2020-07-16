# nvim spacevim coc install

- [Vim Cheat Sheet ](https://vim.rtorr.com/lang/zh_cn)

- [参考](https://www.jianshu.com/p/249850f2cc64)

### nvim

- 安装看git

### spacevim 安装

- 安装看git
- [中文官网](https://spacevim.org/cn/documentation/)

- 安装脚本
```shell
curl -sLf https://spacevim.org/install.sh | bash
```

### spacevim 乱码

```shell
$ brew tap homebrew/cask-fontss
$ brew cask install font-hack-nerd-font
```
[美化主题](https://zhuanlan.zhihu.com/p/66226220?utm_source=wechat_session)

### 修改iterm2 字体

```
进入iTerm的配置界面（快捷键Command+,）
Profiles -> Text
主要修改下边的Non-ASCII Font：
```

### 安装其它

```
yarn
npm
ccls
```
### vimproc

```vim
:VimProcInstall
```
### 复制配置

	- 按此[配置](https://www.jianshu.com/p/249850f2cc64)设置

    ```
    1. cd ~ # 进入到根目录
    2. rm -r .SpaceVim.d # 将 SpaceVim 删除
    # git clone --depth=1 https://github.com/Martins3/My-Linux-config .SpaceVim.d # 将本项目的内容复制到 SpaceVim.d，--depth=1 是减少下载量
    3. git clone https://gitee.com/martins3/My-Linux-config .SpaceVim.d # 使用 gitee，速度非常快，推荐使用
    4. 注意要注释屌wakatime 这个插件 ~/.SpaceVim.d/init.toml  最后一行.
    5. nvim # 打开vim 将会自动安装所有的插件

    # NOTIC: spacevim ~/.SpaceVim.d/init.toml  option选项可添加的配置在帮助文档里可以明显看到spacevim 开头spacevim_autocomplete_method ,autocomplete_method 这个参数就可以添加到option选项里了。


    :SPUpdate # 更新插件，
    ```

    - 增加用户自定义配置的时候要在

    ```
    cd ~/.SpaceVim.d/autoload/myspacevim.vim
    myspacevim#after() # 在spacevim 加载它自己的配置以后在加载我们自定义的就不会被覆盖了。

    ```


### 其它

    ```
    # 修改hosts 文件
    199.232.28.133 raw.githubuser
    52.216.186.155 github-production-release-asset-2e65be.s3.amazonaws.com
    ```

### 自定义spacevim+coc

    ```

    mv SpaceVim.d_for_spacevim_coc ~/.SpaceVim.d
    ```
