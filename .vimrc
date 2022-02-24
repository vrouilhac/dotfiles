" Use Tim Pope pathogen plugin https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Wakatime plugin for stats
call plug#begin('~/.vim/plugged')
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on	" enables detection of filetype and indent including those inside plugins
syntax on			" enables syntax color

set number 			" show each line it's number in the margin
set numberwidth=6		" set the size of the margin
set relativenumber		" set line number relative to cursor line
set incsearch			" while searching pattern is highlighted
set autoindent			" keeps current indententation when going on next line
set path+=**;/src		" allow tools using path to search downward (ONLY DIRECTORIES)
set shiftwidth=2		" set the width for indent << >>
set softtabstop=2		" set width of a tab
set wrap			" split (visually) lengthy lines
set linebreak			" if line is too long breaks it
set textwidth=80		" maximum number of character before line breaks
set wildmenu			" when using completion will show matching in small popup (go on ztl & run :e ar and press Tab)
set wildmode=list:full		" use a list to show completion from popup (full is used because wildmenu needs it)
set hlsearch			" highlight search patterns
set incsearch			" move the cursor to search that match the pattern as typing it
set foldmethod=indent		" enable the ability to fold block
set scrolloff			" number of lines to keep above/below cursor

set statusline={%t}
set statusline+=\ %m
set statusline+=\ (%q)
set statusline+=\ [b:%n]
set statusline+=\ `%L`

" put the character under curstor to uppercase or lowercase (invert the current case)
nnoremap ,u ~

" mapping to scroll faster the screen
nnoremap <C-J> 6j
nnoremap <C-K> 6k
nnoremap <C-H> ^
nnoremap <C-L> $

iabbrev logs console.log("
iabbrev logo console.log({
nnoremap <C-F> /

" netrw
let g:netrw_liststyle=3		" Change the list tyle 'similar' to nerdtree
nnoremap <C-N> :Explore<CR>

" folding mapping
nnoremap zz za
nnoremap ZZ zA




" WORK IN PROGRESS
set suffixesadd+=.js,.ts,.tsx,.jsx    " makes it true only for certain file types ? 
