" PACKAGES {{{

set nocompatible    " no compatibility with vi
filetype off        " required for vundle

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'vim-scripts/ScrollColors'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'Raimondi/delimitMate'

NeoBundleLazy 'tpope/vim-endwise', {
\'autoload' : { 'insert' : 1, },}

NeoBundleLazy 'mbbill/undotree', {
\'autoload' : {'commands' : 'UndotreeToggle' },}

NeoBundleLazy 'scrooloose/nerdtree', {
\'augroup' : 'NERDTree',
\'autoload' : {'commands' : 'NERDTreeToggle' },}

NeoBundleLazy 'majutsushi/tagbar', {
\'autoload' : {'commands' : 'TagbarToggle' },}

NeoBundleLazy 'scrooloose/syntastic', {
\'autoload' : {'filetypes' : ['html', 'javascript', 'php', 'java', 'css', 'xml', 'json', 'cpp', 'h', 'haskell'], },}

NeoBundleLazy 'tpope/vim-rails', {
\'autoload' : {'filetypes' : ['ruby', 'rails'], },}

NeoBundleLazy 'marijnh/tern_for_vim', {
\'autoload' : {'filetypes' : ['javascript', ], },}

NeoBundleLazy 'mattn/emmet-vim/', {
\'autoload' : {'filetypes' : ['html', 'js', 'css', 'xml'], },}

NeoBundleLazy 'jakar/vim-json', {
\'autoload' : {'filetypes' : ['javascript', 'css', 'xml', 'json'], },}

NeoBundle 'oblitum/rainbow'

call neobundle#end()

filetype plugin indent on

" Installation check.
NeoBundleCheck

" }}}

" EDITING {{{

set backspace=indent,eol,start " backspacing
set notimeout ttimeout timeoutlen=50 " less wait in term
set history=200     " keep 200 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set showmatch       " show matching brackets while typing
set noerrorbells    " don't ring the bell
set lazyredraw      " don't redraw during macros
set scrolloff=5     " 5 lines will always appear below the cursor
set ttyfast         " indicate a fast term
set hlsearch        " highlight searches
set ignorecase      " case insensitive searching
set smartcase       " case sensitive for uppercase
set incsearch       " incremental searching
set expandtab       " turns a tab into a space
set autoindent      " always set indent on
set tabstop=4       " number of spaces a tab counts for
set smarttab        " intelligent tabbing
set shiftwidth=4    " all for 4
set sts=4           " about indenting
set diffopt=iwhite  " ignore white space in diffs
set undofile        " persistent undo even after exiting a file
set undodir=~/.vim/undo

autocmd FileType * setlocal formatoptions-=cro " Disable automatic comments.

" Mouse
if has('mouse')
    set mouse=a
    set ttymouse=xterm2
endif

" }}}

" FILES {{{

set hidden          " hides buffers instead of removing them
set nobackup        " don't keep a backup file
set autoread        " refreshes file constantly
set noswapfile      " sets no swap file

" Ignore these files.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.nzb,*.chf,*.part 
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.style,*.png
set wildignore+=*.o,*.obj,*.bak,*.m3u,*.avi,*.ssa,*.pdf
set wildignore+=*.sub,*.mp3,*.jpg,*.srt,*.idx,*.smi,*.chm
set wildignore+=*.nfo,*.mp4,*.sfv,*.mkv,*.rar,*.zip,*.class

" emulates autoread in the terminal
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
    endif
augroup END


" }}}

" THEME {{{

syntax on           " Color files automatically.
set cursorline      " Highlight the current line.

if v:version >= 704
    set number
    set relativenumber
    au WinEnter * :setlocal relativenumber
    au WinEnter * :setlocal number
    set regexpengine=1 " Old Regex Engine
else
    set relativenumber  " Numbers are not absolute.
endif

au WinEnter * :setlocal relativenumber
au WinLeave * :setlocal norelativenumber

set guioptions-=r  " Remove right-hand scrollbar.
set guioptions-=L  " Remove left-hand scrollbar.
set showbreak=↪    " Prettier linewraps.

if has('mac')
    "if !has("gui_running")
    "    " OSX terminal is slow, so disable a couple things.
    "    set noshowmatch         " Don't match parentheses/brackets
    "    set nocursorline        " Don't paint cursor line
    "    set nocursorcolumn      " Don't paint cursor column
    "    let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
    "    let html_no_rendering=1 " Don't render italic, bold, links in HTML
    "endif
    set guifont=Consolas:h12,Menlo:h12
    set shell=/bin/bash
    set clipboard^=unnamed  " Tmux copy paste integration.
elseif has('win32')
    set guifont=Consolas:h10
elseif has('unix')
    set t_Co=256       " Sets 256 colors in the terminal.
    set guioptions-=T  " Remove Toolbar.
    set guioptions-=m  " Remove Menubar.
    set gfn=Inconsolata\ for\ Powerline\ 12,Terminus\ 10
    set shell=/bin/bash
endif

set background=dark

if has('gui_running')
    if strftime("%H") < 4
        colorscheme fruity
    elseif strftime("%H") < 12
        colorscheme luna
    else
        colorscheme solarized
    endif
else
    if strftime("%H") < 12
        colorscheme molokai
    elseif strftime("%H") < 18
        colorscheme fruity
    else
        colorscheme badwolf
    endif
endif

hi SignColumn guibg=black

" Status line
set laststatus=2

" }}}

" KEYMAPS {{{

