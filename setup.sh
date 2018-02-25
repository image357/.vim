#!/bin/bash

COMMANDTPATH="$HOME/.vim/bundle/command-t-5.0.2/ruby/command-t/ext/command-t"


echo "----------------------------------------"
echo " start: setup of command-t"
echo "----------------------------------------"
cd $COMMANDTPATH
ruby extconf.rb
make
echo "----------------------------------------"
echo " done: setup of command-t"
echo "----------------------------------------"
