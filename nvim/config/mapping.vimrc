" Navigation mappings ---------------------- {{{
noremap  <F2>  :NERDTreeToggle<cr>
noremap  <F3>  :Tagbar<cr>
noremap  <F4>  :GundoToggle<cr>
nnoremap <c-p> :Files<cr>
" }}}

" Alignement mappings ---------------------- {{{
nnoremap <leader>t=       mxvip:EasyAlign1/=/l1<cr>`x
nnoremap <leader>t:       mxvip:EasyAlign1/:/l0<cr>`x
nnoremap <leader>tt:      mxvip:EasyAlign * /:/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>`x
nnoremap <leader>t,       mxvip:EasyAlign * /,/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>`x
nnoremap <leader>t<space> mxvip:EasyAlign*/\s\+/l0r0<cr>`x

vnoremap <leader>t=       :EasyAlign*/=/l1<cr>
vnoremap <leader>t:       :EasyAlign*/:/l0<cr>
vnoremap <leader>tt:      :EasyAlign * /:/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>
vnoremap <leader>t,       :EasyAlign * /,/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>
vnoremap <leader>t<space> :EasyAlign*/\s\+/l0r0<cr>
" }}}

" Git mappings ---------------------- {{{
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :AsyncRun git push origin HEAD<cr>
nnoremap <leader>gb :Gbrowse<cr>
" }}}

" Visual color mappings ---------------------- {{{
nnoremap <leader>ct :ColorToggle<cr>
" }}}

" Silver Searcher (Ag) mappings ---------------------- {{{
nnoremap <leader>ag :Ag<cr>
"vnoremap <leader>ag :Ag<cr>
" }}}

" Vim edditing mappings ---------------------- {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Ale mappings ---------------------- {{{
nnoremap <silent> <leader>ps <Plug>(ale_previous)
nnoremap <silent> <leader>ns <Plug>(ale_next)
" }}}

" Personnal mappings ---------------------- {{{
nnoremap <leader>t <c-]>
nnoremap <leader>T <c-t>
nnoremap <leader>q :qa<cr>
inoremap jk        <esc>
inoremap <esc>     <nop>
inoremap <Up>      <nop>
inoremap <Down>    <nop>
inoremap <Left>    <nop>
inoremap <Right>   <nop>
inoremap <c-u>     <esc>mxviwU`xa
nnoremap <Up>      <nop>
nnoremap <Down>    <nop>
nnoremap <Left>    <nop>
nnoremap <Right>   <nop>
cnoremap <Up>      <nop>
cnoremap <Down>    <nop>
cnoremap <Left>    <nop>
cnoremap <Right>   <nop>
inoremap <c-w>     <esc>:w<cr>
nnoremap <c-u>     viw~
nnoremap <space>   :bnext<cr>
nnoremap <c-space> :bprevious<cr>
inoremap <c-space> <c-x><c-o>
cnoremap <c-k>     <right>
cnoremap <c-j>     <left>
cnoremap <c-l>     <s-right>
cnoremap <c-h>     <s-left>
tnoremap <Esc>     <C-\><C-n>

nnoremap <silent> <c-l> :nohl<cr><c-l>:AirlineRefresh<cr>
" }}}
