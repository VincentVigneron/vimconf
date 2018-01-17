noremap  <F2>  :NERDTreeToggle<cr>
noremap  <F3>  :Tagbar<cr>
noremap  <F4>  :GundoToggle<cr>
nnoremap <c-p> :Files<cr>

nnoremap  <leader>t=        mxvip:EasyAlign1/=/l1<cr>`x
nnoremap  <leader>t:        mxvip:EasyAlign1/:/l1<cr>`x
nnoremap  <leader>t<space>  mxvip:EasyAlign*/\s\+/l0<cr>`x
vnoremap  <leader>t=        :EasyAlign*/=/l1<cr>
vnoremap  <leader>t:        :EasyAlign*/:/l1<cr>
vnoremap  <leader>t<space>  :EasyAlign*/\s\+/l0<cr>

nnoremap  <leader>gs  :Gstatus<cr>
nnoremap  <leader>gc  :Gcommit<cr>
nnoremap  <leader>ga  :Gwrite<cr>
nnoremap  <leader>gl  :Glog<cr>
nnoremap  <leader>gp  :AsyncRun git push origin HEAD<cr>
nnoremap  <leader>gb  :Gbrowse<cr>
nnoremap  <leader>ct  :ColorToggle<cr>
nnoremap  <leader>ag  :Ag<cr>

nmap  ga  <Plug>(EasyAlign)
xmap  ga  <Plug>(EasyAlign)

nnoremap  <leader>t  <c-]>
nnoremap  <leader>T  <c-t>

" editing vimrc
nnoremap  <leader>ev  :vsplit  $MYVIMRC<cr>
nnoremap  <leader>sv  :source  $MYVIMRC<cr>


nmap  <silent>  <leader>ps  <Plug>(ale_previous)
nmap  <silent>  <leader>ns  <Plug>(ale_next)

nnoremap  <leader>q  :qa<cr>
inoremap  jk         <esc>
inoremap  <esc>      <nop>
inoremap  <Up>       <nop>
inoremap  <Down>     <nop>
inoremap  <Left>     <nop>
inoremap  <Right>    <nop>
nnoremap  <Up>       <nop>
nnoremap  <Down>     <nop>
nnoremap  <Left>     <nop>
nnoremap  <Right>    <nop>
cnoremap  <Up>       <nop>
cnoremap  <Down>     <nop>
cnoremap  <Left>     <nop>
cnoremap  <Right>    <nop>
inoremap  <c-w>      <esc>:w<cr>
nnoremap  <c-u>      viw~
nnoremap  <space>    :bnext<cr>
nnoremap  <c-space>  :bprevious<cr>
inoremap  <c-space>  <c-x><c-o>
cnoremap  <c-k>      <right>
cnoremap  <c-j>      <left>
cnoremap  <c-l>      <s-right>
cnoremap  <c-h>      <s-left>
tnoremap  <Esc>      <C-\><C-n>

nnoremap  <silent>  <c-l>  :nohl<cr><c-l>:AirlineRefresh<cr>
