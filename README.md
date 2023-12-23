# .vim
.vim folder with vimrc and plugins

# Clean Setup
```bash
rm -rf "$HOME/.vim" "$HOME/.vimrc" && mkdir -p "$HOME/.vim" && git clone git@github.com:image357/.vim.git "$HOME/.vim" || git clone https://github.com/image357/.vim.git "$HOME/.vim" && bash "$HOME/.vim/setup.sh"
```

# Dependencies
* python3-dev
* ruby-dev
* golang
* gcc / (g)make / cmake
* clang / libclang-devel / libc++-dev / libcxx-devel
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
* nerdcommenter  
  https://github.com/preservim/nerdcommenter
* pathogen  
  https://github.com/tpope/vim-pathogen
* YouCompleteMe  
  https://github.com/Valloric/YouCompleteMe

# References
https://dougblack.io/words/a-good-vimrc.html

# Bindings and Features
The `<leader>` key is mapped by default to `comma` which has the same position on international and language specific keyboards.
You can change this setting in `$HOME/.vim/vimrc`.

### Normal Mode
* **`<leader> u`**  
  Advanced undo command with tree structure and incremental diff of every change. Current position is indicated by `@`.
  Navigate with arrows or `hjkl`. Press `enter` to apply change. Press `p` to show difference to current position.
  Close advanced undo by pressing `<leader> u` again.
  
* **`<leader> a`**  
  Open a new tab and start a recursive search for a given expression in all files beneath your current working directory.
  Hidden files and gitignored files are ignored.
  You can view the files by pressing `o` or open them in a new tab by pressing `t`. To close the file browser press `q`.
  
* **`<leader> t`**  
  Browse all files relative to your current working directory. `enter` will open them in a new tab. `<ctrl>+c` will close the file browser.
  
* **`<leader> b`** / **`<leader> j`**  
  Browse open buffers / jumplist (like `<leader> t`).
  
* **`<leader> r`**  
  If the current file is a python script, run it in an interactive terminal session.
  Caution: The file will be written to disk before.
  
* **`<leader> g`**  
  Goto the function/module/variable definition under the cursor position.
  
* **`<leader> h`**  
  Open the function/module/variable docstring in a preview window.
  
* **`<leader> <space>`**  
  Stop highlighting search results.
  
* **`<space>`**  
  Toogle code folding.
  
* **`<leader> s`**  
  Save current vim session.
  
* **`<leader> l`**  
  Load previously saved vim session.
  
### Insert Mode
* **`jk`**  
  Leave insert mode and start normal mode.
  
* **`<ctrl> + <space>`**  
  Force autocompletion at the current position.
  
* **`<tab>`** / **`<shift> + <tab>`**  
  Cycle through the autocompletion suggestions.

### All Modes
* **`<ctrl> + /`**  
  Toggle comments for the selected lines.
  
### Autocompletion
C/C++ autocompletion needs a `.ycm_extra_conf.py` file in the current directory. If there is none, the default file `$HOME/vim/utility/ycm_extra_conf.py` will be used. Python autocompletion works out of the box, but can use an extra-conf-file (for setting up virtualenvs etc.).
