" Use Tim Pope pathogen plugin https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Wakatime plugin for stats
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jason0x43/vim-js-indent'
Plug 'eliba2/vim-node-inspect'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
" set foldmethod=indent		" enable the ability to fold block
set scrolloff=8			" number of lines to keep above/below cursor
set laststatus=2		" allows to always show the statusline
set undofile			" enable the save of undo history under a undofile
set undodir="~/.vim/undo_dir"	" precise location dir of undofiles
set complete+=k./src/**		" this tells vim to use every files that are avaible under src for it's autocomplete feature
set exrc

set statusline={%t}
set statusline+=\ %m
set statusline+=\ (%q)
set statusline+=\ [b:%n]
set statusline+=\ `%L`

" put the character under curstor to uppercase or lowercase (invert the current case)
nnoremap ,u ~

" mapping to scroll faster the screen
nnoremap <C-J> 7j
nnoremap <C-K> 7k
vnoremap <C-J> 7j
vnoremap <C-K> 7k
nnoremap <C-H> ^
nnoremap <C-L> $

iabbrev logs console.log("
iabbrev logo console.log({
nnoremap <C-F> /

" netrw
let g:netrw_liststyle=3		" Change the list tyle 'similar' to nerdtree
let g:netrw_winsize=18		" Change the default absolute size of the window
let g:netrw_browse_split=0
let g:netrw_banner=0
nnoremap <C-N> :Lexplore<CR>

" folding mapping
nnoremap zz za
nnoremap ZZ zA

" Mapping of lists
nnoremap (b :bprevious<CR>
nnoremap )b :next<CR>
nnoremap )B :buffers<CR>
nnoremap )db :bwipeout<CR>

nnoremap )Q :copen<CR>

" WORK IN PROGRESS
set suffixesadd+=.js,.ts,.tsx,.jsx    " makes it true only for certain file types ? 
" set wildignore=
let mapleader = " "
nnoremap <Leader>* :nohlsearch<CR>
set background=dark		" useful to keeps good colors while using tmux
set re=0
colorscheme minimalist

command -nargs=+ VincSearch :silent grep -r "<args>" src 
nnoremap <Leader>f :VincSearch 
nnoremap <Leader>F :find src/**/
let b:ale_fixers = ['prettier', 'eslint']

nnoremap <C-I>s :NodeInspectStart<CR>
nnoremap <C-I>S :NodeInspectStop<CR>
nnoremap <C-I>n :NodeInspectStepOver<CR>

let mapleader = ","
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>
nnoremap <C-P> :FZF src<CR>

let g:ale_set_highlights = 0
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😐'
