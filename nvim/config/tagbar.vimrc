let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_bib = {
    \ 'ctagstype' : 'bib',
    \ 'kinds'     : [
        \ 'a:Articles',
        \ 'b:Books',
        \ 'L:Booklets',
        \ 'c:Conferences',
        \ 'B:Inbook',
        \ 'C:Incollection',
        \ 'P:Inproceedings',
        \ 'm:Manuals',
        \ 'T:Masterstheses',
        \ 'M:Misc',
        \ 't:Phdtheses',
        \ 'p:Proceedings',
        \ 'r:Techreports',
        \ 'u:Unpublished',
    \ ]
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
let g:tagbar_type_ps1 = {
    \ 'ctagstype' : 'powershell',
    \ 'kinds'     : [
        \ 'f:function',
        \ 'i:filter',
        \ 'a:alias'
    \ ]
\ }
