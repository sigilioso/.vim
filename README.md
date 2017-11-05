# .vim

Just my vim configuration

## Setup neovim using the same configuration

- [Install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
- Install python2 and python3 support

```bash
    sudo pip2 install neovim
    sudo pip3 install neovim
```

- Create `~/config/nvim/init.vim` file with

```
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vim/vimrc
```

### Optional bashrc config

```bash
alias vim='nvim'
alias vi='nvim'
export EDITOR=nvim
```

## Setting up

- Follow [Vim-pug installation instructions](https://github.com/junegunn/vim-plug).
- **exuberant-ctags** package is required, given the _vimrc_ configuration.

- It is recommended to install **vim-gnome** (or similar desktop integration) to make vim use
the system clipboard.
- In order to use **Rst** custom command you need to install **rst2html.py**. Example: (`sudo pip install rst2html5`)
- In order to use **Md** custom command, you need to install **markdown** and **pygments** Example (`sudo pip install markdown Pygments`)


## Plugins specific configuration

## syntastic

<https://github.com/vim-syntastic/syntastic>

### python syntax

Ensure **flake8** is installed in the corresponding virtualenv

    pip install flake8

### javascript syntax

    npm install -g jshint


## vim-autoformat

<https://github.com/Chiel92/vim-autoformat>


Install _js-beautify_ for javascript and html autoformat.

    sudo npm install -g js-beautify


## Ack


It is configured to work with [ag](https://github.com/ggreer/the_silver_searcher).

    sudo apt-get install silversearcher-ag
