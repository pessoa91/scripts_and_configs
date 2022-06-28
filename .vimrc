"unset autocommands and mappings before sourcing
au!
mapclear
imapclear
vmapclear
nmapclear
cmapclear

"VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'bitc/vim-bad-whitespace'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
"filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" ========================================================= "

"Highlighting
syntax on

"Search Highlighting
set hlsearch
nm Nh :nohlsearch <CR>
nm <F4> <Esc>:set hls!<CR>
im <F4> <Esc>:set hls!<CR>i

"incremental search (search as you type)
set incsearch

set tabstop=4
set shiftwidth=4

"Spellcheck only some files
"let spell check work on latex files
au BufNewFile,BufRead *.tex set syntax=tex
au BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
au BufNewFile,BufRead *.tex syntax spell toplevel
au BufNewFile,BufRead *.bib syntax spell toplevel
au BufNewFile,BufRead *.tex setlocal lbr
au BufNewFile,BufRead *.tex setlocal shiftwidth=4 "softtabstop=0 smarttab
au BufNewFile,BufRead *.bib setlocal shiftwidth=2 tabstop=2 "softtabstop=0 smarttab

"Fix directory buffer that cannot be closed :(
au FileType netrw setl bufhidden=wipe

" Tabs to spaces in python
au BufNewFile,BufRead *.py setlocal expandtab shiftwidth=4

" Flag bad whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"move to previous/next bad spelled word
nm <F11> [s
nm <F12> ]s

"Move up/down visual lines instead of textlines
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

"set working directory to current window
set autochdir

"Line numbering
set nu

"Show typed commands
set showcmd

"Wrap at word
set wrap
"set linebreak
set nolist  " list disables linebreak

"new approach to save number of tabs
im <F2> <Esc>:execute "silent ! echo ".shellescape(getline('.'))." > /tmp/latestLine.txt ; ~/bin/insertLatex2.sh" <CR>cc<Esc><Up>:r/tmp/latestInsertLatex.txt<CR>/MARKßß<CR>dw:nohlsearch<CR>a

"gvim: no toolbar, no menubar
set guioptions-=T
set guioptions-=m
"no popup windows
set go+=c

"airline configuration
let g:airline#extensions#tabline#enabled = 1

"buffer commands
map k :bprevious!<CR>
map h :bnext!<CR>

"close a buffer
nmap <leader>bq :bp <BAR> bd #<CR>
"keep buffer undo history even when it is hidden
set hidden

"Show possible file completions on Tab (:e command)
set wildmenu
set wildmode=longest,list

" search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Switch between windows with Alt
map <A-1> 1<C-w>w
imap <A-1> <Esc>1<C-w>wi
map <A-2> 2<C-w>w
imap <A-2> <Esc>2<C-w>wi
map <A-3> 3<C-w>w
imap <A-3> <Esc>3<C-w>wi
map <A-4> 4<C-w>w
imap <A-4> <Esc>4<C-w>wi
map <A-5> 5<C-w>w
imap <A-5> <Esc>5<C-w>wi
map <A-6> 6<C-w>w
imap <A-6> <Esc>6<C-w>wi

" Copy / Paste
vmap <A-c> "+y
map <A-v> "+p
map <A-c> "+yy

" Font size
set guifont=Monospace\ 8
" set guifont=FreeMono\ 10

" Fix backspace
set backspace=indent,eol,start

" Search case insensitve
set ignorecase
set smartcase

" YouCompleteMe configuration
let g:ycm_python_binary_path = '/opt/psi/Programming/psi-python37/2018.12/bin/python'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}' ],
	\   '*': [ 're!\w{2}' ],
	\ }

" Syntastic spell checker configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_args =
			\"--disable=invalid-name,missing-docstring,using-constant-test,trailing-newlines,too-few-public-methods,bad-whitespace,bare-except,no-member,bad-continuation,redefined-outer-name,too-many-instance-attributes"

" E231: missing whitespace in func calls
" E226: missing white space around operator
" E261: missing space around inline comments
" E128: continuation line under indented
" E303: too many blank lines
" W391: blank line at EOF
" E123 E126: indentation
" E266: block comments
" E265: comments
" E302: number of blank lines
" E722: bare except
" E701 E702: multiple statements on one line
" E501: line too long
" E305: number of blank lines after function
" E731: Do not assign lambda function
" E402: Imports not on top level
let g:syntastic_python_flake8_args =
			\"--max-line-length=100 --ignore=E701,E702,E722,E302,E265,E266,E123,E126,E231,E226,E261,E128,E303,W391,E501,E305,E731,E402,E225,W605,W405,W605,E262,E221"

