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
set ignorecase

"set iskeyword=!-~,^*,^45,^124,^34,192-255,^_

" save on losing focus
au FocusLost * :wa

" GUI options
set noswapfile
set nobackup
set nowritebackup
if has("gui_running")
  set transparency=0
  set guifont=Monaco:h14
  set guioptions-=T  "Remove toolbar
  "set guioptions=aAcegmt
  set guioptions=egmrt
endif

"some stuff to get the mouse going in term
"set mouse=
"set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"KeyBindings:
let mapleader=","
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let NERDTreePressHelp=0

nmap <Leader>mo :Rmodel
nmap <Leader>co :Rcontroller
nmap <Leader>ro :Rview

" Open the spec according to the current file
nmap <Leader>s :call SpecFile()<CR>

"puts yanked text to a new line and aligns it
nmap np :pu<CR>==

"puts yanked text at the end of the line
nmap ep :call setline(line('.'), getline(line('.')) . " ")<CR>$p

"replaces word with yanked
nnoremap S diw"0P

"vertical split and navigation
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Ctags key
map <Leader>ct :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR>

" Vimrc reload
nmap <leader>rc :source $MYVIMRC<CR>

" Fast saving
nmap ;w :w<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Tabs hotkeys
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

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
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'corntrace/bufexplorer'
Bundle 'vim-scripts/matchit.zip'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
"Bundle 'wincent/Command-T'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim'
Bundle 'mrchrisadams/vim-peepopen'
"Bundle 'scrooloose/syntastic'


" vim-scripts repos
Bundle 'L9'

"colorschemes:
Bundle 'Zenburn'
Bundle 'Wombat'
Bundle 'tpope/vim-vividchalk'
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
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

"turn on syntax highlighting
"syntax on

set t_Co=256 "tell the term has 256 colors

syntax enable
set background=dark
"colorscheme wombat
"colorscheme vividchalk
colorscheme solarized

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

" Changes working directory
"cd /Users/albert/Projects/ruby/karmacrm3_app

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

set splitright
function! SpecFile()
  let current_file = @%
  if current_file =~ "_spec\.rb$"
    execute "q"
  else
    let spec_file = substitute(current_file, "app", "spec", "")
    let spec_file = substitute(spec_file, ".rb", "_spec.rb", "")
    let spec_file = substitute(spec_file, "support\/", "", "")
    execute "vsplit ". spec_file
  endif
endfunction
