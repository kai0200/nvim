func! myspacevim#before() abort

    " F12 预览markdown
    let g:instant_markdown_slow = 1
    let g:instant_markdown_autostart = 0
    map <F12> :InstantMarkdownPreview<CR>

    " 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
    set selection=inclusive
    set selectmode=mouse,key

    " 多光标选择
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_start_word_key      = '<C-m>'
    let g:multi_cursor_select_all_word_key = '<A-m>'
    let g:multi_cursor_start_key           = 'g<C-m>'
    let g:multi_cursor_select_all_key      = 'g<A-m>'
    let g:multi_cursor_next_key            = '<C-m>'
    "let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

	" kj 替换 Esc
	inoremap kj <Esc>

    " 焦点消失的时候自动保存
    au FocusLost * :wa
    au FocusGained,BufEnter * :checktime

    " 当文件被其他编辑器修改时，自动加载
    set autowrite
    set autoread

    " 设置按照syntax高亮进行折叠
    set foldmethod=syntax
    set nofoldenable

	" 具体编辑文件类型的一般设置，比如不要 tab 等
	autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
	"autocmd FileType python set shiftwidth=4 expandtab ai
	autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
	autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
	autocmd BufRead,BufNewFile *.part set filetype=html
	autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

    " 打开导航栏
    " <F3> 打开文件树
    nnoremap  <F5>  :call QuickRun()<CR>
    " <F4> floaterm toggle
    " <F7> 打开历史记录
    tnoremap  <Esc>  <C-\><C-n>

    " 重新映射 leader 键
    let g:mapleader = ','
    " 重新映射 window 键位
    let g:spacevim_windows_leader = 'c'

    call SpaceVim#custom#SPC('nnoremap', ['s', 'f'], 'Vista finder', 'search ctags simbols', 1)
    call SpaceVim#custom#SPC('nnoremap', ['s', 'F'], 'LeaderfFunction!', 'list functions', 1)

    " nerdcommenter 并不智能，比如对于同一行注释两次，
    " nerdcommenter 会得到 /*/* code */*/，但是我期待的是 code
    " SpaceVim 默认使用 nerdcommenter，为了使用 vim-commentary
    " 似乎必须显式地disable掉这个插件
    " https://github.com/SpaceVim/SpaceVim/issues/216
    let g:spacevim_disabled_plugins = ['nerdcommenter']
    " remap vim-commentary 来保持兼容
    nmap <space>cl gcc
    vmap <space>cl gc

    let g:spacevim_snippet_engine = 'ultisnips'

    let g:table_mode_corner='|'

    " 条件 window 大小的设置
    let g:winresizer_start_key = '<space>wa'
    " If you cancel and quit window resize mode by `q` (keycode 113)
    let g:winresizer_keycode_cancel = 113

    " spell https://wiki.archlinux.org/index.php/Language_checking

    " 让file tree 显示文件图标，需要 terminal 安装 nerd font
    let g:spacevim_enable_vimfiler_filetypeicon = 1
    " 让 file tree 显示 git 的状态，似乎让 file tree 有点卡，所以关掉
    " let g:spacevim_enable_vimfiler_gitstatus = 1

    " 书签选中之后自动关闭 quickfix window
    let g:bookmark_auto_close = 1

    " vista 导航栏
    let g:vista_echo_cursor_strategy = 'scroll'
    let g:vista_close_on_jump = 1
    let g:vista_sidebar_position = "vertical topleft"

    " vim-lsp-cxx-highlight 和这个选项存在冲突
    " let g:rainbow_active = 1

    " ctrl + ] 查询 cppman
    " 如果想让该快捷键自动查询 man，将Cppman 替换为 Cppman!
    autocmd FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>

    " 让光标自动进入到popup window 中间
    let g:git_messenger_always_into_popup = v:true
    " 设置映射规则，和 spacevim 保持一致
    call SpaceVim#custom#SPC('nnoremap', ['g', 'm'], 'GitMessenger', 'show commit message in popup window', 1)
    call SpaceVim#custom#SPC('nnoremap', ['g', 'l'], 'FloatermNew lazygit', 'open lazygit in floaterm', 1)

    " 设置默认的pdf阅览工具
    let g:vimtex_view_method = 'zathura'
    " 关闭所有隐藏设置
		let g:tex_conceal = ""

    let g:floaterm_keymap_new    = '<C-n>'
    let g:floaterm_keymap_prev   = '<C-h>'
    let g:floaterm_keymap_next   = '<C-l>'
    " 保证在插入模式<F4>可以 toggle floaterm
    inoremap  <silent>   <F4>   :FloatermToggle!<CR>
    nnoremap  <silent>   <F4>   :FloatermToggle!<CR>
    tnoremap  <silent>   <F4>   <C-\><C-n>:FloatermToggle!<CR>

    " 实现一键运行
    func! QuickRun()
        exec "w"
        let ext = expand("%:e")
        let file = expand("%")
        if ext ==# "sh"
            exec "!sh %"
        elseif ext ==# "md"
            exec "!dos2unix %"
        elseif ext ==# "cpp"
            exec "!clang++ % -Wall -O3 -g -std=c++11 -o %<.out && ./%<.out"
        elseif ext ==# "c"
            exec "!clang % -Wall -g -std=c11 -o %<.out && ./%<.out"
        elseif ext ==# "java"
            let classPath = expand('%:h')
            let className = expand('%:p:t:r')
            " echo classPath
            " echo className
            exec "!javac %"
            exec "!java -classpath " . classPath . " " . className
        elseif ext ==# "go"
            exec "!go run %"
        elseif ext ==# "js"
            exec "!node %"
        elseif ext ==# "bin"
            exec "!readelf -h %"
        elseif ext ==# "py"
            exec "!python3 %"
        elseif ext ==# "vim"
            exec "so %"
        elseif ext ==# "html"
            exec "!google-chrome-stable %"
        elseif ext ==# "rs"
            call CargoRun()
        else
            echo "Check file type !"
        endif
        echo 'done'
    endf

    " 一键运行 rust 工程，不断向上查找直到遇到 Cargo.toml，然后执行 cargo run
    func! CargoRun()
      let cargo_run_path = fnamemodify(resolve(expand('%:p')), ':h')
      while cargo_run_path != "/"
        if filereadable(cargo_run_path . "/Cargo.toml")
            echo cargo_run_path
            exec "cd " . cargo_run_path
            exec "!cargo run"
            exec "cd -"
            return
        endif
       let cargo_run_path = fnamemodify(cargo_run_path, ':h')
      endwhile
      echo "Cargo.toml not found !"
    endf
