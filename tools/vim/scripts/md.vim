nnoremap <leader>cc :call <SID>copy_last_code_block()<CR> 
inoremap <leader>cc <esc>:call <SID>copy_last_code_block()<CR>i

function! MarkdownCustomHighlight()
    if exists("b:markdown_custom_highlight_loaded")
        return
    endif
    let b:markdown_custom_highlight_loaded = 1
    silent! syntax clear markdownSphinxAnchor
    silent! syntax clear markdownSphinxAnchorParen
    silent! syntax clear markdownSphinxAnchorContent
    silent! syntax clear markdownSphinxAnchorEquals
    silent! syntax clear markdownAutolink
    silent! syntax clear markdownAutolinkDelimiter
    silent! syntax clear markdownAutolinkContent

    syntax region markdownSphinxAnchor start=/\v\(([^)]*)\)=/ end=/=/ keepend oneline contains=markdownSphinxAnchorParen,markdownSphinxAnchorContent,markdownSphinxAnchorEquals
    syntax match markdownSphinxAnchorParen /(/ contained containedin=markdownSphinxAnchor
    syntax match markdownSphinxAnchorEquals /)=/ contained containedin=markdownSphinxAnchor
    syntax match markdownSphinxAnchorContent /\v[^()_=]+/ contained containedin=markdownSphinxAnchor
    syntax region markdownAutolink start=/{/ end=/}/ keepend oneline contains=markdownAutolinkDelimiter,markdownAutolinkContent
    syntax match markdownAutolinkContent /\v[^{}]+/ contained containedin=markdownAutolink
    syntax match markdownAutolinkDelimiter /{/ contained containedin=markdownAutolink
    syntax match markdownAutolinkDelimiter /}/ contained containedin=markdownAutolink

    hi link markdownSphinxAnchorParen   Comment
    hi link markdownSphinxAnchorEquals  Comment
    hi markdownSphinxAnchorContent ctermfg=4 ctermbg=none cterm=underline
    hi link markdownAutolinkDelimiter   Comment
    hi markdownAutolinkContent     ctermfg=1 ctermbg=none cterm=underline
endfunction
autocmd FileType markdown call MarkdownCustomHighlight()
autocmd FileType markdown call SyntaxRegion('```{ft}', '```')