" Modifier
inoremap <C-U> <C-G>u<C-U>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
nnoremap <C-\> :pop<cr>
" Pop back to previous definition.

" Regular
noremap ; :
vnoremap ; :
" Use ; to do ex commands.
cmap Q qa!<cr>
" easier way to quit
cmap w!! w !sudo dd of=%<cr>
" root authority writing
nnoremap Y y$
" y$ yanks to the end of the line.
nnoremap D d$
" d$ deletes to the end of the line.
nnoremap C c$
" c$ changes to the end of the line.
imap jk <Esc>
" esc returns to command mode.
nnoremap Q gq
" Don't use Ex mode, use Q for formatting.
vnoremap < <gv
vnoremap > >gv
" Reselect text after identing
nnoremap ' `
nnoremap ` '
" Closer way to get to where you were last.

" Leader
nnoremap <space> <nop>
let mapleader=" "
let maplocalleader=" "
" change the mapLeader from \ to ,
nnoremap <Leader>t :TagbarToggle<CR>
" toggles the tagbar with tt
nnoremap <Leader><space> :noh<cr>
" map ,space to clear search results
nnoremap <Leader>v :e ~/.vimrc<cr>
" open vimrc in another split
nnoremap <Leader>wv :vsplit<cr>
nnoremap <Leader>wh :split<cr>
" vertical/horizontal splits
nnoremap <Leader>n :NERDTreeToggle<cr>
" Toggles NerdTree
nnoremap <Leader>= m`gg=G``
" Indent the whole file and return to original position
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Edit file, starting in same directory as current file

nnoremap <Leader>u :UndotreeToggle<CR>

nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>r :CtrlPMRU<CR>

" }}}

" FOLDING {{{

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

set foldenable      " Turn on folding
au FileType vim set foldmethod=marker
au FileType txt set foldmethod=marker

au FileType python set foldmethod=indent
au FileType c,cpp,java,ruby,php,css,html,eruby,javascript set foldmethod=syntax
au FileType python,c,cpp,java,ruby,php,css,html,eruby,javascript set foldlevel=4

"}}}

" WEB {{{

"Indentation
autocmd FileType javascript,eruby,ruby,html,css,php set shiftwidth=2
autocmd FileType javascript,eruby,ruby,html,css,php set tabstop=2
autocmd FileType javascript,eruby,ruby,html,css,php set sts=2
autocmd FileType javascript,eruby,ruby,css,php,python set textwidth=79

" Set the filetype for use with Sparkup
autocmd BufNewFile,BufRead *.xml,*.tpl set ft=html

" HTML in php files.
au BufRead,BufNewFile *.php set ft=php.html

" }}}

" PLUGIN {{{

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Easytags
let g:easytags_include_members = 1
let g:easytags_python_enabled = 1
let g:easytags_file = '~/.vim/tags/easytags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_updatetime_warn = 0

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" NerdTree
" Close Vim if only NerdTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=0
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows=0
let g:NERDTreeCasadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowLineNumbers=1

" Rainbow Parens
let g:rainbow_active = 1

" Signify
let g:signify_mapping_next_hunk = '<nop>'
let g:signify_mapping_prev_hunk = '<nop>'
let g:signify_mapping_toggle_highlight = '<nop>'
let g:signify_mapping_toggle = '<nop>'

" Syntastic
let g:syntastic_check_on_open        = 1 " run syntastic on open and save
let g:syntastic_enable_balloons      = 1 " display errors in tool tips
let g:syntastic_enable_highlighting  = 1 " mark errors with syntax highlighting
let g:syntastic_auto_jump            = 0 " jump to the first error on save
let g:syntastic_auto_loc_list        = 2 " open and close automatically
let g:syntastic_enable_signs         = 1 " errors to the left
let g:syntastic_error_symbol         = "✗"
let g:syntastic_warning_symbol       = "⚠"
let g:syntastic_style_error_symbol   = "s✗"
let g:syntastic_style_warning_symbol = "s⚠"
let g:syntastic_mode_map             = { 'passive_filetypes': ['java', 'cpp', 'c', 'python'] }

" TagBar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" YouCompleteMe
autocmd VimEnter * call FindYouCompleteMeConf()
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {
  \ 'c' : ['->', '.'],
  \ 'objc' : ['->', '.'],
  \ 'ocaml' : ['.', '#'],
  \ 'cpp,objcpp' : ['->', '.', '::'],
  \ 'perl' : ['->'],
  \ 'php' : ['->', '::'],
  \ 'cs,css,haskell,java,javascript,d,ruby' : ['.'],
  \ 'python,perl6,scala,vb,elixir,go' : ['.'],
  \ 'lua' : ['.', ':'],
  \ 'erlang' : [':'],
  \ }

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" }}}

" COMPLETION {{{

" Various
set omnifunc=syntaxcomplete#Complete " Default Completion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType haskell set omnifunc=necoghc#omnifunc

set completeopt=menuone

" Tags
set tags+=~/.vim/tags/cpp_src
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/easytags

" Smooth Scroll 
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" }}}

" FUNCTIONS {{{

function! FindYouCompleteMeConf()
    if &ft == 'c'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.c/ycm_extra_conf.py" 
    elseif &ft == 'objcpp' || &ft == 'objc'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.obj/ycm_extra_conf.py"
    else  
        let g:ycm_global_ycm_extra_conf = "~/.vim/.cpp/ycm_extra_conf.py"
    endif
endfunction

" }}}
