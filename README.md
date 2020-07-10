# nvim
config of nvim for mac

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

### 说明

未上传目录 .gitignore

```bash
bundle
```
2. 软连接 nvim


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
