" File:       essence.vim
" Maintainer: Yuri Ximenes Martins <yx@yx.dev.br>
" Modified:   2024-05-09
" License:    MIT

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'essence'

" defining colors
let s:dark = '#000000'
let s:dark2 = '#0f0f0f'

" TERMINAL colors
    let g:terminal_ansi_colors = [  
        \ '#000000',
        \ '#ff5f5f',
        \ '#87af87',
        \ '#d7d787',
        \ '#87afd7',
        \ '#af87d7',
        \ '#ea9c80', 
        \ '#808080',
        \ '#2b2b2b',
        \ '#464646',
        \ '#afd787',
        \ '#d7d700',
        \ '#87afaf',
        \ '#b6b3eb',
        \ '#af875f',
        \ '#D0D0D0',
        \ ]

" BASICS colors
"> Background
    hi Normal ctermbg=0 ctermfg=15
    hi NormalFg ctermbg=NONE ctermfg=15
    hi Invisible ctermbg=0 ctermfg=0
"> Text Style
    hi Bold ctermbg=none ctermfg=12 cterm=bold
    hi Italic ctermbg=none ctermfg=12 cterm=italic
    hi Underlined ctermbg=none ctermfg=12 cterm=underline
    hi Code ctermbg=none ctermfg=13 
    hi Comment ctermfg=7
    hi Conceal ctermbg=NONE ctermfg=NONE
    hi Constant ctermfg=5
    hi NonText ctermfg=7
    hi Whitespace ctermfg=7
    hi Function ctermfg=4
    hi Title ctermfg=14
    hi Todo ctermbg=NONE ctermfg=6
    hi Operator ctermfg=4
    hi Special ctermfg=14
    hi SpecialKey ctermfg=14
    hi linkText ctermbg=NONE ctermfg=4 cterm=underline
    hi MatchParen ctermbg=14 ctermfg=0
    hi String ctermfg=12
    hi Type ctermfg=9
    hi Highlight ctermbg=8 ctermfg=14
    hi Delimiter ctermfg=14
    hi Folded ctermbg=0 ctermfg=7
    hi FoldColumn ctermbg=0 ctermfg=7
    hi Identifier cterm=NONE ctermfg=12
    hi Statement ctermfg=4
    hi Structure ctermfg=4
    hi StorageClass ctermfg=4
"> Search
    hi Search ctermbg=8 ctermfg=6
    hi IncSearch cterm=reverse ctermfg=NONE term=reverse  
"> Diff
    hi DiffAdd ctermbg=8 ctermfg=2
    hi DiffChange ctermbg=8 ctermfg=4
    hi DiffDelete cterm=NONE ctermbg=8 ctermfg=1
    hi DiffText cterm=NONE ctermbg=8 ctermfg=6
    hi diffAdded ctermbg=8 ctermfg=2
    hi diffRemoved cterm=NONE ctermbg=8 ctermfg=1
"> Error
    hi Error ctermbg=8 ctermfg=1
    hi ErrorMsg ctermbg=8 ctermfg=1
    hi WarningMsg ctermbg=8 ctermfg=1
"> Spell
    hi SpellBad ctermbg=6 ctermfg=0
    hi SpellCap ctermbg=13 ctermfg=0
    hi SpellLocal ctermbg=13 ctermfg=0
    hi SpellRare ctermbg=4 ctermfg=0
"> Cursor
    hi ColorColumn cterm=NONE ctermbg=8 ctermfg=NONE
    hi CursorColumn cterm=NONE ctermbg=8 ctermfg=NONE
    hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE 
    hi Cursor ctermbg=15 ctermfg=NONE
    hi CursorLineNr cterm=NONE ctermbg=8 ctermfg=14
    hi TermCursorNC ctermbg=8 ctermfg=0
"> Status Line
    hi StatusLine cterm=reverse ctermbg=8 ctermfg=0 term=reverse
    hi StatusLineTerm cterm=reverse ctermbg=8 ctermfg=0 term=reverse
    hi StatusLineNC cterm=reverse ctermbg=8 ctermfg=0
    hi StatusLineTermNC cterm=reverse ctermbg=8 ctermfg=0
"> Tab Line
    hi TabLine cterm=NONE ctermbg=0 ctermfg=0
    hi TabLineFill ctermbg=15 ctermfg=0
    hi TabLineSel cterm=NONE ctermbg=15 ctermfg=0
"> Line Number
    hi LineNr ctermbg=0 ctermfg=8
    hi SignColumn ctermbg=0 ctermfg=8
"> Buffer
    hi EndOfBuffer ctermfg=0
    hi VertSplit cterm=NONE ctermbg=NONE ctermfg=NONE
    hi Visual ctermbg=8 ctermfg=NONE
    hi VisualNOS ctermbg=8 ctermfg=NONE
