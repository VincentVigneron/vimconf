" Navigation mappings ---------------------- {{{
noremap  <silent> <F2>  :NERDTreeToggle<cr>
noremap  <silent> <F3>  :Tagbar<cr>
noremap  <silent> <F4>  :GundoToggle<cr>
nnoremap <silent> <c-p> :Files<cr>
"nnoremap <silent> <c-p> <plug>(fzf-complete-file-ag)
" }}}

imap <c-j> <Plug>snipMateNextOrTrigger

" Alignement mappings (function) ---------------------- {{{
function! s:AlignOperator(type,op,left,right,arity)
    let saved_unnamed_register = @@

    let align_cmd = ':EasyAlign ' . a:arity . '/' . a:op . '/l' . a:left . 'r' . a:right

    if a:type ==? 'v'
        silent execute "normal! `\<lt>". 'v' . "`>" . align_cmd . "\<cr>"
    elseif a:type ==# 'V'
        silent execute "normal! `\<lt>". 'V' . "`>" . align_cmd . "\<cr>"
    elseif a:type ==# 'line'
        silent execute "normal! `[". 'V' . "`]" . align_cmd . "\<cr>"
    elseif a:type ==# 'char'
        silent execute "normal! `[". 'v' . "`]" . align_cmd . "\<cr>"
    else
        "return
    endif

    let @@ = saved_unnamed_register
endfunction
" }}}

" Alignement mappings (coma) ---------------------- {{{
nnoremap <silent> <leader>t, :set operatorfunc=<SID>AlignComaOperator01<cr>g@
nnoremap <silent> <leader>t,00 :set operatorfunc=<SID>AlignComaOperator00<cr>g@
nnoremap <silent> <leader>t,01 :set operatorfunc=<SID>AlignComaOperator01<cr>g@
nnoremap <silent> <leader>t,10 :set operatorfunc=<SID>AlignComaOperator10<cr>g@
nnoremap <silent> <leader>t,11 :set operatorfunc=<SID>AlignComaOperator11<cr>g@
vnoremap <silent> <leader>t, :<c-u>call <SID>AlignComaOperator01(visualmode())<cr>

function! s:AlignComaOperator(type,op,left,right)
    call s:AlignOperator(a:type,a:op,a:left,a:right,'*')
endfunction

function! s:AlignComaOperator00(type)
    call s:AlignComaOperator(a:type,',',0,0)
endfunction

function! s:AlignComaOperator01(type)
    call s:AlignComaOperator(a:type,',',0,1)
endfunction

function! s:AlignComaOperator10(type)
    call s:AlignComaOperator(a:type,',',1,0)
endfunction

function! s:AlignComaOperator11(type)
    call s:AlignComaOperator(a:type,',',1,1)
endfunction
" }}}

" Alignement mappings (column) ---------------------- {{{
nnoremap <silent> <leader>t: :set operatorfunc=<SID>AlignColumnOperator01<cr>g@
nnoremap <silent> <leader>t:00 :set operatorfunc=<SID>AlignColumnOperator00<cr>g@
nnoremap <silent> <leader>t:01 :set operatorfunc=<SID>AlignColumnOperator01<cr>g@
nnoremap <silent> <leader>t:10 :set operatorfunc=<SID>AlignColumnOperator10<cr>g@
nnoremap <silent> <leader>t:11 :set operatorfunc=<SID>AlignColumnOperator11<cr>g@
vnoremap <silent> <leader>t: :<c-u>call <SID>AlignColumnOperator01(visualmode())<cr>

function! s:AlignColumnOperator(type,op,left,right)
    call s:AlignOperator(a:type,a:op,a:left,a:right,1)
endfunction

function! s:AlignColumnOperator00(type)
    call s:AlignColumnOperator(a:type,':',0,0)
endfunction

function! s:AlignColumnOperator01(type)
    call s:AlignColumnOperator(a:type,':',0,1)
endfunction

function! s:AlignColumnOperator10(type)
    call s:AlignColumnOperator(a:type,':',1,0)
endfunction

function! s:AlignColumnOperator11(type)
    call s:AlignColumnOperator(a:type,':',1,1)
