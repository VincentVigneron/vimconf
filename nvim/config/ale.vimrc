let g:ale_linters = {
	\ 'latex' : ['chktex'],
	\ 'cpp' : ['clangtidy'],
	\ 'rust' : ['rls', 'cargo'],
	\ 'python' : ['flake8'],
	\}
let g:ale_fixers = {
	\ 'rust' : ['rustfmt'],
	\}
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:airline#extensions#ale#enabled = 1
let g:ale_cpp_clang_options = '-std=c++1z -Wall'
let g:ale_cpp_clangtidy_options = '-std=c++1z -Wall'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_set_highlitghts = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
