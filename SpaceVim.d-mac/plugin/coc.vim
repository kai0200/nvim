" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_config_home = '~/.SpaceVim.d'
" 使用 Microsoft Python Language Server 不然 coc.nvim 会警告
call coc#config("python.jediEnabled", v:false)
"
"call coc#config("diagnostic.hintSignColumn", v:false)
call coc#config("diagnostic.enableHintSign", v:false)

" c/c++ golang 和 bash 的 language server 设置
"call coc#config("languageserver", {
"      \"bash": {
"      \  "command": "bash-language-server",
"      \  "args": ["start"],
"      \  "filetypes": ["sh"],
"      \  "ignoredRootPaths": ["~"]
"      \},
"      \})

      "去掉了报错配置bash  "ignoredRootPaths": ["~"]
      "
" coc.nvim 插件，用于支持 python java 等语言
let s:coc_extensions = [
      \ 'coc-actions',
      \ 'coc-ecdict',
      \ 'coc-ci',
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-css',
      \ 'coc-dictionary',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-markdownlint',
      \ 'coc-flutter',
      \ 'coc-html',
      \ 'coc-java',
	  \ 'coc-json',
	  \ 'coc-lists',
	  \ 'coc-powershell',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-snippets',
      \ 'coc-sourcekit',
      \ 'coc-stylelint',
      \ 'coc-syntax',
      \ 'coc-tasks',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-tslint',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-vimtex',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ 'coc-go',
      \ 'coc-pairs',
      \ 'coc-sh',
      \]
for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"set updatetime=300
"autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" 注释掉，一般使用 `Space` `r` `f` 直接格式化整个文件
" Remap for format selected region
 vmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
" command! -nargs=0 Format :call CocAction('format')
call SpaceVim#custom#SPC('nnoremap', ['r', 'f'], "call CocAction('format')", 'format file with coc.nvim', 1)

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" auto import for go on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>

" Translate ,t
"然后使用 <>t就可以翻译光标下的单词了。你 也可以使用 :CocCommand translator.popup命令进行翻译。
"你还可以使用 CocList查看自己的翻译历史
"使用 :CocCommand translator.exportHistory导出翻译历史

" popup
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv)
" echo
nmap <leader>e <Plug>(coc-translator-e)
nmap <leader>e <Plug>(coc-translator-ev)
" replace
nmap <leader>r <Plug>(coc-translator-r)
nmap <leader>r <Plug>(coc-translator-rv)

"nmap <leader>c :call CocActionAsync('doHover')<CR>
nnoremap <silent> <leader>c :call CocActionAsync('doHover')<CR>

map <leader>n :CocCommand explorer<cr>

" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
