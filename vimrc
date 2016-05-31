" Vundle Configuration

" Use Vundle to manage plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" More bundles
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/taglist.vim'
Plugin 'plasticboy/vim-markdown'
" ./install.py inside plugin folder after installing see <https://github.com/Valloric/YouCompleteMe#user-guide>
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'
Plugin 'hdima/python-syntax'
Plugin 'ivanov/vim-ipython'
Plugin 'sigilioso/vim-distinguished'
Plugin 'bling/vim-airline'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-scripts/TwitVim'
Plugin 'mileszs/ack.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'leafgarland/typescript-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
" requires node and running (`npm install` in bundle directory)
" requires .tern-project file. see 'extra/config/.tern-project' example
Plugin 'ternjs/tern_for_vim'

call vundle#end()
filetype plugin indent on

"Standard options
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
set colorcolumn=100
set mouse=a
filetype plugin indent on
filetype on
filetype plugin on
set clipboard=unnamedplus
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
" set 2 spaces for yaml
au FileType yaml setlocal tabstop=2
au FileType yaml setlocal sw=2
" set 2 spaces for conf
au FileType conf setlocal tabstop=2
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
let python_highlight_all = 1
" <leader>w to remove trailing whitespace
nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
" <leader>n for :NERDTreeTogle
nmap <leader>N :NERDTreeToggle<CR>
" move throught buffers
map <C-j> :bp<CR>
map <C-k> :bn<CR>
map <C-u> :bwipeout<CR>

" Show trailing whitespaces
hi TrailWhitespace ctermbg=17 guibg=17
match TrailWhitespace /\s\+$\| \+\ze\t/

" vim-ipython note:
" Remember you need to connecto to an EXISTING ipython, run: `ipython console`
"
" NERDTree: ignore pyc
let NERDTreeIgnore = ['\.pyc$']

" airline stuff
set laststatus=2 "show statusline even when not splitting
let g:bufferline_echo = 0 "bufferline on top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"syntastic
"note: for python install flake8: pip install flake8
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1

"twit-vim
let twitvim_count = 100

"Rst files preview
:command! Rst :!rst2html.py --stylesheet=$HOME/.vim/extra/style-rst2html.css % > /tmp/rstprev.html && xdg-open /tmp/rstprev.html &> /dev/null
"Insert ipdb with <leader>b
nnoremap <leader>b oimport ipdb;ipdb.set_trace()

" YouCompleteMe configuration
" see: <https://github.com/Valloric/YouCompleteMe#user-guide>
nnoremap <leader>d :YcmCompleter GoTo<CR>
let g:ycm_auto_trigger = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<C-o>'
"Use :YcmCompleter RestartServer [/path/to/python] to restart with other
" python executable

" Ack
" requires ag <https://github.com/ggreer/the_silver_searcher>
let g:ackprg = 'ag --nogroup --nocolor --column'
