" Init {{{
execute pathogen#infect()
syntax on                   " enable syntax highlighting
filetype plugin indent on   " indentation is filetype specific
" }}}
" General Settings {{{
let mapleader=","           " set comma as leader

set modeline                " enables file specific options
set modelines=2             " search n lines for file specific options

set splitbelow              " open horizontal splits in the lower window
set splitright              " open vertical splits in the right window

set tabstop=4               " tabstop is n spaces
set softtabstop=4           " tabstop will be displayed as n spaces
set shiftwidth=4            " autoindent will be n spaces
set expandtab               " tabstop will be expanded to spaces

set encoding=utf-8           " utf-8 encoding for terminal
set fileencoding=utf-8       " utf-8 file encoding
setglobal fileencoding=utf-8 " utf-8 file encoding
" }}}
" User Interface {{{
set number                  " display line numbers
set showcmd                 " show typed commands
set wildmenu                " show autocomplete suggenstions
set showmatch               " highlight matching brackets
" }}}
" Colorscheme {{{
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
" }}}
" Vim Search {{{
set incsearch               " search while typing
set hlsearch                " highlight searches
set ignorecase              " no case sensitve search
set smartcase               " case sensitve for capital letters

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
" Commands {{{
command! -nargs=* -complete=shellcmd Rtab execute "tabnew | setlocal buftype=nofile | setlocal bufhidden=wipe | setlocal noswapfile | terminal ++curwin ++close <args>"
command! -nargs=* -complete=shellcmd Rsplit execute "new | setlocal buftype=nofile | setlocal bufhidden=wipe | setlocal noswapfile | terminal ++curwin ++close <args>"

function RunPythonTab()
    :let pyfile = expand("%")
    :write
    :let py3exists = executable("python3")
    :if py3exists
    :   execute "Rtab python3 -i " . pyfile
    :else
    :   execute "Rtab python -i " . pyfile
    :endif
endfunction

function RunPythonSplit()
    :let pyfile = expand("%")
    :write
    :let py3exists = executable("python3")
    :if py3exists
    :   execute "Rsplit python3 -i " . pyfile
    :else
    :   execute "Rsplit python -i " . pyfile
    :endif
endfunction
" }}}
" Keymaps {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <leader>s :mksession! ~/.vim/session<cr>
nnoremap <leader>l :source ~/.vim/session<cr>

inoremap jk <esc>

tnoremap <esc> <C-\><C-n>

autocmd FileType python nnoremap <leader>r :exec RunPythonTab()<cr>
" }}}
" Cursor Style {{{
let &t_SI = "\e[6 q"        " slim cursor in insert mode
let &t_SR = "\e[4 q"        " underscore cursor in replace mode
let &t_EI = "\e[2 q"        " wide cursor in normal mode

" set cursor on exit and start
autocmd VimLeave * silent !echo -ne "\e[1 q"
autocmd VimEnter * silent !echo -ne "\e[2 q"
" }}}
" Plugin: ack.vim {{{
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>a :tabnew<CR>:Ack<space>
" }}}
" Plugin: Command-T {{{
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
" }}}
" Plugin: gundo.vim {{{
let g:gundo_prefer_python3 = 1
nnoremap <leader>u :GundoToggle<cr>
" }}}
" Plugin: YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nnoremap <leader>c :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>f :YcmCompleter FixIt<cr>
nnoremap <leader>g :YcmCompleter GoTo<cr>
nnoremap <leader>h :YcmCompleter GetDoc<cr>
" }}}
" vim:foldmethod=marker:foldlevel=0
