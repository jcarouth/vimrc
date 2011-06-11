" Vim syntax file
" Jeff Carouth
"

" PREAMBLE --------------------------------------------------------------------
filetype off
" Pathogen bundle configuration
" URL: http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible

" Refresh .vimrc file when modified
autocmd! bufwritepost .vimrc source! %

" Remap leader key to comma instead of \
let mapleader = ","

" Diff ignore whitespace
set diffopt+=iwhite

" Change buffer without saving
set hidden

set nobackup        " it's not the 70s anymore
set noswapfile      " ditto

set pastetoggle=<F2>    " clean up paste indents

set encoding=utf-8

" File format order of preference
set fileformats=unix,dos,mac

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set shiftround
set autoindent
set smartindent

set linebreak

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

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps
:nnoremap ; :       " because <shift>:w<return> is too time consuming

:nnoremap j gj      " jump visual lines up and down
:nnoremap k gk

" Window navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Very magic regex functionality
:nnoremap / /\v
:vnoremap / /\v


cmap w!! w !sudo tee % >/dev/null

" NERDTree --------------------------------------------------------------------
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

nmap <ESC>t :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=[".git"]

" snipMate --------------------------------------------------------------------
let g:snips_author = "Jeff Carouth"
" let g:snippets_dir = $HOME . "/.vim/bundle/snipmate.vim/snippets/"

let rtp += $HOME . "/.vim/snippets"

if has("gui_running")
    colorscheme wombat256
endif
:nohls

" Abbreviations ---------------------------------------------------------------
iabbrev jc@ jcarouth@gmail.com
iabbrev jct@ jcarouth@tamu.edu
iabbrev te. tamu.edu

