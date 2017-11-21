let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
"Vim Interface
Plug 'itchyny/lightline.vim'
"let g:lightline = { 'colorscheme': 'solarized', }               "vim-lightline
set laststatus=2                                                "vim-lightline
set noshowmode                                                  "vim-lightline

"File management
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR> " cycle between buffer
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

"Formatting code
Plug 'tomtom/tcomment_vim'
noremap <silent><Leader>cc :Tcomment<CR>

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#                                   "syntastic
set statusline+=%{SyntasticStatuslineFlag()}                    "syntastic
set statusline+=%*                                              "syntastic
let g:syntastic_always_populate_loc_list = 1                    "syntastic
let g:syntastic_auto_loc_list = 1                               "syntastic
let g:syntastic_check_on_open = 1                               "syntastic
let g:syntastic_check_on_wq = 0                                 "syntastic

Plug 'godlygeek/tabular'
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>



" File navigation (instead of NerdTree)
" absolute width of netrw window
let g:netrw_winsize = -28
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" open file in a new tab
let g:netrw_browse_split = 3

" Code Formatting
" make backspaces delete sensibly
set backspace=indent,eol,start

"Interface
set autowrite
set smartcase
set ignorecase

"Keybindings
inoremap jj <Esc>
inoremap kk <Esc> "These are actually really nice sanity-checks

map <CR> o<Esc>k

"Permissions
cmap w!! %!sudo tee > /dev/null %

