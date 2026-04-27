#! /usr/bin/env vim

" BASIC config
"> Modes  
">> do not use vi compatibility mode.  
    set nocompatible 
"> Cursor and Mouse  
">> show cursor in any mode. allow use of mouse in any mode. fast scroll. 
    set ruler
    set mouse=a
    set ttyfast
"> Search
">> make search case-insensitive. capital letters make search case-sensitive
    "set ignorecase 
    set smartcase
"> Window
">> show line numbers. show current mode. allow reuse the same windows.   
    set number 
    set laststatus=2 
    set hidden 
">> set left margin. Show filename in the terminal tab/window title 
    set numberwidth=2 
    set title
"> Completion
    set complete+=k
"> Clipboard 
    set clipboard+=unnamed,unnamedplus
    set go+=a
">> when leave vim, pass the vim selection to clipboard
"    autocmd VimLeave * call system("xclip -selection clipboard", getreg('"')) 
">> when open vim, copy clipboard selection to vim
"    autocmd VimEnter * let @" = system("xclip -selection clipboard -o")    
">> skip .swp files message 
    autocmd SwapExists * let v:swapchoice = "e"
">> use bash in interactive mode to access .bashrc from vim
    set shellcmdflag=-ic

"TEXT config
"> Indentation
">> auto indent for plugins and files.
    filetype plugin indent on  
    filetype indent on
    set autoindent
">> allow backspacing auto indented paragraphs.
    set breakindent
    set backspace=indent,eol,start
    set shiftwidth=4 
">> tab maximal/default space size. convert tab space in white space.  
    set tabstop=8                 
    set softtabstop=4           
    set expandtab
"> Folding, Canceal and Wrap
">> prevent folding
    set nofoldenable
">> wrap on the edge of the screen. move the cursor to the next line
    set wrap
    set whichwrap+=<,>,h,l
">> prevent wrapping in the middle of a word
    set linebreak
"> Highlight
">> enable 256-colors. allow syntax/search highlight. highlight cursor line.
    set t_co=256
    syntax enable
    set hlsearch
    set cursorline    
">> set default color scheme.
    colorscheme essence
"> Spelling
">> enable spell checker in specific programming languages. setting spelling languages.
    autocmd FileType tex,md,markdown setlocal spell
    autocmd FileType tex,md,markdown syntax spell toplevel
    set spelllang=en_us,pt_br
