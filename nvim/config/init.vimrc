if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Navigation pluggins ---------------------- {{{
Plug 'ncm2/float-preview'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'maximbaz/lightline-ale'
Plug 'rking/ag.vim'
"Plug 'Chun-Yang/vim-action-ag'
Plug 'majutsushi/tagbar'
function! BuildPhpctags(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        !make
    endif
endfunction
Plug 'vim-php/tagbar-phpctags.vim', {'do': function('BuildPhpctags') }
Plug 'xolox/vim-misc' " xolox defined functions
Plug 'xolox/vim-easytags'
Plug 'sjl/gundo.vim'
"Plug 'godlygeek/tabular'
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
Plug 'machakann/vim-highlightedyank' " Highlihht yanked lines
" }}}

" Git pluggins ---------------------- {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" }}}

" Programming pluggins ---------------------- {{{
"Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
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
    !./install.py --all
    "if a:info.status == 'installed' || a:info.force
        "!./install.py --all
    "endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }
Plug 'w0rp/ale'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'hkupty/iron.nvim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'aklt/plantuml-syntax'
Plug 'rhysd/vim-clang-format'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'uplus/vim-clang-rename'
" }}}

" Themes pluggins ---------------------- {{{
Plug 'dim13/smyck.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline-themes'
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

