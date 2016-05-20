call plug#begin('~/.config/nvim/plugged')

"Plug 'bitc/vim-hdevtools'
Plug 'scrooloose/syntastic'
"Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lukerandall/haskellmode-vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'kortina/crosshair-focus.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


call plug#end()

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/local/share/doc/ghc/html/"


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_powerline_fonts = 1
let g:miniBufExplAutoStart = 0
let g:airline#extensions#hunks#enabled = 1

let g:ctrlp_cmd = 'CtrlPMixed'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--ext .js,.jsx'

set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let g:csv_no_column_highlight = 1

set nocompatible


"" " let Vundle manage Vundle
"" " required by Vundle
"" Bundle 'gmarik/vundle'
"" 
"" " Bundles
"" Bundle "pangloss/vim-javascript"
"" Bundle "hallettj/jslint.vim"
"" Bundle "majutsushi/tagbar"
"" Bundle "vim-scripts/VimClojure"

filetype plugin indent on
set autoindent
set background=dark
set backspace=2
set expandtab
"if &filetype != 'vim'
"  set filetype=vim
"endif
set history=50
set hlsearch
set laststatus=2
set mouse=a
set ruler
set shiftwidth=2
set showmatch
" set smartindent
"if &syntax != 'vim'
"  set syntax=vim
"endif
set tabstop=2
set viminfo='20,\"50
if exists('g:nyaovim_version')
  "set gfn=Menlo\ Regular:h11
  "set lsp=3
  "colorscheme koehler
  colorscheme solarized
  "set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
  set vb
  "set guioptions-=T
  "set guioptions-=r
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
elseif has("gui_running")
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
  colorscheme solarized
  set bg=dark
  " Movement between windows
  " map <C-J> <C-W>j
  " map <C-K> <C-W>k
  " map <C-H> <C-W>h
  " map <C-L> <C-W>l
  "cabbrev wnew new
  "cabbrev new tabnew
  " Movement between tabs
  "map <C-J> <C-PageUp>
  "map <C-K> <C-PageDown>
  " Movement between buffers
  map <C-j> :bN<Enter>
  map <C-k> :bn<Enter>
  "map <LocalLeader>f :MBEbf<Enter>
  "map <LocalLeader>b :MBEbb<Enter>
  set hidden
  cabbrev bd MBEbd
  " These interfere with Tagbar
  "map <C-H> <C-PageUp>
  "map <C-L> <C-PageDown>
  " Use these instead, so we can get to the Tagbar window
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

" crosshairs
set cursorline
set cursorcolumn

" width marker
set cc=80,100
