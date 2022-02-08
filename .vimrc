"
" +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
" | Last Update: 2022-02-08																		  |
" |																															|
" |	Summary:																										|
" |		- Plugins..........................25											|
" |		- Vim Basics.......................34											|
" |		- AutoCommands.....................34											|
" |	  - Snippets.........................71											|
" |		- Mapping..........................79											|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" |																															|
" +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
"

" ~~~ Plugins ~~~ "

execute pathogen#infect()

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'wakatime/vim-wakatime'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

" ~~~ Vim Basics ~~~ "

set nocompatible
set t_Co=256

syntax on
filetype plugin on

set path+=**
set wildmenu
set wildmode=list
set hlsearch
set incsearch
set laststatus=2
set showcmd
set showmode
set shiftwidth=2
set tabstop=2
set expandtab
set ignorecase 	 
set scrolloff=8  
set scrolljump=1 
set showfulltag
set completeopt=menu,preview,longest
set completepopup=height:10,width:60,highlight:InfoPopup
set completepopup=align:menu,border:off,highlight:Pmenu

set statusline=%f
set statusline+=\ %y
set statusline+=%m
set statusline+=\ buf-%n
set statusline+=\ (%04l/%04L)

" ~~~ AutoCommands ~~~ "
au BufNewFile,BufRead *.ejs set filetype=html

" ~~~ Snippets ~~~
nnoremap ,logo :-1read $HOME/.vim/.snippets/console-log.logo.js<CR>f}i
nnoremap ,logv yiw<ESC>o<ESC>:-1read $HOME/.vim/.snippets/console-log.logo.js<CR>f}hp
nnoremap ,logs :-1read $HOME/.vim/.snippets/console-log.logs.js<CR>f"wwi
nnoremap ,rfc :-1read $HOME/.vim/.snippets/react-fc-component.js<CR>2jeli
nnoremap ,html :-1read $HOME/.vim/.snippets/html-squeleton.html<CR>:setlocal 4jf<;i
