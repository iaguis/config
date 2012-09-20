set nocompatible

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

source ~/.vimrc_python

set ruler
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
syntax on
set background=dark
set autoindent

" Bash style autocompletion
set completeopt+=longest
set wildmode=longest,list,full
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
" Highlight searches
set hls
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Save undo history on exit
set undofile

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has("autocmd")
    filetype indent on
endif

" Show info about the current command
set showcmd

" Jump cursor to matching bracket
" set showmatch

" Incremental search
set incsearch

" Confirmation on exit
set confirm

set autowrite
set hidden
" Use mouse
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

function InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col-1] !~ '\k'
	return "\<tab>"
    elseif "backward" == a:direction
	return "\<c-p>"
    else
	return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>
nmap <c-Right> <Esc>:tabn<cr>
nmap <c-Left> <Esc>:tabp<cr>
autocmd BufRead .m,.oct nmap <F5> :!clear && octave %<CR>

au FileType gitcommit set tw=72
au BufNewFile,BufRead *.cl set filetype=opencl

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=8
endfunction
au FileType c,cpp call GnuIndent()

" Autoclose configuration

let delimitMate_matchpairs = "(:),[:]"


set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme wombat256
set cursorline
