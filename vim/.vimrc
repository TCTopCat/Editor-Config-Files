let mapleader = "\<Space>"

"---------------------------------------------------------------

"Automatically install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"--------------------------------------------------------------

call plug#begin('~/.vim/plugged')
"Vim Interface
Plug 'itchyny/lightline.vim'
set laststatus=2                                                "vim-lightline
set noshowmode                                                  "vim-lightline
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake

Plug 'godlygeek/tabular'
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

"Display
Plug 'junegunn/limelight.vim'
Plug 'rakr/vim-one'

call plug#end()
"-------------------------------------------------------------------------

" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <Leader>rc :vsplit $MYVIMRC<CR>


"Display
"------------------------
set termguicolors
set inccommand=nosplit

colorscheme one
set background=dark
let g:one_allow_italics = 1
let g:airline_theme = 'one'

"Hybrid numbering system
set number relativenumber

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set showmatch "Show matching brackets"
set formatoptions+=o
set textwidth=0
set nojoinspaces

if !&scrolloff
	set scrolloff=3
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
"----------------------------

" File navigation (instead of NerdTree)
" absolute width of netrw window
let g:netrw_winsize = -28
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" open file in a new tab
let g:netrw_browse_split = 3

" Code Formatting-------------------"
syntax on
filetype plugin indent on
"-----------------------------------"

"Interface
set autowrite
set ignorecase
set smartcase
set gdefault
set magic "Extends regular expressions to use 'magic' patterns."

"Keybindings
inoremap jj <Esc>
inoremap kk <Esc> "These are actually really nice sanity-checks
map <CR> o<Esc>k
nnoremap s :
nmap <Leader>s :%s//g<Left><Left>
nnoremap Q @q

"Permissions
cmap w!! %!sudo tee > /dev/null %

"Inbuilt terminal for neovim
"--------------------------------------
tnoremap <Esc> <C-\><C-n>
"--------------------------------------
