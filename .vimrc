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
let s:use_wrap = 0              "don't wrap by default
let s:use_spell_checking = 0    "spell checking for those who desire it
let s:use_spooky_skeletons = 1  "create files from skeleton
let s:use_arrow_keys = 0        "enable/disable arrow keys

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
Plugin 'kien/ctrlp.vim'                     " fuzzy file finder
Plugin 'tpope/vim-fugitive'                 " git wrapper
Plugin 'vim-scripts/dbext.vim'              " SQL completion
Plugin 'dhruvasagar/vim-table-mode'         " pretty ASCII tables 

call vundle#end()

if has("autocmd")
    filetype plugin indent on
endif

" +----------------------------------------------------------------------------+
" | TAGBAR SETTINGS                                                            |
" +----------------------------------------------------------------------------+

" open on the right hand side
let g:tagbar_left = 0

" don't sort tags
let g:tagbar_sort = 0

" tagbar window width
let g:tagbar_width = 60

" autofocus the tagbar when opened
let g:tagbar_autofocus = 1

" omit help, save space
let g:tagbar_compact = 1

" indent size
let g:tagbar_indent = 1

" show visibility (private/public/protected)
let g:tagbar_show_visibility = 1

" folds at a higher level are closed
let g:tagbar_foldlevel = 2

" fold symbols
let g:tagbar_iconchars = ['+', '-']

" disable buffer mappings in tagbar
autocmd FileType tagbar nnoremap <buffer> <Leader>t <nop>
autocmd FileType tagbar nnoremap <buffer> <Leader>n <nop>
autocmd FileType tagbar nnoremap <buffer> <Leader>p <nop>
autocmd FileType tagbar nnoremap <buffer> <Leader>qq <nop>

" +----------------------------------------------------------------------------+
" | CTRL P SETTINGS                                                            |
" +----------------------------------------------------------------------------+

" Use nearest .git file as root
let g:ctrlp_working_path_mode = 'r'

" Ignore certain files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" +----------------------------------------------------------------------------+
" | nerdtree SETTINGS                                                          |
" +----------------------------------------------------------------------------+

" Show hidden files
let NERDTreeShowHidden = 1

" NERDTree window width
let g:NERDTreeWinSize = 60

" disable buffer mappings in nerdtree
autocmd FileType nerdtree nnoremap <buffer> <Leader>t <nop>
autocmd FileType nerdtree nnoremap <buffer> <Leader>n <nop>
autocmd FileType nerdtree nnoremap <buffer> <Leader>p <nop>
autocmd FileType nerdtree nnoremap <buffer> <Leader>qq <nop>

" +----------------------------------------------------------------------------+
" | nerdcommenter SETTINGS                                                    |
" +----------------------------------------------------------------------------+

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Trim Whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" +----------------------------------------------------------------------------+
" | Indent Line  SETTINGS                                                      |
" +----------------------------------------------------------------------------+

" set indentLine color
let g:indentLine_color_term = 243

" Set indentLine character
let g:indentLine_char = '┆'

" +----------------------------------------------------------------------------+
" | Airline SETTINGS                                                           |
" +----------------------------------------------------------------------------+

" airline theme
let g:airline_theme='bubblegum'

" populate the airline_symbols dictionary with proper font glyphs
let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
    " let g:airline_symbols = {}
" endif

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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

" populate location list with diagnostic data, useful for jumping to error
let g:ycm_always_populate_location_list = 1

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

set clipboard=unnamed

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
set backspace=eol,start,indent

" arrow keys will move to prev/next line if needed
set whichwrap+=<,>,h,l

" ignore case during searching
set ignorecase

" if pattern contains uppercase letter, search is case sensitive
set smartcase

" highlight search matches
set hlsearch

" automatically navigate to first match
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

" disable visual bells and screen flashing
set novisualbell

set tm=500

" show information about current command
set showcmd

" use syntax based folding
set foldmethod=indent

" most folds open
set foldlevel=10

" abandoned buffers are hidden
set hidden

" last window status line? (0: never, 1: only if 2+ windows, 2: always)
set laststatus=2

" open new window to the right of current window
set splitright

" +----------------------------------------------------------------------------+
" | TERMINAL OPTIONS                                                           |
" +----------------------------------------------------------------------------+

" number of colors
set t_Co=256

" disable visual bell
set t_vb=

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

" determines how many columns backspace will delete
set softtabstop=4

" automatically indent based on last indent
set autoindent

augroup TABBING
    autocmd!
    autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

function! UseHybridNumbering()
    set relativenumber number
endfunction

function! UseRelativeNumbering()
    set relativenumber nonumber
endfunction

function! UseLineNumbering()
    set norelativenumber number
endfunction

function! DisableLineNumbering()
    set nonumber norelativenumber
endfunction

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

        nnoremap <silent> <F3> :YcmCompleter GoToDeclaration<CR>
        nnoremap <silent> <F4> :YcmCompleter GoToDefinition<CR>
        nnoremap <silent> <F5> :YcmCompleter GoToInclude<CR>

        nnoremap <space> za
        vnoremap <space> zf
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
" | UseWrap: Wrap Text                                                         |
" +----------------------------------------------------------------------------+
function! UseWrap(num)
    if a:num == 0
        set nowrap
    else
        set wrap
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
" | UseArrowKeys: Enables Arrow Keys                                           |
" +----------------------------------------------------------------------------+
function! UseArrowKeys(num)
    if a:num == 0
        inoremap <up> <nop>
        vnoremap <up> <nop>
        nnoremap <up> <nop>
        inoremap <down> <nop>
        vnoremap <down> <nop>
        nnoremap <down> <nop>
        inoremap <left> <nop>
        vnoremap <left> <nop>
        nnoremap <left> <nop>
        inoremap <right> <nop>
        vnoremap <right> <nop>
        nnoremap <right> <nop>
    else
        inoremap <up> <up>
        vnoremap <up> <up>
        nnoremap <up> <up>
        inoremap <down> <down>
        vnoremap <down> <down>
        nnoremap <down> <down>
        inoremap <left> <left>
        vnoremap <left> <left>
        nnoremap <left> <left>
        inoremap <right> <right>
        vnoremap <right> <right>
        nnoremap <right> <right>
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
autocmd BufWrite *.txt      :call DeleteTrailingWS()

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
execute "call UseWrap(".s:use_wrap.")"
execute "call UseSpellChecking(".s:use_spell_checking.")"
execute "call UseMappings(".s:use_mappings.")"
execute "call UseSkeletons(".s:use_spooky_skeletons.")"
execute "call UseArrowKeys(".s:use_arrow_keys.")"
execute "call UseHybridNumbering()"
