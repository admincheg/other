
" Set variables {{{
set ar
set autoindent
set backspace=start,indent,eol
set clipboard=unnamed
set copyindent
set dir=~/.vim/tmp
set encoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
set foldenable
set foldmethod=marker
set hlsearch
set ignorecase
set laststatus=2
set nobackup
set nocompatible
set noexpandtab
set nosmarttab
set nu
set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set showmatch
set showmode
set smartcase
set smartindent
set softtabstop=2
set statusline=%F%m%r%h%w\ <\ FORMAT=%{&ff}\ %{&ft}\ <\ TYPE=%Y\ <\ POS=%l,%v\ %p%%\ <\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set synmaxcol=2048
set t_Co=256
set tabstop=2
set termencoding=utf-8
set wildchar=<TAB>
set wildmenu
set wrapscan
" }}}

" Enable functionally {{{
colorscheme admincheg_transp
syntax on
" }}}

" Filetype configs {{{
filetype on
filetype indent on
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set expandtab
" }}}

" Cursor settings {{{
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" }}}

" Autoreload config {{{
autocmd! bufwritepost .vimrc source ~/.vimrc
" }}}

" Airline {{{
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = "murmur"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#branch#use_vcscommand = 1

" }}}

" PHPQA {{{
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codecoverage_autorun = 1
" }}}

" Snippets {{{
let g:snips_author = 'Павлихин Илья <vistilya@gmail.com>'
" }}}

" NERDTree {{{
let g:NERDTreeWinPos = "right"
" }}}

" Bindings {{{
	" Codes {{{
	" Для вставки кодов используй <C-V><сочетание>
	"
	" Используемое
	" [11^ - <C-F1>
	" [12^ - <C-F2>
	" [13^ - <C-F3>
	" }}}

	" Keys {{{
		map <silent> [11^ <plug>ToggleProject

		map <F2> :w<CR>
		map! <F2> <ESC>:w<CR>li

		map [12^ :VCSUp<CR>
		map! [12^ <ESC>:VCSUp<CR>

		map <silent> <F3> :NERDTreeToggle<CR>

		map [13^ :VCSCommit<CR>
		map! [13^ <ESC>:VCSCommit<CR>

		map <Tab> <C-W><C-W>
	" }}}
" }}}
