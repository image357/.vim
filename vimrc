" Init {{{
syntax on                   " enable syntax highlighting
let mapleader=","           " set comma as leader
" }}}
" General Settings {{{
set modeline                " enables file specific options
set modelines=2             " search n lines for file specific options

set tabstop=4               " tabstop is n spaces
set softtabstop=4           " tabstop will be displayed as n spaces
set shiftwidth=4            " autoindent will be n spaces
set expandtab               " tabstop will be expanded to spaces

filetype indent on          " indentation is filetype specific
" }}}
" User Interface {{{
set number                  " display line numbers
set showcmd                 " show typed commands
set wildmenu                " show autocomplete suggenstions
set showmatch               " highlight matching brackets
" }}}
" Vim Search {{{
set incsearch               " search while typing
set hlsearch                " highlight searches

" stop highlighting with leader+space
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
set foldenable              " enalbe folding
set foldmethod=indent       " folding based on identation
set foldlevelstart=10       " autofold when loading at level n
set foldnestmax=10          " maximum allowed nested folds

" toogle fold with space
nnoremap <space> za
" }}}
" Keymaps {{{
nnoremap j gj
nnoremap k gk
inoremap jk <esc>
" }}}
" Cursor Style {{{
let &t_SI = "\e[6 q"        " slim cursor in insert mode
let &t_SR = "\e[4 q"        " underscore cursor in replace mode
let &t_EI = "\e[2 q"        " wide cursor in normal mode

" set slim cursor on exit
autocmd VimLeave * silent !echo -ne "\e[6 q"
" }}}

" vim:foldmethod=marker:foldlevel=0
