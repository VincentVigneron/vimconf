syntax on

" Highlights NOTE setting ---------------------- {{{
fun! SetMyTodos()
    syn match myTodos /\%(NOTE:\)/
    hi link myTodos Todo
endfu
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()
" }}}

" Python setting ---------------------- {{{
let g:python_host_prog = 'python'
" }}}

" Leader setting ---------------------- {{{
let mapleader = "-"
let maplocalleader = "\\"
" }}}

" Tabulation setting ---------------------- {{{
set tabstop=4
set shiftwidth=4
set expandtab
" }}}

" Search setting ---------------------- {{{
set hlsearch
" }}}

" Omnifunc setting ---------------------- {{{
set omnifunc=syntaxcomplete#Complete
" }}}

" Digraph setting ---------------------- {{{
set digraph
" }}}

" White characters setting ---------------------- {{{
"Display non printable characters:
"	eol      : end of line
"	tab      : tabulation
"	trail    : end of line spaces
"	nbsp     : unbreakable spaces
"	extends  : right overflow
"	precedes : left overflow
set listchars=nbsp:¤,tab:>-,trail:.,extends:>,precedes:<,eol:¶
set list
" }}}

" Status line setting ---------------------- {{{
set laststatus=2
" }}}

" Line numbers setting ---------------------- {{{
set relativenumber
set lazyredraw
set number
" }}}

" Textwidth setting ---------------------- {{{
set textwidth=0
set colorcolumn=81,161
" }}}

" Terminal color setting ---------------------- {{{
set t_Co=256
" }}}

" Cursor setting ---------------------- {{{
set cursorline
hi CursorLine gui=underline cterm=underline ctermbg=NONE guibg=NONE
" }}}

" Ignored filetypes setting ---------------------- {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " MacOSX/Linux
" }}}

" Word repetition setting ---------------------- {{{
match SpellBad /\<\(\w\+\)\s\+\1\>/
" }}}

" CtrlP pom.xml  ---------------------- {{{
" # set crltrpxxx=[pom.xml"
" }}}

" Preview setting  ---------------------- {{{
let g:float_preview#docked=0
let g:float_preview#auto_close=1
" }}}
