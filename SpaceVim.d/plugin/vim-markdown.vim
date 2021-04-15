"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""Vim-markdown Plugin  :Toc 预览
""""" https://github.com/plasticboy/vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_math = 1     							" 禁用 LaTeX语法
let g:vim_markdown_conceal_code_blocks = 0                  " 禁止隐藏代码块标注
let g:vim_markdown_auto_extension_ext ='txt' 				" 更改默认文件扩展名
let g:vim_markdown_no_default_key_mappings = 1     			" 禁用默认键映射，此时下面的指令不可用
" zM zR zc zo
"let g:vim_markdown_folding_disabled = 0     				" 禁用折叠，取消则打开时默认白折叠所有标题
"let g:vim_markdown_folding_style_pythonic = 1  				" 更改折叠样式-类似python-mode的样式折叠
let g:vim_markdown_override_foldtext = 0 					" 为了防止设置折叠文本
let g:vim_markdown_folding_level = 6   						" 设置折叠级别-标题折叠级别是1到6之间的数字
let g:vim_markdown_toc_autofit = 1   						" 启用TOC窗口自动调整
let g:vim_markdown_emphasis_multiline = 0  					" 限制单行文本
"let g:vim_markdown_fenced_languages = ['csharp=cs']    		" 代码块语言-默认值为['c++ = cpp','viml = vim','bash = sh','ini = dosini']
let g:vim_markdown_strikethrough = 1    					" 使用删除线

" 自动表格
map <leader>m :TableModeToggle<cr>

