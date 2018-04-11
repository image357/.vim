#!/bin/bash
set -e
cd "$HOME/.vim"

# init submodules
git submodule update --init
git submodule update --recursive --remote


echo ""
echo "----------------------------------------"
echo " start: setup of command-t"
echo "----------------------------------------"
COMMANDTPATH=`ls "$HOME/.vim/bundle/" | grep command-t`
COMMANDTBUILDPATH="$HOME/.vim/bundle/$COMMANDTPATH/ruby/command-t/ext/command-t"

cd "$COMMANDTBUILDPATH"
ruby extconf.rb
make
echo "----------------------------------------"
echo " done: setup of command-t"
echo "----------------------------------------"


echo ""
echo "----------------------------------------"
echo " start: setup of vim Helptags"
echo "----------------------------------------"
vim +Helptags +qall
echo "----------------------------------------"
echo " done: setup of vim Helptags"
echo "----------------------------------------"

