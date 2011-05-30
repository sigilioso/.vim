"Opciones varias
syntax on
colorscheme koehler
set autoindent
set smartindent
set incsearch
set hlsearch
set tabstop=4
set sw=4
set expandtab
filetype plugin indent on
filetype on
filetype plugin on
" OmniComplete en F2
imap <f2> <c-x><c-o>
"Reconocimiento de ficheros y autocompletado (Ommicomplete)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"Para utilizar templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
"Para gvim
hi Visual term=reverse
hi Visual guibg=blue
hi Folded guibg=brown

"Cosas para plugin latexsuite
" (Instalar con lo siguiente, o desde la web)
"apt-get install vim-latexsuite
"vim-addons -w install latex-suite
" Si a pesar de la última línea sigue dando problemas la e con tilde,
" comentar en el fichero
" /usr/share/vim/addons/ftplugin/latex-suite/envmacros.vim
" La línea en la que ponga: call Tex_SetItemMaps()
" cerca del final del fichero.

"filetype plugin on
"let g:Tex_ViewRule_pdf='FoxitReader'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='rubber --inplace --maxerr -1 --short --force --warn all --pdf $*'
"imap <buffer> <M-n> <Plug>Tex_InsertItemOnThisLine

"Corrección ortográfica de archivos latex con aspell en español, uso de <F3>
"map <F3> <Esc>:w<CR>:!aspell -l es -t -c %<CR>:e! %<CR>
