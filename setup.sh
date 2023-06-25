#!/bin/bash
#
# This script is used to setup my development environment on new machine.
# I want this process is as easy as running 
# $ /bin/bash setup.sh
#


# install neovim
sudo apt install neovim

# install vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

