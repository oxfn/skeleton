"""Main settings"""
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set noswapfile
set number
set ruler
set shiftwidth=4
set softtabstop=4
set t_vb=
set tabstop=4

"""Key mappings"""
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>i
nmap <F3> :call NERDComment('n', 'Toggle')<CR>
nmap <F9> :nohlsearch<CR>
nmap <F11> :NERDTreeToggle<CR>
nmap <F12> :BufExplorer<CR>

"""Syntax and colorscheme"""
syntax on
filetype plugin indent on
colorscheme slate

