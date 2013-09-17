
"General options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set the no vi combatible
set nocompatible

"set syntax
syntax on

" turn on line numbers
set number

"set statusline
set laststatus=2
set statusline=%t%m%=%c::%l/%L

"show commands in bottom right
set showcmd

"begin pathogen
execute pathogen#infect()


"Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set command aliases
:command! Cterm ConqueTerm bash
:command! Ctermsplit ConquTermSplit bash
:command! Ctermvsplit ConqueTermVSplit bash
:command! W w
:command! Tab s/\t/    /g


"set leader key to \
let mapleader = "\\"

let @a=':s/<\/p>\n/ /g:s/<p class="calibre2">//g^i<p class="calibre2">$A</p>o'


"set leader key mappings
nnoremap <leader>c :Ctermvsplit<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>w <C-w>w

"remap functions to keys 
nnoremap <leader>J :call LazyScroll("down")<cr>
nnoremap <leader>K :call LazyScroll("up")<cr>
nnoremap <leader>r :call ToggleNumbering()<cr>
"au InsertLeave * call NoCapsLock()<cr>

"some eclim mappings TODO need to come up with a better way to do this
"starts eclim service crap
nnoremap <leader>e :PingEclim<cr>
"opens project tree
nnoremap <leader>t :ProjectTree 
"some java specific mappings
au FileType java nnoremap <buffer> <leader>o :JavaImport<cr>
au FileType java nnoremap <buffer> <leader>O :JavaImportOrganize<cr>
au FileType java nnoremap <buffer> <leader>a :JavaCorrect<cr>
au FileType java nnoremap <buffer> <leader>i :JavaImpl<cr>

"Indentation and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set tab size to 4
set tabstop=4
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set smarttab
set smartindent


"if ruby related files, set tab to 2
"TODO find a better way to do this, for multiple file types
au FileType ruby set tabstop=2
au FileType ruby set ts=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2

" auto indent
set autoindent

" This is for filetype specific behavior (i.e. python is different than c++)
filetype indent plugin on


"Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set colorscheme
colorscheme molokai

"chage vimdiff colors
"if &diff
    highlight DiffAdd ctermbg=red ctermfg=black
    highlight DiffChange ctermbg=red ctermfg=black
    highlight DiffDelete ctermbg=red ctermfg=black
"endif
    
"turn on rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"turn off cursor matching parentheses
hi clear MatchParen
hi MatchParen term=underline cterm=underline,bold gui=underline,bold

"Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set folding
set foldmethod=indent
"set foldnestmax=2
set nofoldenable
"set foldcolumn=10


"save foldings
au BufWinLeave * silent! mkview
au BufWinenter * silent! loadview


"Line Numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"make sure that vim opens in relative numbering mode
"only on versions that support it
"if version >= 703
"    set relativenumber
"    " toggle line numbering type depending on mode
"    au InsertEnter * call ToggleNumbering()
"    au InsertLeave * call ToggleNumbering()
"endif

"define functions here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"function to scroll up or down
function! LazyScroll(direction)
    let topLine = 1
    let botLine = line('$')
    if a:direction == 'up' && line('.') == topLine
        echom "Already at top!"
    elseif a:direction == 'down' && line('.') == botLine
        echom "Already at bottom!"
    else
        let overlapLineNum = 4
        normal! H
        let topLineVisible = line('.')
        normal L!
        let botLineVisible = line('.')
        let moveCountdown = botLineVisible - topLineVisible - overlapLineNum
        if a:direction ==? "up"
            normal! H
            while moveCountdown > 0 && line('.') != topLine
                normal! k
                redraw
                sleep 20m
                let moveCountdown -= 1
            endwhile
        elseif a:direction ==? "down"
            normal! L
            while moveCountdown > 0 && line('.') != botLine
                normal! j
                redraw
                sleep 20m
                let moveCountdown -= 1
            endwhile
        endif
        " TODO
        " at this point, check if the line the cursor was one before
        " the move is still on the screen. if it is, move cursor
        " there endif
endfunction

"toggle absolute/relative line numbering
function! ToggleNumbering()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction

"turn off caps lock
function! NoCapsLock()
    echo system("python2 ", 'from ctypes import *; X11 = cdll.LoadLibrary("libX11.so.6"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)')
endfunction

