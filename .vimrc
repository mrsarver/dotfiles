" +----------------------------------------------------------------------------+
" | MAINTAINER:																   |
" | 	M.R. Sarver															   |
" | 	msarver2010@gmail.com												   |
" +----------------------------------------------------------------------------+

" +----------------------------------------------------------------------------+
" | VARIABLES																   |
" +----------------------------------------------------------------------------+
let s:vimrc_reload = 1          "auto-reload the vimrc
let s:use_mappings = 1          "use my mappings
let s:use_col_hilite = 0        "highlight columns after 80
let s:use_spell_checking = 0    "spell checking for those who desire it
let s:use_spooky_skeletons = 1  "create files from skeleton

" +----------------------------------------------------------------------------+
" | VUNDLE SETTINGS                                                            |
" +----------------------------------------------------------------------------+
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Vundle Plugin
Plugin 'scrooloose/nerdtree'                " filesystem explorer
Plugin 'scrooloose/nerdcommenter'           " yay comments
Plugin 'vim-airline/vim-airline'            " buffer madness fix
Plugin 'vim-airline/vim-airline-themes'     " airline themes
Plugin 'Valloric/YouCompleteMe'             " YouCompleteMe
Plugin 'Yggdroot/indentLine'                " Indent Lines
Plugin 'rdnetto/YCM-Generator'              " YouCompleteMe config generator
Plugin 'majutsushi/tagbar'                  " show tags in file

call vundle#end()

if has("autocmd")
    filetype plugin indent on
endif

" +----------------------------------------------------------------------------+
" | NERDTree SETTINGS                                                          |
" +----------------------------------------------------------------------------+

" Show hidden files
let NERDTreeShowHidden = 1

" NERDTree window width
let g:NERDTreeWinSize = 60

" start NERDTree automatically
autocmd vimenter * NERDTree

" focus on the actual file instead of NERDTree
autocmd vimenter * wincmd p

" close NERDTree if it's the last man standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open new window to the right of current window
set splitright

" +----------------------------------------------------------------------------+
" | NERD Commenter SETTINGS                                                    |
" +----------------------------------------------------------------------------+

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" +----------------------------------------------------------------------------+
" | Indent Line  SETTINGS                                                      |
" +----------------------------------------------------------------------------+

" set indentLine color
let g:indentLine_color_term = 237

" Set indentLine character
let g:indentLine_char = '┆'

" +----------------------------------------------------------------------------+
" | Airline SETTINGS                                                           |
" +----------------------------------------------------------------------------+
set laststatus=2

" airline theme
let g:airline_theme='bubblegum'

" populate the airline_symbols dictionary with proper font glyphs
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols (useful for fallback)
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" close tab, remove buffer
set hidden

" +----------------------------------------------------------------------------+
" | YouCompleteMe SETTINGS                                                     |
" +----------------------------------------------------------------------------+

" prevent weird funky preview window stuff from occurring
let g:ycm_autoclose_preview_window_after_insertion = 1

" just disable the preview window
set completeopt-=preview

" global YCM file
let g:ycm_global_ycm_extra_conf ='/home/luna/dev/cpp/.ycm_extra_conf.py'

" whitelist files in ~/dev/ only
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']

" +----------------------------------------------------------------------------+
" | GENERAL VIM SETTINGS                                                       |
" +----------------------------------------------------------------------------+

"reflect vimrc changes immediately
if s:vimrc_reload == 1
    augroup RELOAD
        autocmd!
        au BufWritePost $MYVIMRC so $MYVIMRC
    augroup END
endif

" enable line numbers
set number

" enable mouse
set mouse=a

" default use utf8
set encoding=utf8

" standard filetype is Unix
set ffs=unix,dos,mac

" sets command history
set history=1000

" don't worry about file backups
set nobackup
set nowritebackup
set noswapfile

" disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" keep 5 lines above and below cursor while scrolling
set scrolloff=5

" enable the ruler
set ruler

" command line height
set cmdheight=2

" don't wrap lines
set nowrap
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case during searching
set ignorecase

" if pattern contains uppercase letter, search is case sensitive
set smartcase

" highlight search matches
set hlsearch
set incsearch

" find matching brackets
set showmatch

" tenths of a second matching brackets blink
set mat=1

" fancy tab completion
set wildmenu

" vim file tab completion
set wildmode=longest:full,full

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" remove error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" show information about current command
set showcmd

" +----------------------------------------------------------------------------+
" | COLORS                                                                     |
" +----------------------------------------------------------------------------+
syntax enable

augroup COLORSCHEME
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

set background=dark
colorscheme bubblegum-256-dark

" color line numbers
highlight LineNr ctermfg=white

" if we have support for 256 colors, use it
set t_Co=256

