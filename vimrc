" Vim syntax file
" Jeff Carouth

" Refresh .vimrc file when modified
autocmd! bufwritepost .vimrc source! %

" Pathogen bundle configuration
" URL: http://www.vim.org/scripts/script.php?script_id=2332
" :filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Remap leader key to comma instead of \
let mapleader = ","

" " turn off vi-compatible mode
set nocompatible

" Diff ignore whitespace
set diffopt+=iwhite

" Change buffer without saving
set hidden

set encoding=utf-8

" File format order of preference
set fileformats=unix,dos,mac

" Enable context-based file indent preferences
filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set shiftround
set autoindent
set smartindent

set linebreak

" Textwidth set to 120 chars
" Not sure if I like this
set textwidth=120

" Syntax highlighting, yes please
syntax on

set showmatch
set nohlsearch
set incsearch

" Set the status line
set stl=%t\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n
" Always show a status line
set laststatus=2

" Very magic regex functionality
:nnoremap / /\v
:vnoremap / /\v

" NERDTree stuff. To auto open or not, that is the question
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

function OpenNERDTree()
    execute ":NERDTree"
    execute ":wincmd p"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()

nmap <ESC>t :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    colorscheme wombat256
endif
:nohls

