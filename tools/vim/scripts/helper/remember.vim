function! RememberPosition()
    if line("'\"") > 1 && line("'\"") <= line("$")
        normal! g`"

        normal! zz
    else
        normal! gg^
    endif
endfunction