endfunction
" }}}

" Alignement mappings (space) ---------------------- {{{
nnoremap <silent> <leader>t<space>   :set operatorfunc=<SID>AlignSpaceOperator00<cr>g@
nnoremap <silent> <leader>t<space>00 :set operatorfunc=<SID>AlignSpaceOperator00<cr>g@
vnoremap <silent> <leader>t<space>   :<c-u>call <SID>AlignSpaceOperator00(visualmode())<cr>

function! s:AlignSpaceOperator(type,op,left,right)
    call s:AlignOperator(a:type,a:op,a:left,a:right,'*')
endfunction

function! s:AlignSpaceOperator00(type)
    call s:AlignSpaceOperator(a:type,'\s\+',0,0)
endfunction
" }}}

" Alignement mappings (equal) ---------------------- {{{
nnoremap <silent> <leader>t= :set operatorfunc=<SID>AlignEqualOperator11<cr>g@
nnoremap <silent> <leader>t=00 :set operatorfunc=<SID>AlignEqualOperator00<cr>g@
nnoremap <silent> <leader>t=01 :set operatorfunc=<SID>AlignEqualOperator01<cr>g@
nnoremap <silent> <leader>t=10 :set operatorfunc=<SID>AlignEqualOperator10<cr>g@
nnoremap <silent> <leader>t=11 :set operatorfunc=<SID>AlignEqualOperator11<cr>g@
vnoremap <silent> <leader>t= :<c-u>call <SID>AlignEqualOperator11(visualmode())<cr>

function! s:AlignEqualOperator(type,op,left,right)
    call s:AlignOperator(a:type,a:op,a:left,a:right,1)
endfunction

function! s:AlignEqualOperator00(type)
    call s:AlignEqualOperator(a:type,'=',0,0)
endfunction

function! s:AlignEqualOperator01(type)
    call s:AlignEqualOperator(a:type,'=',0,1)
endfunction

function! s:AlignEqualOperator10(type)
    call s:AlignEqualOperator(a:type,'=',1,0)
endfunction

function! s:AlignEqualOperator11(type)
    call s:AlignEqualOperator(a:type,'=',1,1)
endfunction
" }}}

" Replace mappings  ---------------------- {{{
nnoremap <silent> yr :set operatorfunc=<SID>YankReplaceDeletedOperator<cr>g@
vnoremap <silent> yr :<c-u>call <SID>YankReplaceDeletedOperator(visualmode())<cr>
nnoremap <silent> yR :set operatorfunc=<SID>YankReplacePastedOperator<cr>g@
vnoremap <silent> yR :<c-u>call <SID>YankReplacePastedOperator(visualmode())<cr>

function! s:YankReplaceDeletedOperator(type)
    let register_pasted = @@

    if a:type ==# 'v'
        silent execute "normal! `\<lt>". v,' . "`>" . 'd'
    elseif a:type ==# 'line' || a:type ==# 'char'
        silent execute "normal! `[". 'v' . "`]" . 'd'
    endif

    let register_deleted = @@
    silent execute "normal! h"
    let @@ = register_pasted

    silent execute "normal! p"

    let @@               = register_deleted
endfunction

function! s:YankReplacePastedOperator(type)
    let register_pasted = @@

    if a:type ==# 'v'
        silent execute "normal! `\<lt>". v,' . "`>" . 'd'
    elseif a:type ==# 'line' || a:type ==# 'char'
        silent execute "normal! `[". 'v' . "`]" . 'd'
    endif

    let register_deleted = @@
    silent execute "normal! h"
    let @@ = register_pasted

    silent execute "normal! p"
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
nnoremap <silent> <leader>it :IndentGuidesToggle<cr>
" }}}

" Vim edditing mappings ---------------------- {{{
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
" stop asynchronus execution to avoid bug during sourcing
nnoremap <silent> <leader>sv :AsyncStop<cr>:source $MYVIMRC<cr>
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

"  Quickfix mappings ---------------------- {{{
nnoremap <silent> <leader>qn :cnext<cr>
nnoremap <silent> <leader>qp :cprev<cr>

