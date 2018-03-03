" Rust file settings ---------------------- {{{
augroup rust_setting
    autocmd!
    autocmd FileType rust,rust_config compiler cargo
    autocmd FileType rust,rust_config nnoremap <F8> :AsyncRun cargo build<cr>
    autocmd FileType rust,rust_config nnoremap <F7> :AsyncRun cargo test --color=always<cr>
    autocmd FileType rust,rust_config nnoremap <F5> :AsyncRun cargo run<cr>
augroup END
" }}}

" C++ file settings ---------------------- {{{
augroup cpp_setting
    autocmd!
    autocmd FileType c,cpp nnoremap <F8> :AsyncRun make -C build<cr>
    autocmd FileType c,cpp nnoremap <F9> :AsyncRun g++ -Wall %<cr>
    autocmd FileType c,cpp nnoremap <F10> :!./a.out<cr>
    autocmd FileType cpp nnoremap <F5> :AsyncRun ./run.sh<cr>
    autocmd FileType cpp setlocal foldmethod=indent
    autocmd FileType cpp setlocal foldlevel=99
augroup END
" }}}

" Pascal file settings ---------------------- {{{
augroup pascal_setting
    autocmd!
    autocmd FileType pascal nnoremap <F8> :AsyncRun fpc -S2 %:t<cr>
    autocmd FileType pascal nnoremap <F5> :AsyncRun ./%:r<cr>
    autocmd FileType pascal set foldmethod=indent
augroup END
" }}}

" Python file settings ---------------------- {{{
augroup python_setting
    autocmd!
    autocmd FileType python nnoremap <F5> :!python3 %<cr>
augroup END
" }}}

" Java file settings ---------------------- {{{
augroup java_setting
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    autocmd FileType java nnoremap <F8> :AsyncRun gradle compileJava<cr>
    autocmd FileType java nnoremap <F5> :AsyncRun gradle run<cr>
    autocmd FileType java nnoremap <localleader>jN  :JCgenerateClassInFile<cr>
    autocmd FileType java nnoremap <localleader>jn  :JCgenerateNewClass<cr>
    autocmd FileType java nnoremap <localleader>jcc :JCgenerateDefaultConstructor<cr>
    autocmd FileType java nnoremap <localleader>jc  :JCgenerateConstructor<cr>
    autocmd FileType java nnoremap <localleader>jeq :JCgenerateEqualsAndHashCode<cr>
    autocmd FileType java nnoremap <localleader>jts :JCgenerateToString<cr>
    autocmd FileType java nnoremap <localleader>ja  :JCgenerateAccessorSetterGetter<cr>
    autocmd FileType java nnoremap <localleader>jg  :JCgenerateAccessorGetter<cr>
    autocmd FileType java nnoremap <localleader>js  :JCgenerateAccessorSetter<cr>
    autocmd FileType java nnoremap <localleader>jA  :JCgenerateAccessors<cr>
    autocmd FileType java nnoremap <localleader>jM  :JCgenerateAbstractMethods<cr>
    autocmd FileType java nnoremap <localleader>jis :JCimportsSortImports<cr>
    autocmd FileType java nnoremap <localleader>jii :JCimportsAdd<cr>
    autocmd FileType java nnoremap <localleader>ji  :JCimportsAddSmart<cr>
    autocmd FileType java nnoremap <localleader>jR  :JCimportsRemoveUnused<cr>
    autocmd FileType java nnoremap <localleader>jI  :JCimportsAddMissing<cr>
    autocmd FileType java onoremap qc :<c-u>execute "normal! ?}\\s*catch\r:nohlsearch\r/(\r:nohlsearch\rlvi)"<cr>
    autocmd FileType java onoremap qi :<c-u>execute "normal! ?\\(else\\s\\+\\)\\=if\r:nohlsearch\r/(\r:nohlsearch\rlvi)"<cr>
    autocmd FileType java onoremap qf :<c-u>execute "normal! ?}\\s*for\r:nohlsearch\r/(\r:nohlsearch\rlvi)"<cr>
    autocmd FileType java onoremap qw :<c-u>execute "normal! ?}\\s*while\r:nohlsearch\r/(\r:nohlsearch\rlvi)"<cr>
augroup END
" }}}

" Groovy file settings ---------------------- {{{
augroup groovy_setting
    autocmd!
    autocmd FileType groovy nnoremap <F8> :AsyncRun gradle compileJava<cr>
    autocmd FileType groovy nnoremap <F5> :AsyncRun gradle run<cr>
    autocmd FileType groovy nnoremap <localleader>jN  @<Plug>(JavaComplete-Generate-ClassInFile)
    autocmd FileType groovy nnoremap <localleader>jn  @<Plug>(JavaComplete-Generate-NewClass)
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup vim_setting
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
