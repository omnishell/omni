#! /usr/bin/env vim

" DISABLING
"> uppercase and lowercase 
    xnoremap u <nop>
    xnoremap U <nop>
    nnoremap gu <nop>
    nnoremap gU <nop>
">> replace mode
    inoremap <insert> <nop>
    nnoremap r <nop>
    nnoremap R <nop>
"> search cursor word
    nnoremap # <nop>
"> tab with ctrl+t
    inoremap <c-t> <nop>
"> other
    "inoremap <c-o> <nop>
    "nnoremap <c-o> <nop>
    vnoremap <c-d> <nop>

" SETTING
"> setting leader key to `,,`
    let mapleader = ']'

" INDENTATION
"> 'tab' and 'shift+tab' in normal/insert mode to change indentation
    nnoremap <tab> >>
    nnoremap <s-tab> <<
"> 'tab' and 'shift+tab' in visual mode to change multiline indentation
    vnoremap <tab> >
    vnoremap <s-tab> <

" MOVING
"> ']a' and ']e' to move to beggining and ending of line
    nnoremap <leader>a ^
    nnoremap <leader>e $
    vnoremap <leader>a ^
    vnoremap <leader>e $
    inoremap <leader>a <esc>^i
    inoremap <leader>e <esc>$i<right>
"> (']g' or 'home') and (']G' or 'end') to move to the beggining and ending of file
    nnoremap <leader>g gg
    nnoremap <home> gg
    nnoremap <leader>G GG
    nnoremap <end> gg
    vnoremap <leader>g gg
    vnoremap <home> gg
    vnoremap <leader>G GG
    vnoremap <home> GG
    inoremap <end> <esc>ggi
    inoremap <end> <esc>GGi 
"> use cursor arrows to move through long lines, ignoring wrapping.
    inoremap <silent> <down> <c-r>=pumvisible() ? "\<lt>down>" : "\<lt>c-o>gj"<cr>
    inoremap <silent> <up> <c-r>=pumvisible() ? "\<lt>up>" : "\<lt>c-o>gk"<cr>
    nnoremap <expr> <up> (v:count == 0 ? 'gk' : 'k')
    nnoremap <expr> <down> (v:count == 0 ? 'gj' : 'j')            
    vnoremap <up> gk
    vnoremap <down> gj

" SEARCHING
"> 'ctrl+f' or ',,f' to search.
    nnoremap <c-f> /
    inoremap <c-f> <esc>/
    nnoremap <leader>f /
    inoremap <leader>f <esc>/
"> ',,s' to search and replace
    nnoremap <leader>s :%s/foo/bar/g
    inoremap <leader>s <esc>:%s/foo/bar/g
    vnoremap <leader>s :s/foo/bar/g
  
" EDITING
"> 'space' and 'backspace' in normal mode and visual mode 
    vnoremap <space> <esc>:startinsert<cr><space><right>
    nnoremap <space> :startinsert<cr><space><right>
    vnoremap <bs> d<esc>:startinsert<cr>
    nnoremap <bs> :startinsert<cr><bs><right>

" SELECTING
"> use 'shift+arrows' to select text.
    nnoremap <s-up> vgk
    nnoremap <s-down> vgj
    nnoremap <s-left> v<left>
    nnoremap <s-right> v<right>
    vnoremap <s-left> <left>
    vnoremap <s-right> <right>
    vnoremap <s-up> gk
    vnoremap <s-down> gj
    inoremap <s-up> <esc>vgk
    inoremap <s-down> <esc>vgj
    inoremap <s-left> <esc>v<left>
    inoremap <s-right> <esc>v<right>
"> 'ctrl+l' or ',,l' to select current line
    nnoremap <c-l> ^v$
    nnoremap <leader>l ^v$
    inoremap <c-l> <esc>^v$
    inoremap <leader>l <esc>^v$
"> 'ctrl+a' to select all
    nnoremap <c-a> ggvGG$
    inoremap <c-a> <esc>ggvGG$

" SPELL
"> ']n' to add word to dictionary
    nnoremap <leader>n zgi
    inoremap <leader>n <esc>zg i
"> ']m' to display the spell hints
    nnoremap <leader>m z=i
    inoremap <leader>m <esc>z=i

" CLIPBOARD
"> 'ctrl+x' or ',x' to cut
    vnoremap <c-x> "+c
    vnoremap <leader>x "+c
"> 'crtl+c' or ',c' to copy
    vnoremap <c-c> "+yi
    vnoremap <leader>c "+yi
"> 'crtl+v' or ',v' to paste
    nnoremap <c-v> "+pi
    nnoremap <leader>v "+pi
    inoremap <c-v> <esc> "+pi
    inoremap <leader>v <esc> "+pi

" COMMENT
" > include builtin comment plugin (Vim 8+)
    packadd comment
" ']l' to comment current line
    nmap <leader>l gcc
    imap <nowait> <leader>l <C-o>gcc
" ']p' to comment current paragraph
    nmap <leader>p gcap
    imap <nowait> <leader>p <C-o>gcap
" ']p' to comment selected code
    vmap <leader>p gc

" GENERAL
"> 'esc' is normal mode to move to insert mode
    nnoremap <esc> i
"> 'ctrl+s' to save
    nnoremap <c-s> :w!<cr>:startinsert<cr>
    inoremap <c-s> <esc> :w!<cr>:startinsert<cr>
    vnoremap <c-s> <esc> :w!<cr>
"> 'ctrl+q' to quit without saving
    nnoremap <c-q> :q!<cr>
    inoremap <c-q> <esc> :q!<cr>
    vnoremap <c-q> <esc> :q!<cr>
"> 'ctrl+z' to undo and 'ctrl+r' to redo 
    noremap <c-z> u
    inoremap <c-z> <c-o>u
    inoremap <c-r> <esc><c-r>i

" WINDOWS, TABS, BUFFERS and TABLINES
">> 'ctrl+tab' and 'alt+tab' to change tab
    nnoremap <c-tab> gt :startinsert<cr>
    inoremap <c-tab> <esc>gt :startinsert<cr>
    nnoremap <m-tab> gT :startinsert<cr>
    inoremap <m-tab> <esc>gT :startinsert<cr>
">> 'alt+left', 'alt+right', 'alt+up' and 'alt+down' to change window
    nnoremap <m-right> :winc l<cr>
    inoremap <m-right> <esc>:winc l<cr>
    nnoremap <m-left> :winc h<cr>
    inoremap <m-left> <esc>:winc h<cr>
    nnoremap <m-down> :winc j<cr>
    inoremap <m-down> <esc>:winc j<cr>
    nnoremap <m-up> :winc k<cr>
    inoremap <m-up> <esc>:winc k<cr>
">> 'ctrl+t' to open/close a terminal session. 'ctrl+q' to close it.
    nnoremap <c-t> :botright :term ++close<cr>
    inoremap <c-t> <esc>:botright :term ++close<cr>
    tnoremap <c-t> <c-d>
    tnoremap <c-q> <c-d>
