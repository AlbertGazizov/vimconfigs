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

"set iskeyword=!-~,^*,^45,^124,^34,192-255,^_

" save on losing focus
au FocusLost * :wa

" GUI options
set noswapfile
if has("gui_running")
  set transparency=0
  set guifont=Monaco:h14
  set guioptions-=T  "Remove toolbar
  set guioptions=aAce
endif

"turn on syntax highlighting
syntax on

set t_Co=256 "tell the term has 256 colors

"some stuff to get the mouse going in term
"set mouse=
"set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"KeyBindings:
let mapleader=","
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nmap <Leader>mo :Rmodel
nmap <Leader>co :Rcontroller
nmap <Leader>ro :Rview

" FuzzyFinder search in FufCoverageFile mode
nmap <Leader>fe :FufCoverageFile<CR>

" Ctags key
map <Leader>ct :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR>

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
Bundle 'corntrace/bufexplorer'
Bundle 'vim-scripts/matchit.zip'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
"Bundle 'scrooloose/syntastic'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

"colorschemes:
Bundle 'Zenburn'
Bundle 'Wombat'
Bundle 'tpope/vim-vividchalk'
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
"colorscheme wombat
colorscheme vividchalk
set background=dark

" enable sintastic
"let g:syntastic_enable_signs=1

" Removes trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"statusline setup
set statusline=%f       "tail of the filename
set statusline+=%=      "left/right separator
set statusline+=%c,%l     "cursor column
set statusline+=\ %P    "percent through file
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
set laststatus=2

" FuzzyFinder options
let g:fuf_coveragefile_exclude='\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor'
