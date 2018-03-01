if empty(glob('~/.config/nvim/autoload/plug.vim'))

  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Navigation pluggins ---------------------- {{{
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'majutsushi/tagbar'
function! BuildPhpctags(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !make
  endif
endfunction
Plug 'vim-php/tagbar-phpctags.vim', {'do': function('BuildPhpctags') }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-bufferline'
" }}}

" Tools pluggins ---------------------- {{{
" Plug 'dhruvasagar/vim-table-mode'
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-scripts/nextval'
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/Colorizer' " Coloration
Plug 'timakro/vim-searchant' " Highlihht current search
" }}}

" Git pluggins ---------------------- {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" }}}

" Programming pluggins ---------------------- {{{
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'dhruvasagar/vim-markify'
Plug 'othree/xml.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tfnico/vim-gradle'
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
Plug 'w0rp/ale'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'hkupty/iron.nvim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" }}}

" Themes pluggins ---------------------- {{{
Plug 'dim13/smyck.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
" Plug 'godlygeek/csapprox'
" }}}

" Old pluggins ---------------------- {{{
" To check
" Plug 'tommcdo/vim-fubitive'
" Plug 'szw/vim-tags'
" Plug 'xolox/vim-notes'
" Plug 'majutsushi/tagbar'
" Plug 'suan/vim-instant-markdown'
" Plug '907th/vim-auto-save'
" }}}

call plug#end()
