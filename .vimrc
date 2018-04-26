" @file:    vimrc
" @author:  mrsarver

" +----------------------------------------------------------------------------+
" | VARIABLES																                                   |
" +----------------------------------------------------------------------------+

" Automatically reloads ~/.vimrc when changes are made and saved
let s:vimrc_reload = 1

" Uses custom keymappings.  Set to 0 for default vim
let s:use_mappings = 1

" Applies a highlighting guideline at 80 characters
let s:use_col_hilite = 1

" Enables text wrapping
let s:use_wrap = 0

" Enables Spell Check
let s:use_spell_checking = 0

" Enables Skeleton Template files
let s:use_spooky_skeletons = 1

" Enables Arrow Key Navigation
let s:use_arrow_keys = 1

" Toggles automatic pairing of quotes, brackets, etc
let s:auto_match_enabled = 1

" +----------------------------------------------------------------------------+
" | VUNDLE SETTINGS                                                            |
" +----------------------------------------------------------------------------+

" Disable Vi compatible editing
set nocompatible
filetype off

" Add Vundle to runtime path
set runtimepath+=~/.vim/bundle/Vundle.vim
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

" automatically close tagbar after selection
let g:tagbar_autoclose = 1

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

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

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
let g:ycm_extra_conf_globlist = ['~/src/*','!~/*']

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
set whichwrap+=<,>

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

" the time (in milliseconds) that is waited for a key sequence to complete
set ttimeoutlen=500

" show information about current command
set showcmd

" use syntax based folding
set foldmethod=syntax

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

" @brief    Use tabbing requirements for work
function! UseAZWorkTabbing()

    " expand tabs into spaces (use CTRL-V<Tab> for real tab)
    set expandtab

    " number of spaces to use for each step of autoindent
    set shiftwidth=2

    " number of spaces that a <Tab> in the file counts for
    set tabstop=2

    " expand tabs into spaces
    set softtabstop=2

    " cindent is configuration, see cinoptions
    set cindent

    " cinoptions is how vim performs indentation
    set cinoptions=>s,e0,n0,f0,{1s,t0,i0,(0,u0,)20,*70,#0,b0,l0

endfunction

" @brief    Current line number is absolute, other lines are relative
function! UseHybridNumbering()
    set relativenumber number
endfunction

" @brief    Use relative line numbering for all lines, current line is line 0
function! UseRelativeNumbering()
    set relativenumber nonumber
endfunction

" @brief    Use absolute line numbering for all lines
function! UseLineNumbering()
    set norelativenumber number
endfunction

" @brief    Disables all line numbering
function! DisableLineNumbering()
    set nonumber norelativenumber
endfunction

" @brief    When you create a new file of a specific type, automatically
"           generate basic documentation for that file
" @note     thank mr skeltal
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

" @brief    Remaps the Parenthesis, Brackets, and Quotes keys in Insert Mode to
"           automatically insert a matching closing character.  Closing
"           characters will be skipped if there is a matching opening character.
" @note     Requires vim 7.0+
function! EnableAutoCloseBrackets()

    " maps \" to automatically insert a matching \", moves cursor inside pair
    inoremap " ""<left>

    " skip closing \" if there is a matching opening \"
    inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

    " maps \' to automatically insert a matching \', moves cursor inside pair
    inoremap ' ''<left>

    " skip closing \' if there is a matching opening \"
    inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

    " maps ( to automatically insert a matching ), moves cursor inside pair
    inoremap ( ()<left>

    " skip closing ) if there is a matching opening (
    inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

    " maps [ to automatically insert a matching ], moves cursor inside pair
    inoremap [ []<left>

    " skip closing ] if there is a matching opening [
    inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

    " maps { to automatically insert a matching }, moves cursor inside pair
    inoremap { {}<left>

    " skip closing } if there is a matching opening {
    inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

    " inoremap {<BS> <nop>
    " inoremap (<BS> <nop>
    " inoremap [<BS> <nop>

    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O
endfunction

" specify Leader as comma
let mapleader = ","

" @brief    Uses customized key bindings
function! UseMappings(num)
    if a:num == 0
        "unset stuff here to default?
        echo a:num
    else

        nnoremap ; :

        nnoremap <silent> <Leader>d :NERDTreeToggle<CR>

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
        nnoremap <silent> <F8> :TagbarOpenAutoClose<CR>
        nnoremap <silent> <F9> :TagbarClose<CR>

        nnoremap <silent> <F3> :YcmCompleter GoToDeclaration<CR>
        nnoremap <silent> <F4> :YcmCompleter GoToDefinition<CR>
        nnoremap <silent> <F5> :YcmCompleter GoToInclude<CR>

        nnoremap <space> za
        vnoremap <space> zf
    endif
endfunction

" @brief    Hilights columns 81+ with gre
function! UseColHilite(num)
    if a:num == 0
        highlight clear ColorColumn
    else
        let &colorcolumn=join(range(81, 999), ',')
        highlight ColorColumn ctermbg=237
    endif
endfunction

" @brief    Enables text wrap
function! UseWrap(num)
    if a:num == 0
        set nowrap
        set textwidth=0
    else
        set wrap
    endif
endfunction

" @brief    Enables spell check
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

" @brief    Enables arrow keys as valid method of navigating a file
" @detail   If !num, arrow keys become no-ops
" @note     Useful as a training tool to get into the vim mindset
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

" @brief    Detects and deletes trailing whitespace
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

" Initialize vim with personalized settings
execute "call UseColHilite(".s:use_col_hilite.")"
execute "call UseWrap(".s:use_wrap.")"
execute "call UseSpellChecking(".s:use_spell_checking.")"
execute "call UseMappings(".s:use_mappings.")"
execute "call UseSkeletons(".s:use_spooky_skeletons.")"
execute "call UseArrowKeys(".s:use_arrow_keys.")"
execute "call UseHybridNumbering()"
execute "call UseAZWorkTabbing()"
execute "call EnableAutoCloseBrackets()"
