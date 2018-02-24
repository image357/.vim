" syntax highlighting
syntax on

" colorscheme
" colorscheme badwolf

" tabstop settings
set tabstop=4
set softtabstop=4
set expandtab


" display line numbers
set number

" show typed commands
set showcmd

" display cursor line
set cursorline

" identation - file specific
filetype indent on

" show autocomplete suggestions
set wildmenu

" redraw less
" set lazyredraw

" highlight parenthesis
set showmatch

" vim search
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" folding
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za

" movement
nnoremap j gj
nnoremap k gk

