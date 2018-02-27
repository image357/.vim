# .vim
.vim folder with vimrc and plugins

# Clean Setup
```bash
rm -rf $HOME/.vim $HOME/.vimrc && mkdir -p $HOME/.vim && git clone git@github.com:image357/.vim.git $HOME/.vim || git clone https://github.com/image357/.vim.git $HOME/.vim && $HOME/.vim/setup.sh
```

# Dependencies
* python-dev
* ruby-dev
* gcc / make / ...
* The Silver Searcher  
  https://github.com/ggreer/the_silver_searcher

# Plugins
* ack.vim  
  https://github.com/mileszs/ack.vim
* command-t  
  https://github.com/wincent/command-t
* gundo.vim  
  https://github.com/sjl/gundo.vim
* pathogen  
  https://github.com/tpope/vim-pathogen



# References
https://dougblack.io/words/a-good-vimrc.html
