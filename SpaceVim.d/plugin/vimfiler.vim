function! s:open_vimfiler() abort
  " check if VimFiler exist, if the windows has been opened, just close the
  " vimfiler windows, if the vimfiler widnows is not exist, open vimfiler for
  " current project.
  silent exe 'VimFiler ' . get(b:, 'rootDir', '')
  "silent exe 'VimFiler ' . get(b:, '$PWD', '$PWD')
  doautocmd WinEnter
endfunction

"nnoremap <silent> <F3> :call <SID>open_vimfiler()<CR>
nnoremap <silent> <leader>n :call <SID>open_vimfiler()<CR>
