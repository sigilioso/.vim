set nocompatible
filetype off

" -------------- plugins --------------
" plugin management with vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/taglist.vim'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim'
Plug 'hdima/python-syntax'
Plug 'sigilioso/vim-distinguished'
Plug 'bling/vim-airline'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mileszs/ack.vim'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
" requires .tern-project file. see 'extra/config/.tern-project' example
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" ---
Plug 'terryma/vim-multiple-cursors'
" Requires go up and running and GOPATH environment variable set
Plug 'fatih/vim-go'
" ---
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()
" -------------- end plugins --------------


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
set showcmd
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
" set 2 spaces for some languages
au FileType yaml setlocal tabstop=2
au FileType yaml setlocal sw=2
au FileType javascript setlocal tabstop=2
au FileType javascript setlocal sw=2
au FileType less setlocal tabstop=2
au FileType less setlocal sw=2
au FileType css setlocal tabstop=2
au FileType css setlocal sw=2
au FileType pug setlocal tabstop=2
au FileType pug setlocal sw=2
au FileType html setlocal tabstop=2
au FileType html setlocal sw=2
au FileType conf setlocal tabstop=2
au FileType conf setlocal sw=2
" Use markdown syntax for .md files
au BufNewFile,BufRead *.md set filetype=markdown
" Use javascript syntax for .db files (for MongoDB files)
au BufNewFile,BufRead *.db set filetype=javascript
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
nnoremap <leader>q :bp<CR>:bd #<CR>

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

"Rst files preview
:command! Rst :!rst2html.py --stylesheet=$HOME/.vim/extra/style-rst2html.css % > /tmp/rstprev.html && xdg-open /tmp/rstprev.html &> /dev/null
"Md files preview
:command! Md :!python -m markdown % > /tmp/mdprev.html && xdg-open /tmp/mdprev.html &> /dev/null
"Insert ipdb with <leader>b
nnoremap <leader>b oimport ipdb;ipdb.set_trace()

"vim-markdown
let g:vim_markdown_folding_disabled = 1

" deoplete configuration
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
" toggle on <TAB>
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = ''
let g:jedi#usages_command = ''
let g:jedi#completions_enabled = 1 "<C-Space>
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#auto_close_doc = 1

" deoplete ternjs
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" deplete go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" Ack
" requires ag <https://github.com/ggreer/the_silver_searcher>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Emmet (<ctrl>+y ,)
let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '  '
\  }
\}
