"rust
au FileType rust,rust_config compiler cargo
au FileType rust,rust_config nnoremap <F8> :AsyncRun cargo build<cr>
au FileType rust,rust_config nnoremap <F7> :AsyncRun cargo test --color=always<cr>
au FileType rust,rust_config nnoremap <F5> :AsyncRun cargo run<cr>

"c++
au FileType c,cpp nnoremap <F8> :AsyncRun make -C build<cr>
au FileType c,cpp nnoremap <F9> :AsyncRun g++ -Wall %<cr>
au FileType cpp nnoremap <F5> :AsyncRun ./run.sh<cr>
au FileType cpp setlocal foldmethod=indent
au FileType cpp setlocal foldlevel=99

"pascal
au FileType pascal nnoremap <F8> :AsyncRun fpc -S2 %:t<cr>
au FileType pascal nnoremap <F5> :AsyncRun ./%:r<cr>
au FileType pascal set foldmethod=indent

"python
au FileType python nnoremap <F5> :!python3 %<cr>

"java
au FileType java setlocal omnifunc=javacomplete#Complete
au FileType java nnoremap <leader>jia :JCimportAddSmart<cr><esc>