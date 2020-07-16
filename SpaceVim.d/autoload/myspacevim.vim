func! myspacevim#before() abort

  " ------------------- START  -----------------------
  " 多光标选择
  "

  "" 重新映射 window 键位
  " let g:spacevim_windows_leader = 'c'

  call SpaceVim#custom#SPC('nnoremap', ['s', 'f'], 'Vista finder', 'search ctags simbols', 1)
  call SpaceVim#custom#SPC('nnoremap', ['s', 'F'], 'LeaderfFunction!', 'list functions', 1)

  "" 让file tree 显示文件图标，需要 terminal 安装 nerd font
  let g:spacevim_enable_vimfiler_filetypeicon = 1

  "" 书签选中之后自动关闭 quickfix window
  let g:bookmark_auto_close = 1
  
  "" ctrl + ] 查询 cppman
  "" 如果想让该快捷键自动查询 man，将Cppman 替换为 Cppman!
  autocmd FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>

  "" 让光标自动进入到popup window 中间
  "let g:git_messenger_always_into_popup = v:true
  
  "" 设置映射规则，和 spacevim 保持一致
  "call SpaceVim#custom#SPC('nnoremap', ['g', 'm'], 'GitMessenger', 'show commit message in popup window', 1)
  "call SpaceVim#custom#SPC('nnoremap', ['g', 'l'], 'FloatermNew lazygit', 'open lazygit in floaterm', 1)

  " 设置默认的pdf阅览工具
  let g:vimtex_view_method = 'zathura'


  " 保证在插入模式<F4>可以 toggle floaterm
  inoremap  <silent>   <F4>   :FloatermToggle!<CR>
  nnoremap  <silent>   <F4>   :FloatermToggle!<CR>
  tnoremap  <silent>   <F4>   <C-\><C-n>:FloatermToggle!<CR>


  " 重新映射 leader 键
  let g:mapleader = ','

  "" 关闭所有隐藏设置 浮动窗口
	let g:tex_conceal = ""

  let g:floaterm_keymap_new    = '<C-n>'
  let g:floaterm_keymap_prev   = '<C-h>'
  let g:floaterm_keymap_next   = '<C-l>'

  "" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
  set selection=inclusive
  set selectmode=mouse,key
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key      = '<C-m>'
  let g:multi_cursor_select_all_word_key = '<A-m>'
  let g:multi_cursor_start_key           = 'g<C-m>'
  let g:multi_cursor_select_all_key      = 'g<A-m>'
  let g:multi_cursor_next_key            = '<C-m>'
  "let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
  "
  " 焦点消失的时候自动保存
  "
  au FocusLost * :wa
  au FocusGained,BufEnter * :checktime

	" 设置可以高亮的关键字
	if has("autocmd")
	  " Highlight TODO, FIXME, NOTE, etc.
	  if v:version > 701
	    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
	    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
	  endif
	endif
  " ------------------- END -----------------------
endf

func! myspacevim#after() abort
  " ------------------- START  -----------------------
  " 放到此处用于重写 SpaceVim 映射的 F2
  nnoremap  <F2>  :Vista!!<CR>
  
  " ------------------- END -----------------------
endf
