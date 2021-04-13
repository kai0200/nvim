# SpaceVim

## 备份 ##
| Keys               | 快捷键说明                       |
|--------------------|----------------------------------|
| :g/^###/s/$/ ###/g | 替换所有###开头的行,末尾添加 ### |


### 自定义快捷键  ###

- <SPC> 快捷键
```vim
function! myspacevim#before() abort
  call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)
endfunction
```

- spacevim 自动定义快捷键不生效问题
需要修改的文件基本在 ~/.SpaceVim.d/autoload/myspacevim.vim 这个文件里,按vim默认方式替换即可.
还有一种情况是被系统其他插件占用,如 

```
<leader>+n :call jedi#usages() 
```
研究了一下,附加插件的快捷键配置应该会覆盖用户指定的一些快捷键,需要用户在 ~/.SpaceVim.d/plugin/jedi.vim
增加相应名字的插件配置,修改以前的快捷键
```
➜ cat  ~/.SpaceVim.d/plugin/jedi.vim
let g:jedi#usages_command = "<leader>u"
#调整说明查看不同插件的git吧,可能配置不太一样.
```
在jedi.vim 里修改了key设置,myspacevim.vim #befor() 函数段里增加的快捷键就会生效了.

- 组合快捷键
```vim
function! myspacevim#before() abort
  autocmd FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>
  " 其他方式参看插件说明"
endfunction
  ```

### 查看日志 ###

```viml
:SPDebugInfo!
```

### 禁用插件 ###
  ```vim
  disabled_plugins = ["clighter", "clighter8"]
  ```

### 修改windows 键 ###
  ```
  spacevim_windows_leader:  s
  [options]
    windows_leader = ''
  ```

### 恢复默认vim  f F t T ###
  ```
  [options]
    enable_language_specific_leader = false
  ```

### 宏录制 ###
  ```
  q 恢复vim 模式
  [options]
    windows_smartclose = ''
  ```

### 命令行方向键 ###
    Ctrl-a Ctrl-b Ctrl-f

### 恢复vim 所有默认快捷键 ###
    vimcompatible = true

### 添加本地克隆版本插件 ###
  ```
  function! myspacevim#before() abort
    set rtp+=~/path/to/your/localplugin
  endfunction
  ```
### 随机下一个主题 ###
    SPC T n

### 状态栏显示 ###

  | 快捷键  | Unicode | ASCII | 功能                 |
  |---------|---------|-------|----------------------|
  | SPC t 8 | ⑧       | 8     | 高亮指定列后所有字符 |
  | SPC t f | ⓕ       | f     | 高亮指定列字符       |
  | SPC t s | ⓢ       | s     | 语法检查             |
  | SPC t S | Ⓢ       | S     | 拼写检查             |
  | SPC t w | ⓦ       | w     | 行尾空格检查         |

### markdown ###

| 功能 | 快捷键    |
|------|-----------|
| 预览 | \<F12\>   |
| 停止 | \<F11\>   |
| 表格 | ,tm       |
| 预览 | [SPC] l p |
    

### FileTree ###
    新建文件: N
    显示隐藏: .
    预览: p
    快速查看: v
    使用相关程序执行: gx
    刷新: Ctrl+r
    切换窗口文件: Ctrl+x

### q 宏 ###
  ```
  <leader> q r	原生 q 快捷键
  <leader> q r/	原生 q / 快捷键，打开命令行窗口
  <leader> q r?	原生 q ? 快捷键，打开命令行窗口
  <leader> q r:	原生 q : 快捷键，打开命令行窗口
  ```

### 导航键 [SPC] s , g z ###
  - s 文件关闭打开等
    ```
    新建：s-t
    退出：s-q
    关闭其它：s-o
    清理当前buffer：s-x
    清理全部buffer：s-c
    ```
  - g 多光标选择
    ```

    ```
  - z 折行

### 自定义[SPC] ###

  ```vim
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'echom "hello world"', 'test custom SPC', 1)
  [SPC] ? 看帮助
  ```

### 格式化代码 ###
  [SPC] b f

### 运行代码块 ###
  [SPC] l r

### 多光标修改 ###
  Ctrl+m Ctrl+x Ctrl+p

### 按等号对齐 ###
  [SPC] x a =

### 将选中字符串转为大写 ###
  [SPC] x U

### 数字+1 ###
  [SPC] n + (临时快捷键模式+ -)

### 注释/反注释 ###
  [SPC] c l   CU: ,/

### 切换标签 ###
  gr

### coc 缺少shell ###
  `npm i -g bash-language-server`

### 退出配置解决完毕 ###
  Ctrl+t newfile  ,q退出当前标签 原操作 st   sx

### 保存 ###
  Ctrl+s ,w

### 调整窗口 ###
  [SPC] w .

### 缓冲区清理 ###
  [SPC] b . 缓冲区清理  SPC b C-d	删除其它所有缓冲区

### 打开初始页面 ###
  [SPC] b h

### 标签 ###
  打标记 mm  切换: mn  mp mi

### 看所有模块 ###
  命令 :SPLayer -l 或者快捷键 SPC h l 来展示

### 模糊查找快捷键，并执行该快捷键 ###
  <Leader> f <Space>

### 搜索功能 spc  s ###
   1. 本文件  s s
   2. 目录    s d
   3. 任意目录 s f
   4. 工程理搜索  s p
   5. 后台 s j
   6. 网上 s w

### 实时代码检索 spc s g G ###

