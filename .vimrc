filetype indent plugin on
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
if has("gui_running")
  set gfn=Menlo\ Regular:h11
	set lsp=3
  "colorscheme koehler_mod
  colorscheme solarized
	set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
	set vb
	set guioptions-=T
	set guioptions-=r
else
  "let g:solarized_termcolors=256
  "colorscheme solarized
endif
" Movement between windows
"map <C-J> <C-W>j
"map <C-K> <C-W>k
if has("gui_running")
  " Movement between tabs
  map <C-K> <C-PageDown>
  map <C-J> <C-PageUp>
  map <C-L> <C-PageDown>
  map <C-H> <C-PageUp>
  cabbrev wnew new
  cabbrev new tabnew
else
  " Movement between windows
  map <C-J> <C-W>j
  map <C-K> <C-W>k
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
  




