" "Color Scheme
colorscheme smyck

" COLORIZER
let g:colorizer_auto_color = 0
let g:colorizer_auto_filetype='css,html'
let g:colorizer_fgcontrast=0
let g:colorizer_skip_comments = 1

"airline

let g:airline_theme="base16_chalk"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:bufferline_echo=0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:asyncrun_status=' pending '

set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'

" Snippets
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

let g:iron_repl_open_cmd="vsplit"

let g:easytags_async=1

let g:gundo_preview_bottom = 1

