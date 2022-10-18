syntax on
filetype on
filetype plugin indent on

set nocompatible
set hidden
set nowrap        " don't wrap lines

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'purescript-contrib/purescript-vim'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Plug 'shivamashtikar/vimmer-ps'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" let g:purescript_disable_indent = 1
let g:purescript_indent_case = 2
let g:purescript_indent_let = 2
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2
let g:purescript_indent_instance = 0

highlight Pmenu ctermbg=gray guibg=gray
" highlight Pmenu ctermbg=8 guibg=#A0A0A0
" highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
" highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

call plug#end()

nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

imap <C-a>  -> 
imap <C-d>  :: 
imap <C-s>  => 
imap <C-w> where
imap <C-t> import 
imap <C-q> qualified as 

map <F5> :exe "!tmux send -t 2 'make build' Enter"<CR><CR> 
map <F6> :exe "!tmux send -t 2 'make test' Enter"<CR><CR>
map <F9> :exe "!tmux send -t 2 'make run' Enter"<CR><CR> 
imap <F5> :exe "!tmux send -t 2 'make build' Enter"<CR><CR> 

" map <F5> :exe "!tmux send -t 2 'cabal new-build all' Enter"<CR><CR> 
" map <F6> :exe "!tmux send -t 2 'cabal new-test --test-show-details=always --test-options=\"--color always\"' Enter"<CR><CR>
" imap <F5> :exe "!tmux send -t 2 'cabal new-build all' Enter"<CR><CR> 

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun


" Using file extension
autocmd BufWritePre *.scala,*.kt,*.yaml,*.cabal,*.hs,*.h,*.c,*.java,*.purs :call <SID>StripTrailingWhitespaces()

hi! link FoldColumn Normal
set foldcolumn=1 

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab 

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
" set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set autowrite 
set autowriteall

set background=light
colorscheme PaperColor

hi Visual term=reverse cterm=reverse guibg=Grey

" Russian support
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


