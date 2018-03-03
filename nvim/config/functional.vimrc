" Sorted function ---------------------- {{{
function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction
" }}}

" Reversed function ---------------------- {{{
function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction
" }}}

" Append function ---------------------- {{{
function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction
" }}}

" Assoc function ---------------------- {{{
function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction
" }}}

" Pop function ---------------------- {{{
function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction
" }}}

" Mapped function ---------------------- {{{
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)

    if type(new_list) == v:t_list
        call map(new_list, string(a:fn).'(v:val)')
    elseif type(new_list) == v:t_dict
        call map(new_list, string(a:fn).'(v:key,v:val)')
    endif

    return new_list
endfunction
" }}}

" Filtered function ---------------------- {{{
function! Filtered(fn, l)
    let new_list = deepcopy(a:l)

    if type(new_list) == v:t_list
        call filter(new_list, string(a:fn) . '(v:val)')
    elseif type(new_list) == v:t_dict
        call filter(new_list, string(a:fn) . '(v:key)')
    endif

    return new_list
endfunction
" }}}

" Removed function ---------------------- {{{
function! Removed(fn, l)
    let new_list = deepcopy(a:l)

    if type(new_list) == v:t_list
        call filter(new_list, '!' . string(a:fn) . '(v:val)')
    elseif type(new_list) == v:t_dict
        call filter(new_list, '!' . string(a:fn) . '(v:key)')
    endif

    return new_list
endfunction
" }}}

" Reduced function ---------------------- {{{
function! Reduced(acc, fn, l)
    if empty(a:l)
        return a:acc
    endif

    let acc      = a:fn(a:acc, a:l[0])
    let new_list = Pop(a:l, 0)
    return Reduced(acc, a:fn, new_list)
endfunction
" }}}
