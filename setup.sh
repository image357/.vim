#!/bin/bash
set -e

# path variables
BASE_PATH="$HOME/.vim"
ACKVIM_PATH="$BASE_PATH/bundle/ack.vim"
COMMANDT_PATH="$BASE_PATH/bundle/command-t"
YOUCOMPLETEME_PATH="$BASE_PATH/bundle/YouCompleteMe"

# version variables
ACKVIM_VERSION="tags/1.0.9"
COMMANDT_VERSION="tags/5.0.2"
YOUCOMPLETEME_VERSION="master"


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
git submodule update --recursive --remote


# setup ack.vim
startsetup ack.vim
cd "$ACKVIM_PATH"
git checkout "$ACKVIM_VERSION"
endsetup ack.vim


# setup command-t
startsetup "command-t"
cd "$COMMANDT_PATH"
git checkout "$COMMANDT_VERSION"
cd "$COMMANDT_PATH/ruby/command-t/ext/command-t"
ruby extconf.rb
make
endsetup "command-t"


# setup YouCompleteMe
startsetup "YouCompleteMe"
cd "$YOUCOMPLETEME_PATH"
git checkout "$YOUCOMPLETEME_VERSION"
endsetup "YouCompleteMe"


# init Helptags
startsetup "vim Helptags"
vim +Helptags +qall
endsetup "vim Helptags"

