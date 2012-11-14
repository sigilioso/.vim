"My Standard options
syntax on
colorscheme ch_black
set autoindent
set smartindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set sw=4
set expandtab
set modeline
set hidden
filetype plugin indent on
filetype on
filetype plugin on
set clipboard=unnamed
"Set leader to ,
:let mapleader = ","
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
" 1 tab as 4 spaces for html and files
au FileType html setlocal noexpandtab
au FileType xml setlocal noexpandtab
au FileType javascript setlocal noexpandtab
" Use markdown syntax for .md files
au BufNewFile,BufRead *.md set filetype=markdown
" Use javascript syntax for .db files (for MongoDB files)
au BufNewFile,BufRead *.db set filetype=javascript
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
"Spell errors (for spellcheck and others such as pyflakes) with underline
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red gui=undercurl guisp=Red
" Simplenote plugin credentials
"    let g:SimplenoteUsername = 'your simplenote username' (use double quotes)
"    let g:SimplenotePassword = 'your simplenote password'
"source ~/.simplenoterc
" Custom highlight for TagList
highlight default MyTagListFileName guibg=darkblue ctermbg=darkblue
" Undo, history and stuff
set history=1000
set undolevels=1000
set wildignore=*swp,*.pyc
"Jslint configuration
command! -nargs=0 Jslint exec "!/home/christian/tools/jsl/jsl -conf ~/.jslint/jslint.conf -process %"

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
