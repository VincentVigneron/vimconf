"Setup vimrc for vundle
set nocompatible
filetype off " required

"Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"List of bundles
Bundle 'rust-lang/rust.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-dispatch'
Bundle 'dhruvasagar/vim-markify'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'szw/vim-tags'
Bundle 'SirVer/ultisnips'
"Bundle 'klen/python-mode'
"Bundle 'majutsushi/tagbar'
"End list of bundles


filetype plugin indent on " required

let mapleader = "-"
syntax on

set tabstop=4
set shiftwidth=4

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

"Line numbers
set relativenumber
set lazyredraw
set number

"Color text that goes over the 80 column
set textwidth=90
set colorcolumn=+1
"let &colorcolumn=join(range(90,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27


"Color Scheme
set t_Co=256
"if $COLORTERM == 'gnome-terminal'
"	set t_Co=256 "endif colorscheme lucius
"if $COLORTERM == 'mate-terminal'
"	set t_Co=256 "endif colorscheme lucius
colorscheme lucius
LuciusLightHighContrast

"Code completion
""$cd ~/.vim/bundle/YouCompleteMe
""$
""$git submodule update --init --recursive
""$
""$./install.py --racer-completer
""$./install.py --clang-completer
""$
""$mkdir -p ~/Developer/
""$cd ~/Developer/
""$git clone --depth 1 --branch master https://github.com/rust-lang/rust rust-master
let g:ycm_rust_src_path='$HOME/Developer/rust-master/src'

let g:ycm_global_ycm_extra_conf='$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"NerdTree
"au VimEnter * NERDTree
"au BufEnter * NERDTreeMirrori
"set mouse=a "enable mouse support"
""CTRL-t to toggle tree view with CTRL-t
"nmap <silent> <C-t> :NERDTreeToggle<CR>
""Set F2 to put the cursor to the nerdtree
noremap <F2> :NERDTreeToggle<CR>

"Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%{fugitive#statusline()}
set statusline+=%*

"let g:markify_autocmd = 0
let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:ctrlp_root_markers=['Cargo.toml']
let g:ctrlp_working_path='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

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
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.pas set filetype=pascal

au FileType rust,rust_config compiler cargo
au FileType rust,rust_config nnoremap <F8> :Make build<cr>
au FileType rust,rust_config nnoremap <F7> :Dispatch cargo test --color=always<cr>
au FileType rust,rust_config nnoremap <F5> :Dispatch cargo run<cr>

au FileType cpp nnoremap <F8> :Dispatch make -C build<cr>
au FileType cpp nnoremap <F5> :Dispatch ./run.sh<cr>
au FileType cpp let g:syntastic_cpp_compiler_options='-std=c++1y'

au FileType pascal nnoremap <F8> :Dispatch fpc -S2 %:t<cr>
au FileType pascal nnoremap <F5> :Dispatch ./%:r<cr>
au FileType pascal set foldmethod=indent

au FileType plaintex,tex nnoremap <F8> :Make<cr>
au FileType plaintex,tex nnoremap <F7> :Make clean<cr>
au FileType plaintex,tex nnoremap <F5> :!xdg-open *.pdf<cr>
au FileType plaintex,tex set spell spelllang=fr
au FileType plaintex,tex nnoremap <leader>n ]s<cr>
au FileType plaintex,tex nnoremap <leader>p [s<cr>

let g:syntastic_python_python_exec = 'usr/bin/python3'
let g:ycm_python_binary_path = 'usr/bin/python3'
au FileType python nnoremap <F5> :!python "%p<cr>

let g:syntastic_mode_map = {
	\ 'mode': 'passive',
	\ 'active_file_types': ['rust','cpp','pascal', 'python'],
	\ 'passive_file_types': []
	\}

" Snippets
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
au FileType rust nnoremap <F4> :Dispatch ctags -f tags --options=$HOME/Developer/rust-master/src/etc/ctags.rust --recurse .<cr>
" see :TagsGenerate

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
nnoremap <leader>gp :Gpush origin master<cr>
nnoremap <leader>gb :Gbrowse<cr>
"
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
inoremap <c-w> <esc>:w<cr>
nnoremap <c-u> vwU
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
