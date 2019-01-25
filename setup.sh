#!/bin/bash
set -e

# path variables
BASE_PATH="$HOME/.vim"
ACKVIM_PATH="$BASE_PATH/bundle/ack.vim"
COMMANDT_PATH="$BASE_PATH/bundle/command-t"
GRUVBOX_PATH="$BASE_PATH/bundle/gruvbox"
GUNDOVIM_PATH="$BASE_PATH/bundle/gundo.vim"
YOUCOMPLETEME_PATH="$BASE_PATH/bundle/YouCompleteMe"

# version variables
ACKVIM_VERSION="master"
COMMANDT_VERSION="tags/5.0.3"
GRUVBOX_VERSION="tags/v3.0.1-rc.0"
GUNDOVIM_VERSION="tags/v2.6.2"
YOUCOMPLETEME_VERSION="master"

# cygwin test
CYGTEST=`uname -a | grep -i cygwin | cat`


# print functions
function startsetup {
    echo ""
    echo "----------------------------------------"
    echo " start: setup of $1"
    echo "----------------------------------------"
    echo ""
}

function endsetup {
    echo ""
    echo "----------------------------------------"
    echo " done: setup of $1"
    echo "----------------------------------------"
    echo ""
}


# init submodules
cd "$BASE_PATH"
git submodule update --init
git submodule update --remote


# setup ack.vim
startsetup "ack.vim"
cd "$ACKVIM_PATH"
git checkout "$ACKVIM_VERSION"
git submodule update --init --recursive
endsetup "ack.vim"


# setup command-t
startsetup "command-t"
cd "$COMMANDT_PATH"
git checkout "$COMMANDT_VERSION"
git submodule update --init --recursive
cd "$COMMANDT_PATH/ruby/command-t/ext/command-t"
ruby extconf.rb
make
endsetup "command-t"


# setup gruvbox
startsetup "gruvbox"
cd "$GRUVBOX_PATH"
git checkout "$GRUVBOX_VERSION"
git submodule update --init --recursive
endsetup "gruvbox"


# setup gundo.vim
startsetup "gundo.vim"
cd "$GUNDOVIM_PATH"
git checkout "$GUNDOVIM_VERSION"
git submodule update --init --recursive
endsetup "gundo.vim"


# setup YouCompleteMe
startsetup "YouCompleteMe"
cd "$YOUCOMPLETEME_PATH"
if [ "$CYGTEST" == "" ]; then
    git checkout "$YOUCOMPLETEME_VERSION"
    git submodule update --init --recursive
    ./install.py --clang-completer
else
    git checkout "95efbc87668783be8eadd94945cf6eba70823eea"
    git submodule update --init --recursive
    ./install.py --clang-completer --system-libclang
    echo "warning: Cygwin uses system libclang"
fi
endsetup "YouCompleteMe"


# init Helptags
startsetup "vim Helptags"
echo "generating Helptags ..."
vim +Helptags +qall
endsetup "vim Helptags"

