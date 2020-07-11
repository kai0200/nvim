目标
====

* nvim 快捷键使用说明

* 学会markdown 快速笔记的方式

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
