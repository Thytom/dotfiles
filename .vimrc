" Vim/nVim .vimrc
" Author: Archie Hilton
" Email	:	archie.hilton1@gmail.com

let mapleader=','

call plug#begin('~/.vim/plugged')
	Plug 'bfrg/vim-cpp-modern'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'jceb/vim-orgmode'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/goyo.vim'
	Plug 'kovisoft/slimv'
	Plug 'matze/vim-tex-fold'
	Plug 'neovimhaskell/haskell-vim'
	Plug 'rstacruz/sparkup'
	Plug 'tomtom/tcomment_vim'
	Plug 'tpope/vim-markdown'
	Plug 'tpope/vim-surround'
	" Plug 'gabrielelana/vim-markdown'
call plug#end()

" let g:clipboard = {
" 	  \   'name': 'myClipboard',
" 	  \   'copy': {
" 	  \      '+': 'wl-copy',
" 	  \      '*': 'wl-copy',
" 	  \    },
" 	  \   'paste': {
" 	  \      '+': 'xsel -bo',
" 	  \      '*': 'xsel -bo',
" 	  \   },
" 	  \   'cache_enabled': 1,
" 	  \ }

" Swap : and ;. : is used way more
nnoremap ; :
nnoremap : ;

" Some basics:
set nocompatible
filetype plugin on
filetype indent on
syntax on
set encoding=utf-8
set number relativenumber
set nohlsearch
set tabstop=4
" set softtabstop
set noexpandtab
set shiftwidth=0
set ignorecase
set smartcase
set wrap
set linebreak
set visualbell
set numberwidth=6
set foldlevelstart=99

colorscheme archie
set background=dark

let g:asmsyntax = 'nasm'

set vb
set t_vb=

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType tex,md,c,cpp,html set textwidth=80
autocmd FileType md,c,cpp,html set foldmethod=indent
" autocmd FileType tex set foldmethod=syntax
autocmd FileType c,cpp,sh,python,lisp call HLCC ()

nnoremap <leader>p :!lualatex %<CR><CR>
nnoremap <leader>o :!zathura *.pdf &<CR><CR>

" Disable jiangmiao's autopairs for lisp
au FileType lisp let b:autopairs_loaded=1

" Splits open at the bottom and right
set splitbelow splitright

map <SPACE><SPACE> /<++><CR>c4l

" Set Spelling
nnoremap <leader>s :set spell!<CR>

" Better tablation
xnoremap > >gv
xnoremap < <gv

" Better Digraphs
inoremap <expr> <C-K>	BDG_GetDigraph()

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Readmes autowrap text:
autocmd BufRead,BufNewFile *.md set tw=79

" Copy selected text to system clipboard
"	(requires gvim/nvim/vim-x11 installed)
vnoremap <C-c> "+y
map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Visual dragging
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" LaTeX
nnoremap <leader>z i\section{}<ESC>i
nnoremap <leader><leader>z i\subsection{}<ESC>i
nnoremap <leader><leader><leader>z i\subsubsection{}<ESC>i
nnoremap <leader>be i\begin{<++>}<CR>\end{<++>}<ESC>Vk:s/<++>/
nnoremap <leader>bo a\textbf{

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" Faster Quitting if no changes were made
" nnoremap zz :q<CR>

" Highlight 81st column
function! HLCC ()
	highlight ColorColumn ctermbg=yellow
	call matchadd('ColorColumn', '\%81v', 100)
endfunction

" This rewires n and N to do the highlighing
nnoremap <silent> n   n:call HLNext(0.01)<cr>
nnoremap <silent> N   N:call HLNext(0.01)<cr>

" Blink the line containing the match
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	set invcursorline
	redraw
endfunction

" Make tabs, trailing whitespace and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
nnoremap & :set list!<CR>

" Enable Goyo
nnoremap gy :Goyo<CR>

" Easier Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-n> :tabn<CR>

" Start swank server
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"'

