if empty(glob('~/.config/nvim/autoload/plug.vim'))

  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'


" Tools
" Plug 'dhruvasagar/vim-table-mode'
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Highlight Current Search
Plug 'timakro/vim-searchant'

" Programming
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'dhruvasagar/vim-markify'
Plug 'othree/xml.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tfnico/vim-gradle'

" Coloration
Plug 'chrisbra/Colorizer'

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

" Themes
Plug 'dim13/smyck.vim'
Plug 'vim-airline/vim-airline-themes'

" Approx the terminal colorscheme
" Plug 'godlygeek/csapprox'

" To check
" Plug 'tommcdo/vim-fubitive'
" Plug 'szw/vim-tags'
Plug 'bling/vim-bufferline'
" Plug 'xolox/vim-notes'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'majutsushi/tagbar'
" Plug 'suan/vim-instant-markdown'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug '907th/vim-auto-save'
Plug 'hkupty/iron.nvim'

call plug#end()
