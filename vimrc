set nocompatible "use Vim settings, rather then Vi settings (much better!).
set incsearch "find the next match as we type the search
set hlsearch "hilight searches by default
set number "add line numbers
set wrap linebreak nolist
set encoding=utf-8
set smarttab

"indent settings:
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing

"turn on syntax highlighting
syntax on

set t_Co=256 "tell the term has 256 colors

"some stuff to get the mouse going in term
set mouse=
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"KeyBindings:
let mapleader=","
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nmap <Leader>mo :Rmodel 
nmap <Leader>co :Rcontroller 
nmap <Leader>ro :Rview 

colorscheme wombat


" Configure the Vundle
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
