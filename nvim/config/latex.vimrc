" Latex settings ---------------------- {{{
augroup latex_programming
    autocmd!
    autocmd FileType plaintex,tex nnoremap <F8> :AsyncRun make<cr>
    autocmd FileType plaintex,tex set mp=make
    autocmd FileType plaintex,tex nnoremap <F6> :AsyncRun make print<cr>
    autocmd FileType plaintex,tex nnoremap <F5> :!xdg-open *.pdf<cr>
    autocmd FileType plaintex,tex set spell spelllang=fr
    autocmd FileType plaintex,tex nnoremap <leader>n ]s
    autocmd FileType plaintex,tex nnoremap <leader>p [s
    autocmd FileType plaintex,tex set foldmethod=indent
    autocmd FileType plaintex,tex set foldlevel=0
    autocmd FileType plaintex,tex nnoremap <leader>se :set spell spelllang=en<cr>
    autocmd FileType plaintex,tex nnoremap <leader>sf :set spell spelllang=fr<cr>
    autocmd FileType plaintex,tex nnoremap <leader>sd :set nospell<cr>
    autocmd FileType plaintex,tex nnoremap <leader>sn :lnext<cr>
    autocmd FileType plaintex,tex nnoremap <leader>sp :lprev<cr>
    " au FileType plaintex,tex nnoremap <leader>sy :SyntasticCheck<cr>
    autocmd FileType plaintex,tex nnoremap <leader>fp mn{!}fmt -w 80<cr>`n
    autocmd FileType plaintex,tex set textwidth=80
augroup END
" }}}

" Latex ignore markup spellchecking ---------------------- {{{
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
augroup latex_programming
    autocmd FileType plaintex,tex call SPELL_remove_regions(latex_regions)
augroup END
" }}}
