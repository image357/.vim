# .vim
.vim folder with vimrc and plugins

# Clean Setup
```bash
rm -rf "$HOME/.vim" "$HOME/.vimrc" && mkdir -p "$HOME/.vim" && git clone git@github.com:image357/.vim.git "$HOME/.vim" || git clone https://github.com/image357/.vim.git "$HOME/.vim" && "$HOME/.vim/setup.sh"
```

# Dependencies
* python2-dev / python3-dev
* ruby-dev
* gcc / make / cmake
* clang / libclang-devel / libc++-dev
* The Silver Searcher  
  https://github.com/ggreer/the_silver_searcher

# Plugins
* ack.vim  
  https://github.com/mileszs/ack.vim
* command-t  
  https://github.com/wincent/command-t
* gruvbox
  https://github.com/morhetz/gruvbox
* gundo.vim  
  https://github.com/sjl/gundo.vim
* pathogen  
  https://github.com/tpope/vim-pathogen
* YouCompleteMe  
  https://github.com/Valloric/YouCompleteMe



# References
https://dougblack.io/words/a-good-vimrc.html
