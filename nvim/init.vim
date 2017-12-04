"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

" Tools
Plug 'dhruvasagar/vim-table-mode'
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Highlight Current Search
Plug 'timakro/vim-searchant'

" Programming
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
" Plug 'neomake/neomake'
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Themes
Plug 'dim13/smyck.vim'
Plug 'vim-airline/vim-airline-themes'

" Approx the terminal colorscheme
" Plug 'godlygeek/csapprox'

" To check
" Plug 'tommcdo/vim-fubitive'
Plug 'vale1410/vim-minizinc'
Plug 'szw/vim-tags'
Plug 'bling/vim-bufferline'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'majutsushi/tagbar'
" Plug 'suan/vim-instant-markdown'
Plug 'xuhdev/vim-latex-live-preview'
" Plug '907th/vim-auto-save'

" To Delete ?
Plug 'dhruvasagar/vim-markify'

call plug#end()


let g:livepreview_engine = 'make'

let g:netrw_winsize = 31

let mapleader = "-"
syntax on

set tabstop=4
set shiftwidth=4
set hlsearch
set omnifunc=syntaxcomplete#Complete
set digraph

match SpellBad /\<\(\w\+\)\s\+\1\>/
"set updatetime=10

"autocmd! CursorHold,CursorHoldI * let @/='\<'.expand('<cword>').'\>'


"Display non printable characters:
"	eol      : end of line
"	tab      : tabulation
"	trail    : end of line spaces
"	nbsp     : unbreakable spaces
"	extends  : right overflow
"	precedes : left overflow
set listchars=nbsp:¤,tab:>-,trail:.,extends:>,precedes:<,eol:¶
set list

"airline
set laststatus=2

let g:airline_theme="base16_chalk"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:bufferline_echo=0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


"Line numbers
set relativenumber
set lazyredraw
set number

"Color text that goes over the 80 column
set textwidth=80
set colorcolumn=+1

"Color Scheme
set t_Co=256
colorscheme smyck
hi CtrlPLinePre guifg=red ctermfg=red
set cursorline
hi CursorLine gui=underline cterm=underline ctermbg=NONE guibg=NONE


command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"NerdTree
"au VimEnter * NERDTree
"au BufEnter * NERDTreeMirrori
"set mouse=a "enable mouse support"
""CTRL-t to toggle tree view with CTRL-t
"nmap <silent> <C-t> :NERDTreeToggle<CR>
""Set F2 to put the cursor to the nerdtree
noremap <F2> :NERDTreeToggle<cr>

" vinegar.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " MacOSX/Linux

" noremap <F2> :Lexplore<cr>
" let g:netrw_winsize = 20
" let g:netrw_list_hide = &wildignore
" let g:netrw_liststyle=3
" let g:netrw_browse_split=4
" let g:netrw_altv=1
" let g:netrw_banner=0

"Syntastic

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

"let g:markify_autocmd = 0
let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'

let g:ale_linters = {
	\ 'latex' : ['chktex'],
	\ 'cpp' : ['clangtidy'],
	\ 'rust' : ['rls', 'cargo'],
	\ 'python' : ['flake8'],
	\}
let g:ale_fixers = {
	\ 'rust' : ['rustfmt'],
	\}
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:airline#extensions#ale#enabled = 1
let g:ale_cpp_clang_options = '-std=c++1z -Wall'
let g:ale_cpp_clangtidy_options = '-std=c++1z -Wall'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_set_highlitghts = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'

