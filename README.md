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

# Plugins
* pathogen  
  https://github.com/tpope/vim-pathogen
* command-t  
  https://github.com/wincent/command-t
* ack.vim  
  https://github.com/mileszs/ack.vim

# References
https://dougblack.io/words/a-good-vimrc.html
