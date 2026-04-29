
" ULTISNIPS
"> set the snippets directory
    let g:UltiSnipsSnippetDirectories=[expand($CONF_VIM . '/snippets')]
"> set the key to expand the snippets
    let g:UltiSnipsExpandTrigger="<s-tab>"
"> set the key to change the focus inside the snippet
    let g:UltiSnipsJumpForwardTrigger="<s-tab>"
    let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
