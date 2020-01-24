" Colorscheme setting ---------------------- {{{
set termguicolors
colorscheme gruvbox
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italic             = 1
let g:gruvbox_contrast_light     = 'hard'
let g:gruvbox_contrast_dark      = 'hard'
" }}}

" Colorizer setting ---------------------- {{{
let g:colorizer_auto_color = 0
let g:colorizer_auto_filetype='css,html'
let g:colorizer_fgcontrast=0
let g:colorizer_skip_comments = 1
" }}}

" Airline setting ---------------------- {{{
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"" unicode symbols
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


" }}}

" Status bar setting ---------------------- {{{
"set statusline+=%#warningmsg#
"set statusline+=%{fugitive#statusline()}
"set statusline+=%*
" }}}

" Lightline setting ---------------------- {{{
let g:lightline#ale#indicator_checking = '  '
let g:lightline#ale#indicator_infos = ' '
let g:lightline#ale#indicator_warnings = '  '
let g:lightline#ale#indicator_errors = '  '
let g:lightline#ale#indicator_ok = '  '

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \      'left': [ [ 'mode', 'paste' ],
            \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \      'right': [ [ 'percent', 'lineinfo' ],
            \            [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
            \            [ 'linter_checking', 'linter_infos', 'linter_warnings', 'linter_errors', 'linter_ok' ],
            \            ['asyncrun_status']]},
            \ 'inactive': {
            \      'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified' ] ],
            \      'right': [ [ 'percent', 'lineinfo' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ],
            \            ['asyncrun_status']]},
            \ 'component_expand': {
            \          'linter_checking': 'lightline#ale#status',
            \          'linter_infos': 'lightline#ale#infos',
            \          'linter_warnings': 'lightline#ale#warnings',
            \          'linter_errors': 'lightline#ale#errors',
            \          'linter_ok': 'lightline#ale#ok',
            \          'asyncrun_status': 'lightline#asyncrun#status'},
            \ 'component_type': {
            \          'linter_checking': 'right',
            \          'linter_infos': 'right',
            \          'linter_warnings': 'warning',
            \          'linter_errors': 'error',
            \          'linter_ok': 'right'},
            \ 'component_function': {
            \          'gitbranch': 'fugitive#head'},
            \ 'component': {
            \          'charvaluehex': '0x%B'},
            \ }
" component_type for color
" }}}

" Markify setting ---------------------- {{{
let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'
" }}}

" Snippet setting ---------------------- {{{
"let g:UltiSnipsExpandTrigger='<c-j>'
"let g:UltiSnipsJumpForwardTrigger='<c-j>'
"let g:UltiSnipsJumpBackwardTrigger='<c-k>'
"let g:UltiSnipsJumpBackwardTrigger='<c-k>'
"let g:snipMate.scope_aliases['cpp'] = 'c,cpp'
" }}}

" Iron setting ---------------------- {{{
let g:iron_repl_open_cmd = 'vsplit'
" }}}

" Easytag setting ---------------------- {{{
let g:easytags_cmd = '/usr/local/bin/ctags_wrapper'
let g:easytags_async=1
" }}}

" Gundo setting ---------------------- {{{
let g:gundo_preview_bottom = 1
" }}}

" UltiSnips setting ---------------------- {{{
"let g:UltiSnipsSnippetDirectories=[ '~/.vim/UltiSnips' ]
" " }}}

" Python setting ---------------------- {{{
"let g:python_host_prog = 'python2'
"let g:python3_host_prog = 'python'
" }}}
