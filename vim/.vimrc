set nocompatible               " be iMproved

"VIm Commands
let mapleader = ","

filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/vundle.vim'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/powerline'

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CSApprox'

"Plugin 'vim-scripts/Align'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
call vundle#end()


"Colour scheme options
syntax on
"set background=dark
set t_Co=256
"colorscheme jellybeans
colorscheme molokai
"colorscheme earendel

"LaTeX Options"
"Rubber Macros
"Compile
"nnoremap <leader>c :w<CR> :tabfirst<CR> :lcd %:p:h<CR>:!makeglossaries %:r<CR>:!rubber --pdf --warn all  %<CR>
nnoremap <leader>c :w<CR> :tabfirst<CR> :lcd %:p:h<CR>:!rubber --pdf --warn all  %<CR>

nnoremap <leader>v :tabfirst<CR> :lcd %:p:h<CR> :!evince %:r.pdf &<CR><CR>

"Spell Checking
set spell spelllang=en_gb

"Basic Keys
"set langmap=hk,mj,th,nl,kt,jm,ln
set langmap=sl,jt,tj,kn,nk,ls
"Null
noremap Q <ESC>
nnoremap ; :

"Display options
set title
set wrap
set scrolloff=999
set showcmd
set number
set relativenumber
set linebreak
set tw=85
set fo+=t
"set foldcolumn=12
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set copyindent

noremap <F10> :CentreText<CR>
command! Tc tabclose 

"Search Settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> : noh<cr> :w<cr>


"More useful help
:cabbrev h tab h

"Filetype Options
filetype plugin indent on
syntax on

"Common File Access
"Open .vimrc
nnoremap <leader>rc :tabe ~/.vimrc<CR>:CentreText<CR>

"Centre Text options
command! CentreText :source ~/.vim/VimScripts/CentreText.vim
"hi Normal ctermbg=none

"Run current file in python
nnoremap <leader>,r :!python3 %