| 快捷键    | 功能描述                                           |
|-----------|----------------------------------------------------|
| SPC h SPC | 使用 fuzzy find 模块展示 SpaceVim 帮助文档章节目录 |
| SPC h i   | 获取光标下单词的帮助信息                           |
| SPC h k   | 使用快捷键导航，展示 SpaceVim 所支持的前缀键       |
| SPC h m   | 使用 Unite 浏览所有 man 文档                       |

### 常用的成对快捷键 ###
  [ q	跳至前一个错误
  ] q	跳至下一个错误
  [ t	跳至前一个标签页
  ] t	跳至下一个标签页
  [ w	跳至前一个窗口
  ] w	跳至下一个窗口

### 以 g 为前缀的快捷键 ###
  g '	跳至标签
  g *	正向搜索光标下的词

### yw /(Ctrl+R0) ###
  让光标停留在单词的第一个字母上， 然后输入yw拷贝该单词， 然后输入 / (Ctrl + R) 0 （即 /”0），回车， 就查找到了第一个匹配的单词， 并且可以通过 n  或  N 进行上一个或下一个的匹配

### v 选中要复制的文字, ###
  <leader>c (实际操作为 "+y) 拷贝,

### 多光标 ###
  1. [SPC] se
  2. [SPC] sh

### 错误管理导航键 (以 e 开头)：   spc  e   l ###

| 快捷键  | 功能描述                                                                    |
|---------|-----------------------------------------------------------------------------|
| SPC t s | 切换语法检查器                                                              |
| SPC e c | 清除所有错误                                                                |
| SPC e h | describe a syntax checker                                                   |
| SPC e l | 切换显示错误/警告列表                                                       |
| SPC e n | 跳至下一错误                                                                |
| SPC e p | 跳至上一个错误                                                              |
| SPC e v | verify syntax checker setup (useful to debug 3rd party tools configuration) |
| SPC e . | 错误暂态（error transient state)                                            |


### quickfix 列表移动： ###

| 快捷键       | 功能描述                       |
|--------------|--------------------------------|
| <Leader> q l | 打开 quickfix 列表窗口         |
| <Leader> q c | 清除 quickfix 列表             |
| <Leader> q n | 跳到 quickfix 列表中下一个位置 |
| <Leader> q p | 跳到 quickfix 列表中上一个位置 |

### python2/3 设置
```shell
# 在.bashrc 或 .zshrc 增加设置
# For coc.nvim python
  export PYTHON_HOST_PROG="/usr/bin/python2"
  export PYTHON3_HOST_PROG="/usr/local/opt/python@3.8/bin/python3.8"
```

### git.gitgutter 装订线(左边侧栏重复显示问题)

安装的gitgutter 可以很好的显示git diff 增加删除修改等, 现有coc.nvim也出现提示标丑,想禁止掉查找很久.

- 命令总结
```vim
:set signcolumn=no  # 关闭侧栏显示
:GitGutterDisable   # 关闭git提醒
:CocDisable         # 禁用Coc
:autocmd CursorHold # autocmd 查看所有列表
:sign list          # 查看sign 的插件命令
:let  <tab>         # 可查看所有let 参数
```

- 办法  [参考]()https://www.reddit.com/r/vim/comments/do98do/how_do_i_get_the_pretty_icons_for_diagnostic/
增加~/.SpaceVim/coc-settings.json   
生效代码应该是 ```"git.enableGutters": false``` ,这样就是用gitgutter插件的git提醒,错误检查和报警使用coc.nvim的

```json
# ln -s ~/.SpaceVim.d/coc-settings.json  ~/.SpaceVim/
# 软连接到真实目录,

{
  "codeLens.enable": true,
  "diagnostic.errorSign": "✘",
  "diagnostic.warningSign": "",
  "diagnostic.infoSign": "",
  "diagnostic-languageserver.filetypes": {
    "sh": "shellcheck"
  },
  "eslint.enable": false,
  "eslint.filetypes": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],
  "git.realtimeGutters": true,
  "suggest.noselect": true,
  "languageserver": {
    "dhall": {
      "command": "dhall-lsp-server",
      "filetypes": ["dhall"]
    },
    "scala": {
      "command": "node",
      "args": ["/home/jesse/bin/sbt-server-stdio.js"],
      "filetypes": ["scala"],
      "initializationOptions": {},
      "settings": {},
      "rootPatterns": ["build.sbt"]
    }
  },
  "list.insertMappings": {
    "<C-x>": "action:split",
    "<C-v>": "action:vsplit"
  },
  "list.normalMappings": {
    "s": "action:split",
    "v": "action:vsplit"
  },
  "list.source.files.command": "fd",
  "list.source.files.args": ["--type", "f"],
  "tsserver.enableJavascript": true,
  "typescript.format.insertSpaceAfterFunctionKeywordForAnonymousFunctions": false,
  "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
  "typescript.preferences.quoteStyle": "double",
  "typescript.referencesCodeLens.enable": false,
  "git.enableGutters": false
}

```
# coc-vim python 配置

```
# coc-vim 需要安装服务
# 配置 ~/.SpaceVim/coc-settings.json
url https://github.com/neoclide/coc.nvim/wiki/Language-servers#python  

url  https://github.com/palantir/python-language-server

pip3.9 install 'python-language-server[yapf]'
pip3.9 install 'python-language-server[all]'
pip3.9 install -U setuptools

other plugins
pyls-mypy pyls-isort pyls-black


```
