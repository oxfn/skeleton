set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set ignorecase
set incsearch
set autoindent
set nobackup
set noswapfile
set noerrorbells
set t_vb=
set ruler
set number
"set guifont=DejaVu_LGC_Sans_Mono:h10:cRUSSIAN
set encoding=utf-8
syntax on
colorscheme slate
filetype plugin indent on
"behave mswin

nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>i
nmap <F3> :call NERDComment('n', 'Toggle')<CR>
nmap <F11> :NERDTreeToggle<CR>
nmap <F12> :BufExplorer<CR>