"> Messages
    hi ModeMsg ctermfg=14
    hi MoreMsg ctermfg=3
"> Other
    hi Ignore ctermbg=NONE ctermfg=NONE
    hi Include ctermfg=4

" NETRW
    hi Directory ctermfg=12  

" ALE
    hi ALEErrorSign ctermbg=8 ctermfg=15
    hi ALEWarningSign ctermbg=8 ctermfg=15
    hi ALEVirtualTextError ctermfg=1
    hi ALEVirtualTextWarning ctermfg=1  

" PMENU (LSP)
    hi Pmenu ctermfg=15 ctermbg=8
    hi PmenuSel ctermfg=9 ctermbg=8
    hi link PmenuKind                     Pmenu
    hi link PmenuKindSel                  PmenuSel
    hi link PmenuExtra                    Pmenu
    hi link PmenuExtraSel                 PmenuSel
    hi link PmenuSbar                     Pmenu 
    hi link PmenuThumb                    Pmenu

" MARKDOWN
    hi link markdownItalic                Italic
    hi link markdownItalicDelimiter       Comment
    hi link markdownBold                  Bold
    hi link markdownBoldDelimiter         Comment
    hi link markdownBoldItalic            BoldItalic 
    hi link markdownBoldItalicDelimiter   Comment
    hi link markdownStrike                Highlight
    hi link markdownStrikeDelimiter       Comment
    hi link markdownCode                  Code
    hi link markdownCodeDelimiter         Code
    hi link markdownHeadingDelimiter      Normal
    hi link markdownUrl                   Comment
    hi link markdownLinkText              linkText
    hi link markdownUrlTitle              linkText
    hi link markdownIdDelimiter           Delimiter
    hi link markdownUrlDelimiter          Delimiter
    hi link markdownUrlTitleDelimiter     Delimiter

hi! link ToolbarButton TabLineSel
hi! link ToolbarLine TabLineFill

" HTML
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement

" CSS
hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot NormalFg
hi! link cssPseudoClassId Special
hi! link cssTagName Statement

hi! link jsonQuote NormalFg

hi! link phpVarSelector Identifier

hi! link pythonFunction Title

hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String

hi! link rustFuncCall NormalFg
hi! link rustFuncName Title
hi! link rustType Constant

hi! link sassClass Special

hi! link shFunction NormalFg

" VIM
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar NormalFg
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar NormalFg

" XML
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement

" YAML

hi! link yamlKeyValueDelimiter Delimiter

hi! link deniteMatched NormalFg
hi! link deniteMatchedChar Title

" TEX (Vimtex Syntax
"> General Delimiters
    hi! texDelim ctermfg=14
"> Commands
    hi! texCmd ctermfg=12
    hi! texOpt ctermfg=4
    hi! texArg ctermfg=5
"> Document Class
    hi! texCmdClass ctermfg=5
"> Packages
    hi! texCmdPackage ctermfg=5
"> Includes
    hi! texCmdInput ctermfg=5
"> Newtheorem
    hi! texCmdNewthm ctermfg=5
"> Options
    hi! texFileOpt ctermfg=2
    hi! texFilesOpt ctermfg=2
    hi! texNewthmOptCounter ctermfg=2
"> Arguments
    hi! texFileArg ctermfg=12
    hi! texFilesArg ctermfg=12
    hi! texNewthmArgName ctermfg=12
    hi! texNewthmArgPrinted ctermfg=14
"> Title
    hi! texCmdTitle ctermfg=5
    hi! texTitleArg ctermfg=12
"> Author
    hi! texCmdAuthor ctermfg=5
    hi! texAuthorOpt ctermfg=2
    hi! texAuthorArg ctermfg=12
"> Sections
    hi! texCmdPart ctermfg=4
    hi! texPartArgTitle ctermfg=9
"> Environments
    hi! texCmdEnv ctermfg=4
    hi! texEnvArgName ctermfg=2
    hi! texCmdItem ctermfg=5
"> References
    hi! texCmdRef ctermfg=5
    hi! texRefArg ctermfg=13
"> Math Delimiters
    hi! texMathDelimZone ctermfg=14
    hi! texMathZoneLI ctermfg=14
    hi! texMathZoneLD ctermfg=14
    hi! texMathZoneTI ctermfg=14
    hi! texMathZoneTD ctermfg=14
"> Equation Env
    hi! texCmdMathEnv ctermfg=4
    hi! texMathEnvArgName ctermfg=2
    hi! texMathZoneEnv ctermfg=14
    hi! texMathZone ctermfg=12
"> Operators
    hi! texMathOper ctermfg=14
    hi! texMathSub ctermfg=14
    hi! texMathSuper ctermfg=14
    hi! texMathSuperSub ctermfg=14
"> Tikzcd
"> Error
    hi! texMathError ctermfg=0 ctermbg=9
