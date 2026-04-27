function! s:TextFormatters() abort
    inoremap <buffer> <C-l> <C-r>=__\<Left><CR>
    inoremap <buffer> <C-b> <C-r>=____\<Left>\<Left><CR>
    inoremap <buffer> <C-u> <C-r>=<u></u>\<Left>\<Left>\<Left>\<Left><CR>

    xnoremap <buffer> <C-i> c_<C-r>"_<Esc>i
    xnoremap <buffer> <C-l> c_<C-r>"_<Esc>i
    xnoremap <buffer> <C-b> c__<C-r>"__<Esc>i
    xnoremap <buffer> <C-u> c<u><C-r>"</u><Esc>i
endfunction
