colorscheme admincheg_transp

set nocompatible
set backspace=indent,eol,start
set nobackup

set history=50
set ruler
set showcmd
set incsearch
set nu
set smarttab
set showmatch
set smartindent

" Enable softtab for 4 spaces
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2

set sw=2
set t_Co=256

set list
set listchars=""
set listchars+=tab:->
set listchars+=precedes:<,extends:>
set wildmenu
set autoread
"set relativenumber
set wcm=<Tab>
set encoding=utf-8
set termencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
set hlsearch
set synmaxcol=2048
set foldmethod=syntax
set foldmarker=vimfold\ {,}\ vimfold

syntax on

inoremap {<CR> {<CR>}<ESC>ko
nnoremap <C-E> ,
noremap <leader>p :exe PhpDoc()<cr>

map Q gq

nmap <silent> ,p :set invpaste<CR>:set paste?<CR>
nmap ,ua :call HighlightAllOfWord(1)<cr>
nmap ,uA :call HighlightAllOfWord(0)<cr>
" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <Tab> <C-w><C-w>
nmap <F2> :w<cr>
imap <F2> <esc>:w<cr>i
nmap <F3> :SvnCi<cr>
imap <F3> <esc>:SvnCi<cr>i
nmap <F4> :NERDTreeToggle<cr>
vmap <F4> <esc>:NERDTreeToggle<cr>
imap <F4> <esc>:NERDTreeToggle<cr>i
nmap <C-e> viwy:ta <C-r>0<cr>
imap <C-e> <esc>viwy:ta <C-r>0<cr>
vmap <C-e> <esc>viw:ta <C-r>0<cr>
nmap <C-h> :noh<cr>
vmap <C-h> <esc>:noh<cr>

if &diff
  map <F5> [c
  map <F6> do
  map <F7> dp
  map <F8> ]c
  map <F10> <esc>:qa<cr>
else
  nmap <F5> :BufExplorer<cr>
  imap <F5> <esc>:BufExplorer<cr>
  vmap <F5> <esc>:BufExplorer<cr>
  map <F7> :execute RotateFileFormat()<cr>
  vmap <F7> <C-C><F7>
  imap <F7> <C-O><F7>
  map <F8> :execute RotateEnc()<cr>
  vmap <F8> <C-C><F8>
  imap <F8> <C-O><F8>
endif


let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#utf-8#cp1251#cp866#koi8-r#8bit-cp#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

function! HighlightAllOfWord(onoff)
    if a:onoff == 1
        :augroup highlight_all
            :au!
            :au CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
        :augroup END
    else
        :au! highlight_all
        match none /\<%s\>/
    endif
endfunction
