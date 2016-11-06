# .vim

Just my vim configuration


## Setting up

- Follow [Vundle set-up instrunctions](https://github.com/VundleVim/Vundle.vim#quick-start).
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


## youcompleteme

<https://github.com/Valloric/YouCompleteMe>

### Installation

- Install: `cmake python-dev python3-dev nodejs npm`
- Go into plugin directory: `cd ~/.vim/bundle/YouCompleteMe`
- Install: `./install.py --tern-completer`


### Specific for javascript

- Go into _ternjs plugin_ directory: `cd ~/.vim/bundle/tern_for_vim`
- Run installation: `npm install`
- Copy global configuration to your home directory: `cp ~/.vim/extra/config/.tern-config ~`


## vim-autoformat

<https://github.com/Chiel92/vim-autoformat>


Install _js-beautify_ for javascript and html autoformat.

    sudo npm install -g js-beautify
