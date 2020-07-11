目标
====

* nvim 快捷键使用说明

* 学会markdown 快速笔记的方式

插件列表
========

- NrrwRgn  # Enter 选择到段落末尾 Ctrl+y 小范围编辑 :w 保存

- Vim-Jinja2-Syntax  # ansible python 模版文件语法加量

- ag.vim   # 搜索Ag user user.list

- ale      # 语法检查的插件,异步方式  Key <gs> 交换True False

- antovim  # 超级简单的vim插件，用于遍历光标下与单词相关的反义词/单词

- argtextobj.vim  # `daa` 删除一个参数

- auto-pairs      # 括号自动操作<M-e> Alt+e 默认是开关，自定义了<,-c> 跳出括号 ] 不生效

- braceless.vim   # 折叠单独 zc zo |  全部 zM zR 等

- clever-f.vim    # f  t 键修改方便搜索

- closetag.vim    # 封闭标签自动补全

- coc.nvim        # 自动补全大师

- ctrlsf.vim      # 搜索配合Ag

- fzf-gitignore   # 自动索引 TODO 还没学会怎么用

- fzf.vim         # 自动索引 TODO 还没学会怎么用

- gundo.vim       # Gundo.vim is Vim plugin to visualize your Vim undo tree.

- html5.vim

- lazygit-vim

- markdown-preview.nvim

- molokai         # 主题
- nerdtree        # 目录树

- python-syntax

- quick-scope     # 彩色显示F f T t 搜索到的项目

- rainbow_parentheses.vim  # 括号高亮

- rnvimr          # 浮动窗口  mac nvim `:checkhealth rnvimr` 不支持，取消，

semshi
splitjoin.vim
tabular
tagbar
tmux-complete.vim
undotree
vim-after-object
vim-airline
vim-airline-themes
vim-autoformat
vim-capslock
vim-closetag
vim-colors-solarized
vim-ctrlspace
vim-easymotion
vim-gitgutter
vim-gitignore
vim-go
vim-indent-guides
vim-instant-markdown
vim-isort
vim-javascript
vim-js
vim-json
vim-markdown
vim-markdown-toc
vim-nerdtree-tabs
vim-python-pep8-indent
vim-quickrun
vim-rooter        # 支持项目目录
vim-snazzy
vim-snippets
vim-subversive
vim-surround
vim-table-mode
vim-textobj-entire
vim-textobj-indent
vim-textobj-line
vim-textobj-user
vim-tmux-navigator
vim-trailing-whitespace
vim-virtualenv
vista.vim
wildfire.vim
yajs.vim
nvim
----

### markdown

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
