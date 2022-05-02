set shell=/bin/bash
let mapleader = "\<Space>"

set background=dark
syntax on

" Quick-save
nmap <leader>w :w<CR>

" =================================================================
" # PLUGINS
" =================================================================

set nocompatible

call plug#begin()

" GUI enhancements
Plug 'gruvbox-community/gruvbox'
"Plug 'itchyny/lightline.vim'
"Plug 'junegunn/goyo.vim'

" Semantic Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sheerun/vim-polyglot'


" Syntactic Language Support
"Plug 'rust-lang/rust.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty'

" Fuzzy Finder
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim'


call plug#end()

" Lightline
let g:lightline = {
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 		[ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\ 	'filename': 'LightlineFilename',
	\ 	'cocstatus': 'coc#status'
	\},
	\}
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()


" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it is default 4000
set updatetime=300

" =================================================================
" # Editor settings
" =================================================================
set autoindent
set encoding=utf-8
set scrolloff=8
set showmatch		" Show matching brackets
set hidden		" Hide buffers when they are abandoned
set signcolumn=yes	" Always draw sign column. Prevent buffer moving when add/del sign
set colorcolumn=80

" Sane splits
set splitright
set splitbelow

" Proper Search
set incsearch
set ignorecase
set smartcase
set gdefault

" Center Search Results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" =================================================================
" # GUI settings
" =================================================================
set showcmd 		" Show (partial) command in status line.
set backspace=2		" Backspace over newlines
set number 		" Also show current absolute line
set relativenumber 	" Relative line numbers
set mouse=a		" Enable mouse usage (all modes)
set diffopt+=iwhite	" No whitespace in vimdiff

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set termguicolors

colorscheme gruvbox

highlight Normal guibg=none


" =================================================================
" # Keyboard shortcuts
" =================================================================
" ; as :
nnoremap ; :

" Ctrl+c and ctrl+j as Esc
" We also map Ctrl+k
inoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc> 
lnoremap <C-k> <Esc> 
tnoremap <C-k> <Esc> 

nnoremap <C-c> <Esc> 
inoremap <C-c> <Esc> 
vnoremap <C-c> <Esc> 
snoremap <C-c> <Esc> 
xnoremap <C-c> <Esc> 
cnoremap <C-c> <Esc> 
onoremap <C-c> <Esc> 
lnoremap <C-c> <Esc> 
tnoremap <C-c> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Smart' navigation
" Use tab for trigger completion with charaters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not
" mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
noremap <leader>g :Goyo<CR>

" ==================================================================
" # Autocommands
" ==================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave pastemode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
	au BufReadPost * if expand('%p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown


" ==================================================================
" # Footer
" ==================================================================

" nvim
" if has('nvim')
"	runtime! plugin/python_setup.vim
" endif
