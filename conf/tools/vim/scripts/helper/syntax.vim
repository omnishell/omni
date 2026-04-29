function! SyntaxRegion(start_pattern, end_pattern, ...) abort
    if a:0 == 0
        call s:CreateDynamicSyntaxRegion(a:start_pattern, a:end_pattern)
    elseif a:0 == 1
        call s:CreateStaticSyntaxRegion(a:start_pattern, a:end_pattern, a:1)
    endif
endfunction

function! s:CreateStaticSyntaxRegion(start_pattern, end_pattern, filetype) abort
    let syntax_filetype = a:filetype
    let aliases = {
        \ 'js':    'javascript',
        \ 'sh':    'bash',
        \ 'shell': 'bash',
        \}

    if has_key(aliases, syntax_filetype)
        let syntax_filetype = aliases[syntax_filetype]
    endif

    if empty(globpath(&rtp, 'syntax/' . syntax_filetype . '.vim', 1, 1))
        return
    endif

    let rand_suffix  = substitute(reltimestr(reltime()), '[^0-9]', '', 'g')[-5:]
    let cluster_name = 'syntax_inc_' . syntax_filetype . '_' . rand_suffix
    let region_name  = 'region_'      . syntax_filetype . '_' . rand_suffix

    let l:save_csyntax = exists('b:current_syntax') ? b:current_syntax : ''
    unlet! b:current_syntax

    execute 'silent! syntax include @' . cluster_name . ' syntax/' . syntax_filetype . '.vim'

    if !empty(l:save_csyntax)
        let b:current_syntax = l:save_csyntax
    endif

    let start_pat = '\V' . escape(a:start_pattern, '/\')
    let end_pat   = '\V' . escape(a:end_pattern,   '/\')

    silent! highlight default link SyntaxRegionDelimiter Comment

    try
        execute 'syntax region ' . region_name
            \ . ' matchgroup=SyntaxRegionDelimiter'
            \ . ' start=/' . start_pat . '/'
            \ . ' end=/'   . end_pat   . '/'
            \ . ' contains=@' . cluster_name
            \ . ' keepend extend'
    catch
    endtry
endfunction

function! s:CreateDynamicSyntaxRegion(start_pattern, end_pattern) abort
    let filetypes = {
        \ 'python':     'python',
        \ 'py':         'python',
        \ 'javascript': 'javascript',
        \ 'js':         'javascript',
        \ 'html':       'html',
        \ 'css':        'css',
        \ 'json':       'json',
        \ 'sql':        'sql',
        \ 'sh':         'bash',
        \ 'bash':       'bash',
        \ 'php':        'php',
        \}

    if a:start_pattern =~# '{ft}'
        for [marker_ft, syntax_ft] in items(filetypes)
            if empty(globpath(&rtp, 'syntax/' . syntax_ft . '.vim', 1, 1))
                continue
            endif
            let actual_start = substitute(a:start_pattern, '{ft}', marker_ft, 'g')
            call s:CreateStaticSyntaxRegion(actual_start, a:end_pattern, syntax_ft)
        endfor
    else
        for [marker_ft, syntax_ft] in items(filetypes)
            if empty(globpath(&rtp, 'syntax/' . syntax_ft . '.vim', 1, 1))
                continue
            endif
            let actual_start = a:start_pattern . marker_ft
            call s:CreateStaticSyntaxRegion(actual_start, a:end_pattern, syntax_ft)
        endfor
    endif
endfunction

function! SyntaxInclude(...)
    for guest_ft in a:000
        silent! unlet! g:current_syntax
        silent! unlet! b:current_syntax
        
        try
            let syntax_file = $VIMRUNTIME . '/syntax/' . guest_ft . '.vim'
            if filereadable(syntax_file)
                execute 'source ' . syntax_file
            endif
        catch
        endtry
    endfor
    syntax sync fromstart

endfunction
