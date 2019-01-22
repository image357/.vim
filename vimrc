" Init {{{
execute pathogen#infect()
syntax on                   " enable syntax highlighting
filetype plugin indent on   " indentation is filetype specific
let mapleader=","           " set comma as leader
" }}}
" General Settings {{{
set modeline                " enables file specific options
set modelines=2             " search n lines for file specific options

set tabstop=4               " tabstop is n spaces
set softtabstop=4           " tabstop will be displayed as n spaces
set shiftwidth=4            " autoindent will be n spaces
set expandtab               " tabstop will be expanded to spaces
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
    :execute "Rtab python -i " . pyfile
endfunction

function RunPythonSplit()
    :let pyfile = expand("%")
    :write
    :execute "Rsplit python -i " . pyfile
endfunction
" }}}
" Keymaps {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <leader>s :mksession! ~/.vim/session<cr>
nnoremap <leader>l :source ~/.vim/session<cr>

inoremap jk <esc>

tnoremap <Esc> <C-\><C-n>

autocmd FileType python nnoremap <leader>r :exec RunPythonTab()<cr>
" }}}
" Cursor Style {{{
let &t_SI = "\e[6 q"        " slim cursor in insert mode
let &t_SR = "\e[4 q"        " underscore cursor in replace mode
let &t_EI = "\e[2 q"        " wide cursor in normal mode

" set cursor on exit and start
autocmd VimLeave * silent !echo -ne "\e[6 q"
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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'new-tab'
nnoremap <leader>c :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>g :YcmCompleter GoTo<cr>
nnoremap <leader>h :YcmCompleter GetDoc<cr>
" }}}
" vim:foldmethod=marker:foldlevel=0