" dont highlight current line
set nocursorline

" dont highlight current column
set nocursorcolumn

" only redraw when needed
set lazyredraw

" +----------------------------------------------------------------------------+
" | TABBING																	   |
" +----------------------------------------------------------------------------+

" expand tabs into spaces
set expandtab

" insert 4 spaces whenever you press <TAB>
set shiftwidth=4

" determines how many columns a tab should be made up of
set tabstop=4

" automatically indent based on last indent
set autoindent

augroup TABBING
    autocmd!
    autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

" +----------------------------------------------------------------------------+
" | SKELETONS: When you create new file, automagically generate basic comments |
" |                                                                            |
" | thank mr skeltal                                                           |
" +----------------------------------------------------------------------------+
function! UseSkeletons(num)
    if has("autocmd") && s:use_spooky_skeletons == 1
        augroup Skeletons
            autocmd!
            autocmd BufNewFile *.cpp execute ':0r ~/.vim/skeleton/skeleton.cpp'
            autocmd BufNewFile *.c execute ':0r ~/.vim/skeleton/skeleton.c'
            autocmd BufNewFile *.h execute ':0r ~/.vim/skeleton/skeleton.h'
            autocmd BufNewFile *.html execute ':0r ~/.vim/skeleton/skeleton.html'
            autocmd BufNewFile *.py execute ':0r ~/.vim/skeleton/skeleton.py'
            autocmd BufNewFile *.sh execute ':0r ~/.vim/skeleton/skeleton.sh'
            autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
        augroup END
    endif
endfunction

" +----------------------------------------------------------------------------+
" | UseMappings: Use My Special Mappings                                       |
" +----------------------------------------------------------------------------+

" specify Leader as comma
let mapleader = ","

function! UseMappings(num)
    if a:num == 0
        "unset stuff here to default?
        echo a:num
    else
        nnoremap ; :

        nnoremap <silent> <C-D> :NERDTreeToggle<CR>

        " Open a new empty 'tab'
        nnoremap <Leader>t :enew<CR>

        " move to next 'tab'
        nnoremap <Leader>n :bnext<CR>

        " move to previous 'tab'
        nnoremap <Leader>p :bprevious<CR>

        " Close the current buffer and move to the previous one
        nnoremap <Leader>qq :bp <BAR> bd #<CR>

        " quickly open and edit vimrc
        nnoremap <silent> <Leader>vrc :enew<CR>:e ~/.vimrc<CR>

        " quickly open and edit bashrc
        nnoremap <silent> <Leader>brc :enew<CR>:e ~/.bashrc<CR>

        " quickly open Tagbar
        nnoremap <silent> <C-T> :TagbarToggle<CR>
    endif
endfunction

" +----------------------------------------------------------------------------+
" | UseColHilite: Highlight Columns 81+                                        |
" +----------------------------------------------------------------------------+
function! UseColHilite(num)
    if a:num == 0
        highlight clear ColorColumn
    else
        let &colorcolumn=join(range(81, 999), ',')
        highlight ColorColumn ctermbg=237
    endif
endfunction

" +----------------------------------------------------------------------------+
" | UseSpellChecking: For those who can't English good                         |
" +----------------------------------------------------------------------------+
function! UseSpellChecking(num)
    if a:num == 0
        set nospell
    else
        setlocal spell spelllang=en_us
        highlight clear SpellBad
        highlight clear SpellCap
        highlight SpellBad ctermbg=red ctermfg=white
        highlight SpellCap cterm=underline
        set spell
    endif
endfunction

" +----------------------------------------------------------------------------+
" | DeleteTrailingWS: Remove any trailing whitespace from file                 |
" +----------------------------------------------------------------------------+
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

" automagically call this for certain files
autocmd BufWrite *.py       :call DeleteTrailingWS()
autocmd BufWrite *.cpp      :call DeleteTrailingWS()
autocmd BufWrite *.c        :call DeleteTrailingWS()
autocmd BufWrite *.h        :call DeleteTrailingWS()
autocmd BufWrite *.java     :call DeleteTrailingWS()
autocmd BufWrite *.sql      :call DeleteTrailingWS()

" +----------------------------------------------------------------------------+
" | Browser: Open URL in browser                                               |
" +----------------------------------------------------------------------------+
function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    "exec "!konqueror ".line
endfunction

" +----------------------------------------------------------------------------+
" | Default Setup                                                              |
" +----------------------------------------------------------------------------+
execute "call UseColHilite(".s:use_col_hilite.")"
execute "call UseSpellChecking(".s:use_spell_checking.")"
execute "call UseMappings(".s:use_mappings.")"
execute "call UseSkeletons(".s:use_spooky_skeletons.")"
