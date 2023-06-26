#!/bin/bash
#
# This script is used to setup my development environment on new machine.
# I want this process is as easy as running 
# $ /bin/bash setup.sh
#


# install neovim
# note: OS dependent
# I preferred to keep them all at beginning so that you need to write your password once.
if which brew; then
    # use homebrew if installed
    brew install neovim
    brew install go shellcheck
else
    sudo snap install neovim
    # install go lang which is required to install some linters
    if ! test -e /usr/loca/go ; then
        # sudo apt-get install -y golang-go  # not suitable because it install 1.13
        wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
        sudo     tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
    else
        echo warning: skipping installing go language.
        echo However, shfmt requires go >= 1.19.
    fi
    sudo apt install shellcheck  # for shell linting

fi


# prepare neovim
if ! test -e $HOME/.config/ ; then
    cp -r .config $HOME/  # TODO: handle existing directories
else
    cp -r .config/nvim $HOME/.config/
fi

# install vim-plug for neovim
# source: https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install plugins without confirmation
nvim +PlugInstall +qa  # install plugins

# Install required language servers to work with ALE
# 1. python LSPs
# note: refurb can not be installed on ubuntu, but is installable on mac os!
pip install  -r requirements/python.txt

# 2. bash
pip install -r requirements/bash.txt
# I just mention the below code here since it is related to current context
# But it is called at the beginning for convenience of usage.
# if ! test -e /usr/loca/go ; then
#     sudo apt-get install -y golang-go
# else
#     echo warning: skipping installing go language. However, shfmt requires go >= 1.19.
# fi
go install mvdan.cc/sh/v3/cmd/shfmt@latest

