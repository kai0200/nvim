" defx 将会自动忽略如下的文件
call defx#custom#option('_', {
    \ 'ignored_files': ".*,*.class,*.out,*.o,*.bc,*.a,compile_commands.json,*.d,*.mod*,*.cmd,.tmp_versions/,modules.order,Module.symvers,Mkfile.old,dkms.conf,*.ko",
    \ })
" <leader>n "  jedi 占用了,n 查jedi git 配置修改到plugin/jedi.vim 生效了
" ~/.SpaceVim.d/plugin/jedi.vim
" 在此处加入的可能被其他插件覆盖,去plugin里添加一个修改掉就可以了
map <leader>n :Defx<cr>

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
