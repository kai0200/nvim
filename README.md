目标
====

    * 学会markdown 快速笔记的方式

    * 可参考配置 [other](https://www.cnblogs.com/cniwoq/p/13272746.html)


# 发现快捷键

> 总结常用快捷键，vim自带的一些就不在此处介绍了

- 容易忘记的快捷键

    ```vim
    # 常用命令
    :message
    :map <key>
    :verbose imap <tab>
    :pwd
    :echo coc#util#get_config_home() # echo 命令
    :h      # K 帮助
    tt      # 打开左侧目录
    ,,c     # CocCommand
    ,ec     # 开关语法检查
    M-p     # Alt+p 开关括号自动完成
    ,tn     # 创建TODO :CocCommand todolist.create
    ,tl     # 显示TODO :CocList todolist
    ,ts     # :CocList tasks

    # 文字编辑
    Ctrl-m  # 多行选择修改
    S"\     # V 模式下 字符串两边加引号
    ,a      # coc-vim v 选择以后 ,a
    ,e      # 快速对齐 V模式下
    ,e=     #
    fx      # 行内跳转到x
    M-p     # 禁用输入括号自动补全 (tmux 上取消了M-p)


    # 标记mark
    mm      # 标记位置为m
    `m      # 回到m处
    ,c      # 跳出括号

    # 单词拼写检查
    zm      # 需要:set spell 光标处zm更换单词
    ]s      # 将光标移到下一个拼写错误处
    [s      # 将光标移到上一个拼写错误处
    zg      # 将单词加入词典
    zug     # 撤销将单词加入词典
    z=      # 拼写建议

    ```

- junegunn/vim-easy-align 快速对齐

    ```viml
    # 改键盘为,a 为 ,e
    ,e=        对齐等号表达
    ,e:        对齐冒号表达式(json/map等)

    # 默认左对齐
    ,e<space>  首个空格对齐
    ,e2<space> 第二个空格对齐
    ,e-<space> 倒数第一个空格对齐
    ,e-2<space> 倒数第二个空格对齐
    ,e*<space> 所有空格依次对齐
    ,a<Enter>*<space>
    ```

- surround.vim

    ```viml
    S"     # V模式下选中部分两边添加\"  , 这个比较方便好理解
    ds[ds) # 删除[  删除(
    cs"'   # 替换两边\" \'

    ysiw"  # 在字符串两添加\"
    S<p class="important">   # 在V 模式下为行增加P标签

    cs'<q> # 替换
    cst"   # 移除
    yss(   # 整行加括号
    ```

- coc.nvim
    > :CocList extensions  显示插件情况*激活 +加载
    > :CocConfig 打开用户配置文件
    > :CocLocalConfig 打开项目配置文件
    > :checkhealth   检查
    > :CocInfo   查看服务相关情况
    > :CocOpenLog  打开coclog


    1. verbose imap <tab>

    2. :CocInstall coc-python

    3. :CocList

    4. :CocConfig

    5. Key map

    ```viml
    <tab>
    <Ctrl+Space>  # coc#refresh()
    <CR>          # Enter 确认
    `[g`  and `]g`   # 导航 :CocDiagnostics get all diagnostics of current buffer in location list
    # GoTo code navigation
    gd <Plug>(coc-definition)      # 如果有错误尝试 pip3 uninstall jedi 再重装
    gy <Plug>(coc-type-definition)
    gi <Plug>(coc-implementation)
    gr <Plug>(coc-references)
    Ctrl+o        # 回到刚才编辑的未知

    K  show_document

    <leader>rn    # coc-rename

    *
    ,f  # V模式 自动格式程序代码
    ,t  # 翻译单词
    Ctrl+C        # :CocCommand
    :CocList      # List 可用列表 Ctrl+o 和 i 切换命令|插入模式
    :CocOpenLog   # coc 日志
    :CocCommand explorer   # tt 快捷键的操作

    :TODO  继续学习coc快捷键
    ```

# 插件列表

- NrrwRgn  # Enter 选择到段落末尾 Ctrl+y 小范围编辑 :w 保存

- Vim-Jinja2-Syntax  # ansible/python 等模版文件语法加量

- ag.vim   # 搜索Ag user user.list

- ale      # 语法检查的插件,异步方式  Key <gs> 交换True False

- antovim  # 超级简单的vim插件，用于遍历光标下与单词相关的反义词/单词

- argtextobj.vim  # `daa` 删除一个参数

- auto-pairs  deleted    # 括号自动操作<M-p> Alt+p 默认是开关，自定义了<,-c> 跳出括号 ] 不生效

- braceless.vim   # 折叠单独 zc zo |  全部 zM zR 等

- clever-f.vim    # f  t 键修改方便搜索

- closetag.vim    # 封闭标签自动补全

- coc.nvim        # 自动补全大师  tt 打开文件目录

- ctrlsf.vim      # 搜索配合Ag

- fzf-gitignore   # 自动索引 TODO 还没学会怎么用

- fzf.vim         # 自动索引 TODO 还没学会怎么用

- gundo.vim       # Gundo.vim is Vim plugin to visualize your Vim undo tree.

- html5.vim

- jedi-vim    # python函数跳转插件 ,d ,g ,s K ,n C-space ,r

- lazygit-vim

- markdown-preview.nvim

- molokai         # 主题
- nerdtree        # 目录树

- python-syntax

- quick-scope     # 彩色显示F f T t 搜索到的项目

- rainbow_parentheses.vim  # 括号高亮

- rnvimr          # 浮动窗口  mac nvim `:checkhealth rnvimr` 不支持，取消，
- semshi          # Semshi在Neovim中为Python提供了语义突出显示功能
- splitjoin.vim   # gS 单行变多行 gJ 光标放在块首部
- tabular         # 代码自动对齐配合vim-multiple-cursors 使用 :Tabularize /= 选中等号对齐 V模式下输入:Tabularize /= 一样效果
- tagbar          # F9 查看函数，类 右边状态栏
- tmux-complete.vim    # 防止tmux vim冲突<C-X><C-U>
- undotree             # :UndotreeToggle    help ?
- vim-after-object     # . = ...未明白
- vim-airline          # 底部状态增强/美化插件
- vim-airline-themes   # 底部状态增强/美化插件
- vim-autoformat       # 代码自动美化 \f 此配置主要处理js java
- vim-capslock         # <Ctrl+G>c 临时大写锁
- vim-closetag         # html 自动关闭标签
- vim-colors-solarized # 主题
- vim-ctrlspace        # 配合生成状态栏 后期在看

    1. 标签/缓冲区/文件管理
    2. 快速模糊查找
    3. 工作区会话
    4. 自己喜欢的项目标签


    ```viml
    <C-space> 开启快捷键 改为<leader>.
    ? 查看相关快捷键
    h	开关缓冲文件列表
    H	打开搜索模式缓冲文件列表
    o	开关文件列表
    O	打开搜索模式文件列表
    l	开关tab页列表
    L	打开搜索模式tab页列表
    w	开关工作空间列表
    W	打开搜索模式工作空间列表
    b	开关书签列表
    B	打开搜索模式书签列表
    BS（回退键）,返回普通ctrlspace窗口

    ```

- vim-easymotion       # 强化版检索式移动 ,,hjkl
- vim-gitgutter        # 在sign列中显示git diff <leader>gs :GitGutterToggle<CR>
- vim-gitignore        # 无用可以废弃了
- vim-go               # go 开发插件
- vim-indent-guides    # 用于可视显示缩进级别
- vim-instant-markdown # markdown 预览
- vim-isort            # 用Isort对python导入进行排序
- vim-javascript       # javascript
- vim-js               # js
- vim-json             # json
- vim-markdown         # md
- vim-markdown-toc     # md
- vim-multiple-cursors

  多行编辑，配合tabulra 实现代码自动对齐. v模式选中单词，C-m C-m 连续选中相同的词，正常vi命令修改即可，很方便

- vim-nerdtree-tabs    # tree
- vim-python-pep8-indent  #
- vim-quickrun         # F10 run
- vim-rooter           # 支持项目目录
- vim-snazzy           # 主题
- vim-snippets         # 减少按键次数 减轻记忆负担  可能和coc
- vim-subversive       # 批量替换 :TODO  :%s/aa/bb/g 感觉可以替换这个功能
- vim-surround         # 单词周围加符号 单词周围加双引号：ysiw"  改 cs"' 删除ds'
- vim-table-mode       # markdown 表格处理很方便 key map: <leader>tm

    * ,tm 处理表格

- vim-textobj-entire   # 增加文件文本对象: e   dae yae cie
- vim-textobj-indent   # 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
- vim-textobj-line     # 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
- vim-textobj-user     # 支持自定义文本对象
- vim-tmux-navigator   # 避免tmux 和vim 冲突
- vim-trailing-whitespace # ,<space> 清除空格
- vim-virtualenv       # python venv 更换环境
- vista.vim            # 好看的标签，需要按git说明配置mac
- yajs.vim             # javascript

删除的
------
- wildfire.vim         # 文本选中，不会用 ctrl+m  和 vim-multiple-cursors 冲突

nvim
----

- markdown

1. dhruvasagar/vim-table-mode

https://github.com/dhruvasagar/vim-table-mode

,tm
- 快捷键使用说明
|| 进入tab模式
|+


2. vim-markdown-toc

- :GenTocGFM

生成 GFM 链接风格的 Table of Contents.
适用于 GitHub 仓库里的 Markdown 文件。

- :GenTocRedcarpet

生成 Redcarpet 链接风格的 Table of Contents.


# nvim
config of nvim for mac

git
--------
```shell
$ git fetch --all
$ git fetch --tags
$ git reset --hard origin/master
```

### 安装说明

```bash
git clone ...
cd ~/.config
mv nvim nvim.bak
ln -s ~/nvim  ~/.config/
mv nvim.bak/bundle  ~/.config/nvim/
nvim
:PlugInstall
```

### 目录说明

未上传目录 .gitignore

```bash
bundle  # 需要手工创建
mkdir -p  ~/.config/nvim/bundle

```
### 快捷打开init.vim
```
,ev # init.vim
,ez # .zshrc
,sv # source $MYVIMRC
```
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


---

### 2020-07-10

- 注释了以下配置, 原因是影响输入速度
```markdown
"autocmd Filetype markdown inoremap <buffer> .f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
"autocmd Filetype markdown inoremap <buffer> .w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
"autocmd Filetype markdown inoremap <buffer> .n ---<Enter><Enter>
"autocmd Filetype markdown inoremap <buffer> .b **** <++><Esc>F*hi
"autocmd Filetype markdown inoremap <buffer> .s ~~~~ <++><Esc>F~hi
"autocmd Filetype markdown inoremap <buffer> .i ** <++><Esc>F*i
"autocmd Filetype markdown inoremap <buffer> .d `` <++><Esc>F`i
"autocmd Filetype markdown inoremap <buffer> .c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
"autocmd Filetype markdown inoremap <buffer> .m - [ ]
"autocmd Filetype markdown inoremap <buffer> .p ![](<++>) <++><Esc>F[a
"autocmd Filetype markdown inoremap <buffer> .a [](<++>) <++><Esc>F[a
"autocmd Filetype markdown inoremap <buffer> .1 #<Space><Enter><++><Esc>kA
"autocmd Filetype markdown inoremap <buffer> .2 ##<Space><Enter><++><Esc>kA
"autocmd Filetype markdown inoremap <buffer> .3 ###<Space><Enter><++><Esc>kA
"autocmd Filetype markdown inoremap <buffer> .4 ####<Space><Enter><++><Esc>kA
"autocmd Filetype markdown inoremap <buffer> .l --------<Enter>

:source ~/.config/nvim/vimrc.bundles
```

### 2020-07-11

修改
----

- far.vim  # 批量替换，这个暂时去掉
- bullets.vim markdown

**增加以下配置**
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
Plug 'theniceboy/bullets.vim'

- tab切换 注销,th 等操作

[] tmux vim 键位冲突问题
[] markdown 标记学习

