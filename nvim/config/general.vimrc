syntax on

let g:python_host_prog = 'python'

let mapleader = "-"
let maplocalleader = "\\"

set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch
set omnifunc=syntaxcomplete#Complete
set digraph

"Display non printable characters:
"	eol      : end of line
"	tab      : tabulation
"	trail    : end of line spaces
"	nbsp     : unbreakable spaces
"	extends  : right overflow
"	precedes : left overflow
set listchars=nbsp:¤,tab:>-,trail:.,extends:>,precedes:<,eol:¶
set list

set laststatus=2

"Line numbers
set relativenumber
set lazyredraw
set number

"Color text that goes over the 80 column
set textwidth=80
set colorcolumn=+1


set t_Co=256

set cursorline
hi CursorLine gui=underline cterm=underline ctermbg=NONE guibg=NONE


set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " MacOSX/Linux

match SpellBad /\<\(\w\+\)\s\+\1\>/
