" Vundle Configuration

" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" More bundles
Bundle 'scrooloose/nerdtree'
Bundle 'rosenfeld/conque-term'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/TwitVim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'davidhalter/jedi-vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'groenewege/vim-less'
Bundle 'othree/html5.vim'
Bundle 'ivanov/vim-ipython'
Bundle 'flazz/vim-colorschemes'
Bundle 'sigilioso/vim-distinguished'

"My Standard options
syntax on
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
" set 2 spaces for html
au FileType html setlocal tabstop=2
au FileType html setlocal sw=2
" set 2 spaces for conf
au FileType conf setlocal tabstop=2
au FileType html setlocal sw=2
" Use markdown syntax for .md files
au BufNewFile,BufRead *.md set filetype=markdown
" Use javascript syntax for .db files (for MongoDB files)
au BufNewFile,BufRead *.db set filetype=javascript
" Use css syntax for less files
au BufNewFile,BufRead *.less set filetype=css
" Just to use templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
" Gnome terminal colors
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
" Gvim stuff
hi Visual term=reverse
hi Visual guibg=blue
hi Folded guibg=brown
"ConqueTerm settings
let g:ConqueTerm_CloseOnEnd = 1
"TwitVim settings
let twitvim_enable_python = 1
" Custom highlight for TagList
highlight default MyTagListFileName guibg=darkblue ctermbg=darkblue
" Undo, history and stuff
set history=1000
set undolevels=1000
set wildignore=*swp,*.pyc
" Colorscheme
colorscheme distinguished
" Spell errors (for spellcheck and others such as pyflakes) with underline
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red gui=undercurl guisp=red
" Python specific settings
au Filetype python setlocal foldmethod=indent
au Filetype python setlocal nofoldenable
au Filetype python highligh OverLength ctermbg=darkblue guibg=darkblue
au Filetype python match OverLength /\%99v.\+/
" <leader>w to remove trailing whitespace
nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
" <leader>n for :NERDTreeTogle
nmap <leader>N :NERDTreeToggle<CR>

" Show trailing whitespaces
hi TrailWhitespace ctermbg=17 guibg=17
match TrailWhitespace /\s\+$\| \+\ze\t/

" jedi-vim configuration

" don't start compleation typing .
let g:jedi#popup_on_dot = 0
" don't show definition of current function
let g:jedi#show_call_signatures = "0"
" use buffers instead of tabs
let g:jedi#use_tabs_not_buffers = 0

" Use directly vim-pyflakes instead of syntastic for python
let g:syntastic_python_checkers=[]

" vim-ipython note:
" Remember you need to connecto to an EXISTING ipython, run: `ipython console`
"
" NERDTree: ignore pyc
let NERDTreeIgnore = ['\.pyc$']