let g:ctrlp_root_markers=['Cargo.toml']
let g:ctrlp_working_path='ra'
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(o|exe|so|dll|rlib|lock)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlignore`"'
"language detection
au BufRead,BufNewFile *.c,*.h     set filetype=c
au BufRead,BufNewFile *.cpp,*.hpp set filetype=cpp
au BufRead,BufNewFile Cargo.toml,Cargo.lock set filetype=rust_config
" au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.pas set filetype=pascal

"cargo install racer
"rustup component add rust-src
au FileType rust,rust_config compiler cargo
au FileType rust,rust_config nnoremap <F8> :Make build<cr>
au FileType rust,rust_config nnoremap <F7> :AsyncRun cargo test --color=always<cr>
au FileType rust,rust_config nnoremap <F5> :AsyncRun cargo run<cr>

au FileType c,cpp nnoremap <F8> :AsyncRun make -C build<cr>
au FileType cpp nnoremap <F5> :AsyncRun ./run.sh<cr>
au FileType cpp setlocal foldmethod=indent
au FileType cpp setlocal foldlevel=99

au FileType pascal nnoremap <F8> :AsyncRun fpc -S2 %:t<cr>
au FileType pascal nnoremap <F5> :AsyncRun ./%:r<cr>
"au FileType pascal set foldmethod=indent

"au FileType plaintex,tex nnoremap <F8> :w<cr>:Make<cr>
au FileType plaintex,tex nnoremap <F8> :Make<cr>
" au FileType plaintex,tex nnoremap <F8> :AsyncRun make<cr>
au FileType plaintex,tex set mp=make
" au FileType plaintex,tex nnoremap <F7> :Make clean<cr>
au FileType plaintex,tex nnoremap <F6> :Make print<cr>
au FileType plaintex,tex nnoremap <F5> :!xdg-open *.pdf<cr>
au FileType plaintex,tex set spell spelllang=fr
au FileType plaintex,tex nnoremap <leader>n ]s
au FileType plaintex,tex nnoremap <leader>p [s
au FileType plaintex,tex set foldmethod=indent
au FileType plaintex,tex set foldlevel=0

let g:ycm_python_binary_path = 'usr/bin/python3'
au FileType python nnoremap <F5> :!python3 %<cr>

" Snippets
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
au FileType rust nnoremap <F4> :AsyncRun ctags -f tags --options=$HOME/Developer/rust-master/src/etc/ctags.rust --recurse .<cr>
" see :TagsGenerate

" disabl default long line highlighting in zinc files
let g:zinc_no_highlight_overlong = 1

"nnoremap <F3> :TagbarToggle<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>t <c-]>
nnoremap <leader>T <c-t>

" editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" git shortcut
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Gpush origin HEAD<cr>
nnoremap <leader>gb :Gbrowse<cr>
" Table Mode
nnoremap <leader>tm :TableModeToggle<cr>

function! SPELL_remove_region(region)
	let l:regexp = substitute("\\\\@REGIONNAME{[^}]\\{-}}", "@REGIONNAME", a:region, "")
	let l:region_matcher =
		\ 'syn match texSomevariable "'.l:regexp.'"hs=s+14,he=e-1 containedin=texStatement contains=@NoSpell'
	exec region_matcher
endfunc

function! SPELL_remove_regions(regions)
	for region in a:regions
		call SPELL_remove_region(region)
	endfor
endfunc

" let g:auto_save_silent = 1
" set updatetime=1
" au FileType plaintex,tex let g:auto_save=1

au FileType plaintex,tex nnoremap <leader>se :set spell spelllang=en<cr>
au FileType plaintex,tex nnoremap <leader>sf :set spell spelllang=fr<cr>
au FileType plaintex,tex nnoremap <leader>sd :set nospell<cr>
au FileType plaintex,tex nnoremap <leader>sn :lnext<cr>
au FileType plaintex,tex nnoremap <leader>sp :lprev<cr>
" au FileType plaintex,tex nnoremap <leader>sy :SyntasticCheck<cr>
au FileType plaintex,tex nnoremap <leader>fp mn{!}fmt -w 80<cr>`n

let latex_regions = [
	\ "defref",
	\ "Defref",
	\ "charef",
	\ "secref",
	\ "figref",
	\ "tabref",
	\ "algref",
	\ "expref",
	\ "chasref",
	\ "secsref",
	\ "figsref",
	\ "tabsref",
	\ "algsref",
	\ "expsref",
	\ "textmath",
	\ "lineref",
	\ "linesref",
	\ "complexite",
	\ "cite",
	\ "ref",
	\ "label",
	\ "complexite",
	\ "gls"
\]
au FileType plaintex,tex call SPELL_remove_regions(latex_regions)

