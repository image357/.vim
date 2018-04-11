#!/bin/bash
set -e

# path variables
BASE_PATH="$HOME/.vim"
ACKVIM_PATH="$BASE_PATH/bundle/ack.vim"
YOUCOMPLETEME_PATH="$BASE_PATH/bundle/YouCompleteMe"


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
git checkout tags/1.0.9
endsetup ack.vim


# setup command-t
startsetup "command-t"
COMMANDTPATH=`ls "$HOME/.vim/bundle/" | grep command-t`
COMMANDTBUILDPATH="$HOME/.vim/bundle/$COMMANDTPATH/ruby/command-t/ext/command-t"

cd "$COMMANDTBUILDPATH"
ruby extconf.rb
make
endsetup "command-t"


# setup YouCompleteMe
startsetup "YouCompleteMe"
cd "$YOUCOMPLETEME_PATH"
git checkout master
endsetup "YouCompleteMe"


# init Helptags
startsetup "vim Helptags"
vim +Helptags +qall
endsetup "vim Helptags"

