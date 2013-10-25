set nocompatible
filetype off " required by Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required by Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle "pangloss/vim-javascript"
Bundle "hallettj/jslint.vim"
Bundle "majutsushi/tagbar"

filetype plugin indent on
set autoindent
set background=dark
set backspace=2
set expandtab
if &filetype != 'vim'
	set filetype=vim
endif
set history=50
set hlsearch
set laststatus=2
set mouse=a
set ruler
set shiftwidth=2
set showmatch
" set smartindent
if &syntax != 'vim'
	set syntax=vim
endif
set tabstop=2
set viminfo='20,\"50
set nofoldenable
if has("gui_running")
  set gfn=Menlo\ Regular:h11
	set lsp=3
  "colorscheme koehler
  colorscheme solarized
	set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
	set vb
	set guioptions-=T
	set guioptions-=r
  " Tab stuff
  cabbrev wnew new
  cabbrev new tabnew
  " Movement between tabs
  map <C-J> <C-PageUp>
  map <C-K> <C-PageDown>
  " These interfere with Tagbar
  "map <C-H> <C-PageUp>
  "map <C-L> <C-PageDown>
  " Use these instead, so we can get to the Tagbar window
  map <C-H> <C-W>h
  map <C-L> <C-W>l
else
  " Movement between windows
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
endif
" Movement through wrapped lines
nmap <silent> j gj
nmap <silent> <Down> j
imap <silent> <Down> <C-O>gj
nmap <silent> k gk
nmap <silent> <Up> k
imap <silent> <Up> <C-O>gk

"set ssop="blank,curdir,folds,help,tabpages,sesdir,winsize"
set wmh=0
syntax on
set formatoptions-=o
set formatoptions-=r

" Local directory for swap files
"set directory-=.
"set directory-=~/tmp
set directory=~/tmp/vimswaps//
set directory+=~/tmp//
set directory+=/var/tmp//
set directory+=/tmp//
set directory+=.
"let &directory = "~/tmp/vimswaps,~/tmp," . &directory . ",."

function! ToggleMatchParen()
  if exists("g:loaded_matchparen") 
    :NoMatchParen 
    :echo 'MatchParen plugin turned off' 
  else 
    :DoMatchParen 
    :echo 'MatchParen plugin turned on' 
  endif 
endfunction 
  

" Tagbar
nmap <silent> <F9> :TagbarToggle<CR>


