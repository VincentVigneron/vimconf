" Filetype detection ---------------------- {{{
augroup filetype_detection
    autocmd!
    autocmd BufRead,BufNewFile *.c,*.h     set filetype=c
    autocmd BufRead,BufNewFile *.cpp,*.hpp set filetype=cpp
    autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock set filetype=rust_config
    " au BufRead,BufNewFile *.rs set filetype=rust
    autocmd BufRead,BufNewFile *.pas set filetype=pascal
augroup END
" }}}
