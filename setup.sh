#!/bin/bash
set -e

# path variables
BASE_PATH="$HOME/.vim"
PATHOGEN_PATH="$HOME/.vim/pathogen"
ACKVIM_PATH="$BASE_PATH/bundle/ack.vim"
COMMANDT_PATH="$BASE_PATH/bundle/command-t"
GRUVBOX_PATH="$BASE_PATH/bundle/gruvbox"
GUNDOVIM_PATH="$BASE_PATH/bundle/gundo.vim"
YOUCOMPLETEME_PATH="$BASE_PATH/bundle/YouCompleteMe"

# version variables
PATHOGEN_VERSION="master"
ACKVIM_VERSION="master"
COMMANDT_VERSION="master"
GRUVBOX_VERSION="master"
GUNDOVIM_VERSION="master"
YOUCOMPLETEME_VERSION="master"

# operating system test
CYGTEST=`uname -a | grep -i cygwin | cat`
FBSDTEST=`uname -a | grep -i FreeBSD | cat`

# language support tests
set +e
command -v go > /dev/null
GOTEST="$?"
set -e


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


# setup pathogen
startsetup "pathogen.vim"
cd "$PATHOGEN_PATH"
git checkout "$PATHOGEN_VERSION"
git submodule update --init --recursive
cp "$PATHOGEN_PATH/autoload/pathogen.vim" "$BASE_PATH/autoload/pathogen.vim"
cd "$BASE_PATH"
git update-index --assume-unchanged "autoload/pathogen.vim" 
endsetup "pathogen.vim"


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
if [ "$FBSDTEST" == "" ]; then
    make
else
    gmake
fi
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
    if [ "$GOTEST" == "0" ]; then
        echo "compiling with go completer"
        ./install.py --clang-completer --go-completer
    else
        ./install.py --clang-completer
    fi
else
    git checkout "95efbc87668783be8eadd94945cf6eba70823eea"
    git submodule update --init --recursive
    if [ "$GOTEST" == "0" ]; then
        echo "compiling with go completer"
        ./install.py --clang-completer --system-libclang --go-completer
    else
        ./install.py --clang-completer --system-libclang
    fi
    echo "warning: Cygwin uses system libclang"
fi
endsetup "YouCompleteMe"


# init Helptags
startsetup "vim Helptags"
echo "generating Helptags ..."
vim +Helptags +qall
endsetup "vim Helptags"

