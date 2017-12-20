au FileType plaintex,tex nnoremap <F8> :AsyncRun make<cr>
au FileType plaintex,tex set mp=make
au FileType plaintex,tex nnoremap <F6> :AsyncRun make print<cr>
au FileType plaintex,tex nnoremap <F5> :!xdg-open *.pdf<cr>
au FileType plaintex,tex set spell spelllang=fr
au FileType plaintex,tex nnoremap <leader>n ]s
au FileType plaintex,tex nnoremap <leader>p [s
au FileType plaintex,tex set foldmethod=indent
au FileType plaintex,tex set foldlevel=0
au FileType plaintex,tex nnoremap <leader>se :set spell spelllang=en<cr>
au FileType plaintex,tex nnoremap <leader>sf :set spell spelllang=fr<cr>
au FileType plaintex,tex nnoremap <leader>sd :set nospell<cr>
au FileType plaintex,tex nnoremap <leader>sn :lnext<cr>
au FileType plaintex,tex nnoremap <leader>sp :lprev<cr>
" au FileType plaintex,tex nnoremap <leader>sy :SyntasticCheck<cr>
au FileType plaintex,tex nnoremap <leader>fp mn{!}fmt -w 80<cr>`n

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
au FileType plaintex,tex call SPELL_remove_regions(latex_regions)
