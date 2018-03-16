" Navigation mappings ---------------------- {{{
noremap  <silent> <F2>  :NERDTreeToggle<cr>
noremap  <silent> <F3>  :Tagbar<cr>
noremap  <silent> <F4>  :GundoToggle<cr>
nnoremap <silent> <c-p> :Files<cr>
" }}}

" Alignement mappings ---------------------- {{{
nnoremap <silent> <leader>t=       mxvip:EasyAlign 1/=/l1<cr>`x
nnoremap <silent> <leader>t:       mxvip:EasyAlign 1/:/l0<cr>`x
nnoremap <silent> <leader>tt:      mxvip:EasyAlign */:/{ 'stick_to_left': 1, 'left_margin': 0 }<cr>`x
nnoremap <silent> <leader>t,       mxvip:EasyAlign */,/{ 'stick_to_left': 1, 'left_margin': 0 }<cr>`x
nnoremap <silent> <leader>t<space> mxvip:EasyAlign*/\s\+/l0r0<cr>`x

vnoremap <silent> <leader>t=       :EasyAlign*/=/l1<cr>
vnoremap <silent> <leader>t:       :EasyAlign*/:/l0<cr>
vnoremap <silent> <leader>tt:      :EasyAlign * /:/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>
vnoremap <silent> <leader>t,       :EasyAlign * /,/ { 'stick_to_left': 1, 'left_margin': 0 }<cr>
vnoremap <silent> <leader>t<space> :EasyAlign*/\s\+/l0r0<cr>

nnoremap <silent> <leader>ta :set operatorfunc=<SID>AlignEqualOperator<cr>g@
vnoremap <silent> <leader>ta :<c-u>call <SID>AlignEqualOperator(visualmode())<cr>

function! s:AlignEqualOperator(type)

    let saved_unnamed_register = @@
    let saved_unnamed_register= @@

    if a:type ==? 'v'
        "normal! `<v`>y
        echo 'normal! `<v`>:EasyAlign1/=/l1'
        "execute 'normal! `<v`>:EasyAlign1/=/l1' . "\<lt>cr>"
    elseif a:type ==# 'char' || a:type ==# 'line'
        silent execute 'normal! `[v`]:EasyAlign! */=/l1' . "\<lt>cr>"
    else
        "return
    endif
        "echom 'normal'
        "execute 'normal! `<v`>:EasyAlign1/=/l1' . "\<lt>cr>"


    "silent execute "normal! `<,`>

    let @@ = saved_unnamed_register
endfunction
" }}}

" Git mappings ---------------------- {{{
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>ga :Gwrite<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gp :AsyncRun git push origin HEAD<cr>
nnoremap <silent> <leader>gb :Gbrowse<cr>
" }}}

" Visual color mappings ---------------------- {{{
nnoremap <silent> <leader>ct :ColorToggle<cr>
" }}}

" Vim edditing mappings ---------------------- {{{
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
" }}}

" Ale mappings ---------------------- {{{
nnoremap <silent> <leader>ps <Plug>(ale_previous)
nnoremap <silent> <leader>ns <Plug>(ale_next)
" }}}

" Personnal mappings ---------------------- {{{
nnoremap <leader>t <c-]>
nnoremap <leader>T <c-t>
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
nnoremap <c-u>     viw~
inoremap <c-space> <c-x><c-o>
cnoremap <c-k>     <right>
cnoremap <c-j>     <left>
cnoremap <c-l>     <s-right>
cnoremap <c-h>     <s-left>
tnoremap <Esc>     <c-\><c-n>

inoremap <silent> <c-w>      <esc>:w<cr>
nnoremap <silent> <space>    :bnext<cr>
nnoremap <silent> <c-space>  :bprevious<cr>
nnoremap <silent> <leader>;  :<c-u>execute 'normal! mcA;'."\<lt>esc>".'`c'<cr>
nnoremap <silent> <leader>br :<c-u>execute 'normal! mcA<br />'."\<lt>esc>".'`c'<cr>
nnoremap <silent> <c-l>      :nohl<cr><c-l>:AirlineRefresh<cr>

"nnoremap <leader>ag :<c-u>execute "normal! viw\"cy/\<lt>c-r>c\<lt>cr>:nohlsearch\<lt>cr>:AgFromSearch!\<lt>cr>"<cr>
"vnoremap <leader>ag :<c-u>execute "normal! \"cy/\<lt>c-r>c\<lt>cr>:nohlsearch\<lt>cr>:AgFromSearch!\<lt>cr>"<cr>

" }}}

" Ag mappings ---------------------- {{{
nnoremap <silent> <leader>ag :set operatorfunc=<SID>AgOperator<cr>g@
vnoremap <silent> <leader>ag :<c-u>call <SID>AgOperator(visualmode())<cr>

function! s:AgOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "Ag! ".shellescape(@@)

    let @@ = saved_unnamed_register
endfunction
" }}}

" Fold mappings ---------------------- {{{
nnoremap <silent> <leader>fc :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
" }}}