" function! SC_highlight()
" 	call SC_used()
" 	highlight scError1 ctermfg=16 ctermbg=151 guifg=fg guibg=#afd7af
" 	highlight scError2 ctermfg=16 ctermbg=187 guifg=fg guibg=#d7d7af
" 	highlight scError3 ctermfg=16 ctermbg=181 guifg=fg guibg=#d7afaf
" 	highlight scError4 ctermfg=16 ctermbg=153 guifg=fg guibg=#afd7ff
" 	highlight scError5 ctermfg=16 ctermbg=143 guifg=fg guibg=#acc267
" 	highlight scError6 ctermfg=16 ctermbg=249 guifg=fg guibg=#b0b0b0
" 	highlight scError7 ctermfg=16 ctermbg=214 guifg=fg guibg=#ffaf00
" 	highlight scError8 ctermfg=16 ctermbg=229 guifg=fg guibg=#ffffaf
" endfunc
" au FileType plaintex,tex nnoremap <leader>sc :call SC_highlight()<cr>


"au FileType plaintex,tex nnoremap <leader>scr1 let g:SC_sensitivity=1
"au FileType plaintex,tex nnoremap <leader>scr2 let g:SC_sensitivity=2
"au FileType plaintex,tex nnoremap <leader>scr3 let g:SC_sensitivity=3
"au FileType plaintex,tex nnoremap <leader>scl3 let g:SC_length=3
"au FileType plaintex,tex nnoremap <leader>scl4 let g:SC_length=4

"highlight scError1 ctermfg=16 ctermbg=151 guifg=fg guibg=#afd7af
"highlight scError2 ctermfg=16 ctermbg=187 guifg=fg guibg=#d7d7af
"highlight scError3 ctermfg=16 ctermbg=181 guifg=fg guibg=#d7afaf
"highlight scError4 ctermfg=16 ctermbg=153 guifg=fg guibg=#afd7ff
"highlight scError5 ctermfg=16 ctermbg=143 guifg=fg guibg=#acc267
"highlight scError6 ctermfg=16 ctermbg=249 guifg=fg guibg=#b0b0b0
"highlight scError7 ctermfg=16 ctermbg=214 guifg=fg guibg=#ffaf00
"highlight scError8 ctermfg=16 ctermbg=229 guifg=fg guibg=#ffffaf
"
nmap <silent> <leader>ps <Plug>(ale_previous)
nmap <silent> <leader>ns <Plug>(ale_next)

nnoremap <leader>q :qa<cr>
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
cnoremap <Up> <nop>
cnoremap <Down> <nop>
cnoremap <Left> <nop>
cnoremap <Right> <nop>
inoremap <c-w> <esc>:w<cr>
nnoremap <c-u> viw~
nnoremap <space> :bnext<cr>
nnoremap <c-@> :bprevious<cr>
nnoremap <c-space> <c-@>
inoremap <c-@> <c-x><c-o>
inoremap <c-space> <c-@>
"cnoremap <c-j> <Home>
cnoremap <c-k> <right>
cnoremap <c-j> <left>
cnoremap <c-l> <s-right>
cnoremap <c-h> <s-left>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <c-l> :nohl<cr><c-l>

" nnoremap <silent> n n:call HLNext(0.4,3)<cr>
" nnoremap <silent> N N:call HLNext(0.4,3)<cr>

" function! HLNext (blinktime, blinks)
	" highlight WhiteOnRed ctermfg=black ctermbg=red
	" let [bufnum, lnum, col, off] = getpos('.')
	" let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	" let target_pat = '\c\%#'.@/
	" let red = matchadd('WhiteOnRed', target_pat, 101)
" endfunction