endf

func! myspacevim#after() abort
    " 放到此处用于重写 SpaceVim 映射的 F2
    nnoremap  <F2>  :Vista!!<CR>
	syntax on
	" 检测文件类型
	filetype on
	" 针对不同的文件类型采用不同的缩进格式
	filetype indent on
	" 允许插件
	filetype plugin on
	" 启动自动补全
	filetype plugin indent on

	" tab相关变更
	" 设置Tab键的宽度        [等同的空格个数]
	set tabstop=4
	" 每一次缩进对应的空格数
	set shiftwidth=4
	" 按退格键时可以一次删掉 4 个空格
	set softtabstop=4
	" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
	set smarttab
	" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
	set expandtab
	" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
	set shiftround

	" 具体编辑文件类型的一般设置，比如不要 tab 等
	autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
	autocmd FileType ruby,javascript,html,css,xml set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
	autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
	autocmd BufRead,BufNewFile *.part set filetype=html
	"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
	autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai

	" disable showmatch when use > in php
	au BufWinEnter *.php set mps-=<:>

	" 保存python文件时删除多余空格
	fun! <SID>StripTrailingWhitespaces()
	    let l = line(".")
	    let c = col(".")
	    %s/\s\+$//e
	    call cursor(l, c)
	endfun
	autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


	" 定义函数AutoSetFileHead，自动插入文件头
	autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
	function! AutoSetFileHead()
	    "如果文件类型为.sh文件
	    if &filetype == 'sh'
	        call setline(1, "\#!/bin/bash")
	    endif

	    "如果文件类型为python
	    if &filetype == 'python'
	         call setline(1, "\# encoding: utf-8")
	         call setline(2, "\# vim: expandtab softtabstop=4 shiftwidth=4")
	    endif

	    normal G
	    normal o
	    normal o
	endfunc


	" 设置可以高亮的关键字
	if has("autocmd")
	  " Highlight TODO, FIXME, NOTE, etc.
	  if v:version > 701
	    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
	    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
	  endif
	endif


endf
