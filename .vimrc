"My Standard options
syntax on
colorscheme koehler
set autoindent
set smartindent
set incsearch
set hlsearch
set tabstop=4
set sw=4
set expandtab
set modeline
filetype plugin indent on
filetype on
filetype plugin on
" OmniComplete to F2
imap <f2> <c-x><c-o>
" (Ommicomplete) for specific files
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" 2 spaces for html and files
au FileType html setlocal sw=2 tabstop=2 et
au FileType xml setlocal sw=2 tabstop=2 et
" Use markdown syntax for .md files
au BufNewFile,BufRead *.md set filetype=mkd
" Just to use templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
" Show trailing whitespaces on blue
:highlight TrailWhitespace ctermbg=blue guibg=blue
:match TrailWhitespace /\s\+$\| \+\ze\t/
" Gvim stuff
hi Visual term=reverse
hi Visual guibg=blue
hi Folded guibg=brown
"ConqueTerm settings
let g:ConqueTerm_CloseOnEnd = 1
"TwitVim settings
let twitvim_enable_python = 1
"Spell erros underline
hi clear SpellBad
hi SpellBad cterm=underline

" Latexsuite plugin stuff
" (Install vim-latexsuite)
"  apt-get install vim-latexsuite
"  vim-addons -w install latex-suite
" If there is problems for é...
" Comment on 'envmacros.vim' call Text_SetItemMaps()' line
" For example: /usr/share/vim/addons/ftplugin/latex-suite/envmacros.vim

"filetype plugin on
"let g:Tex_ViewRule_pdf='FoxitReader'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='rubber --inplace --maxerr -1 --short --force --warn all --pdf $*'
"imap <buffer> <M-n> <Plug>Tex_InsertItemOnThisLine

"Spanish spell-checking <F3> (aspell is needed)
"map <F3> <Esc>:w<CR>:!aspell -l es -t -c %<CR>:e! %<CR>
