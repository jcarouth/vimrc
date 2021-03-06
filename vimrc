" Vim syntax file
" Jeff Carouth <jcarouth@gmail.com>

" Pathogen bundle configuration
" URL: https://github.com/tpope/vim-pathogen
execute pathogen#infect()

filetype plugin indent on
set nocompatible



" Remap leader key to comma instead of \
let mapleader = ","

" vimcasts #24
" Automatically reload vimrc on save
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Quick editing of my vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

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

" Show line numbers
set number

" Syntax highlighting, yes please
syntax on

set showmatch
set nohlsearch
set incsearch

" Set the status line
set stl=%t\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n
" Always show a status line
set laststatus=2

" fix backspace for newlines
set backspace=indent,eol,start


" Key Mappings ----------------------------------------------------------------
:nnoremap ; :

:nnoremap j gj
:nnoremap k gk

" Window navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Very magic regex functionality
:nnoremap / /\v
:vnoremap / /\v

map <leader>cd :cd %:p:h<CR>    " Change directory to current path


cmap w!! w !sudo tee % >/dev/null

" quick buffer switching
"nnoremap <leader><leader> <c-^>

" NERDTree --------------------------------------------------------------------
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

nmap <ESC>t :execute 'NERDTreeToggle ' .getcwd() <CR>

" let NERDTreeShowHidden=1
let NERDTreeIgnore=[".git"]

" snipMate --------------------------------------------------------------------
let g:snips_author = "Jeff Carouth"
" let g:snippets_dir = $HOME . "/.vim/bundle/snipmate.vim/snippets/"

" Color scheme ----------------------------------------------------------------
" :set t_Co=256
" :colorscheme wombat256

" ACK support -----------------------------------------------------------------
set grepprg=ack-grep\ -a
let g:ackprg="ack-grep -H --nocolor --nogroup --colum"
"map <leader>g :Ack

" DASH  -----------------------------------------------------------------------
nmap <silent> <leader>d <Plug>DashSearch

" FileInfo --------------------------------------------------------------------

if has("autocmd")
    autocmd BufWritePre * StripWhitespace

    " treat .phpt, .phtml files as PHP
    autocmd BufNewFile,BufRead *.phpt      set ft=php
    autocmd BufNewFile,BufRead *.phtml     set ft=html.php.js.css
    autocmd BufNewFile,BufRead *.html.twig set ft=html.php.js.css
    autocmd BufNewFile,BufRead *.js.twig   set ft=js

    " LESS for CSS
    autocmd BufNewFile,BufRead *.less      set ft=css

    " Tabs
    autocmd BufRead,BufNewFile *.feature   setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.css       setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.js        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.json      setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.rb        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.json      setlocal tabstop=2 shiftwidth=2 softtabstop=2

endif

" Fugitive (git integration)
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_phpcs_disable = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

map <leader>cs :SyntasticCheck<cr>

" tagbar
nnoremap <silent> <leader>i :TagbarToggle<cr>

" ctrl-p
nnoremap <leader>p :CtrlP<CR>


" Gist
let g:gist_detect_filetype = 1

" YankRing
nnoremap ,y :YRShow<CR>

" Behat
let feature_filetype = 'behat'

" php-namespace
imap <buffer> <leader>u <C-O>:call PhpInsertUse()<cr>
map <buffer> <leader>u :call PhpInsertUse()<cr>
imap <buffer> <leader>e <C-O>:call PhpExpandClass()<cr>
map <buffer> <leader>e :call PhpExpandClass()<cr>

" Presentation colors
function! PresentationMode()
    colorscheme sienna
    set bg=light
    set nolist
    set nonumber
endfunction
nmap <leader>PR :call PresentationMode()<cr>

function! FixDosToUnixLF()
    update
    e ++ff=dos
    setlocal ff=unix
    w
endfunction
nmap <leader>FDU :call FixDosToUnixLF()<CR>
