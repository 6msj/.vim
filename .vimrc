" PACKAGES - - - - {{{

set nocompatible 	" no compatibility with vi
filetype off 		" required for vundle

set rtp+=vim/,~/.vim/bundle/vundle/,~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'shemerey/vim-peepopen'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/ScrollColors'
Bundle 'vim-scripts/CSApprox'
Bundle 'vim-scripts/a.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/cocoa.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-eunuch'
Bundle 'Lokaltog/powerline'
Bundle 'sjl/gundo.vim'
Bundle "myusuf3/numbers.vim"
Bundle 'paradigm/TextObjectify'
Bundle 'vim-ruby/vim-ruby'
Bundle 'godlygeek/tabular'
Bundle 'jakar/vim-json'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mattn/zencoding-vim'
Bundle 'honza/vim-snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'klen/python-mode'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Twinside/vim-haskellFold'
Bundle 'vim-scripts/Haskell-Conceal'
Bundle 'powerman/vim-plugin-viewdoc'
Bundle 'ujihisa/neco-ghc'

"Bundle 'FredKSchott/CoVim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'Shougo/vimshell.vim'
"Bundle 'airblade/vim-rooter'
"Bundle 'vim-scripts/LustyExplorer'
"Bundle 'davidhalter/jedi-vim'
"Bundle 'jiangmiao/auto-pairs'
"Bundle 'wincent/Command-T'
"Bundle 'Rip-Rip/clang_complete'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-dispatch'
"Bundle 'Shougo/vimfiler.vim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
filetype plugin indent on

" - - - - }}}

" EDITING - - - - {{{

set history=200 	" keep 200 lines of command line history
set ruler 		" show the cursor position all the time
set showcmd 		" display incomplete commands
set showmatch 		" show matching brackets while typing
set backspace=indent,eol,start " backspacing
set notimeout ttimeout timeoutlen=50 " less wait in term
set noerrorbells 	" don't ring the bell
set lazyredraw 		" don't redraw during macros
set scrolloff=5		" 5 lines will always appear below the cursor
set ttyfast 		" indicate a fast term
set hlsearch 		" highlight searches
set ignorecase		" case insensitive searching
set smartcase 		" case sensitive for uppercase
set incsearch		" incremental searching
set expandtab 		" turns a tab into a space
set autoindent 		" always set indent on
set tabstop=4		" number of spaces a tab counts for
set smarttab 		" intelligent tabbing
set shiftwidth=4    " all for 4
set sts=4           " about indenting
set diffopt=iwhite  " ignore white space in diffs

autocmd FileType * setlocal formatoptions-=cro " disable automatic comments

" Mouse
if has('mouse')
	set mouse=a
    set ttymouse=xterm2
endif

" - - - - }}}

" FILES - - - - {{{

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

" Read Man Pages in vim with :Main.
runtime! ftplugin/man.vim

" - - - - }}}

" THEME - - - - {{{

syntax on           " color files automatically
set cursorline      " highlight the current line
set relativenumber  " numbers are not absolute

au WinEnter * :setlocal relativenumber
au WinLeave * :setlocal norelativenumber

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set showbreak=↪ " prettier linewraps

if has('mac')
    "set guifont=Consolas:h12
    set guifont=Consolas:h12,Inconsolata\ for\ Powerline:h13
    set shell=/bin/bash
    set clipboard^=unnamed 	" tmux copy paste integration
elseif has('win32')
    set guifont=Consolas:h10
elseif has('unix')
    set t_Co=256        " sets 256 colors in the terminal
    set guioptions-=T  "remove toolbar
    set guioptions-=m  "remove top bar
    "set gfn=Terminus\ 10
    set gfn=Inconsolata\ for\ Powerline\ 12
    set shell=/bin/bash
endif

set background=dark

if has('gui_running')
    if strftime("%H") < 4
        colorscheme fruity
    elseif strftime("%H") < 12
        colorscheme solarized
    elseif strftime("%H") < 17
        colorscheme molokai
    elseif strftime("%H") < 21
        colorscheme hybrid
    else
        colorscheme badwolf
    endif
else
    if strftime("%H") < 4
        colorscheme fruity
    elseif strftime("%H") < 12
        colorscheme jellybeans
    elseif strftime("%H") < 15
        colorscheme molokai
    elseif strftime("%H") < 18
        colorscheme xoria256
    elseif strftime("%H") < 21
        colorscheme candycode
    else
        colorscheme badwolf
    endif
endif

" - - - - }}}

" KEYMAPS - - - - {{{

" Modifier
"inoremap <C-a> <nop>
" unbind C-a
vnoremap <C-c> "+y
" map ctrl+c to copy in visual mode
inoremap <C-v> <C-O>"0P
" map ctrl+v to paste in insert mode
inoremap <C-U> <C-G>u<C-U>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Maps the control + movement keys to moving around window splits.
nnoremap <C-\> :pop<cr>
" Pop back to previous definition.

" Regular
noremap ; :
vnoremap ; :
" Use ; to do ex commands.
cmap Q :qa!<cr>
" easier way to quit
"cmap w!! w !sudo dd of=%<cr>
" root authority writing
vnoremap <F2> zf
" Creates Folds.
map <F2> za
" Opens or closes Folds .
map <F3> zR
" Opens all Folds.
map <F4> zM
" Closes all Folds.
nnoremap <F8> :GundoToggle<CR>
map <F9> :sign unplace *<CR>
" Remove signs on the left side.
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
"nnoremap J 10j
"nnoremap K 10k
"xnoremap J 10j
"xnoremap K 10k
" Moves 10 lines down/up.
map H ^
" Moves to the front of the line.
map L $
" Moves to the end of the line.
vnoremap < <gv
vnoremap > >gv
" Reselect text after identing
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" Double Click with the Mouse selects all occurences in the buffer.
:com! -nargs=1 -complete=help H h <args> <bar> only
" Use :H to open a help file in a full buffer.
nnoremap ' `
nnoremap ` '
" Closer way to get to where you were last.
nnoremap x "xx
vnoremap x "xx
" Delete to the x register.

" Disable some of the a.vim mappings.
augroup DisableMappings
    autocmd!
    autocmd VimEnter * :iunmap <Leader>ihn
    autocmd VimEnter * :iunmap <Leader>is
    autocmd VimEnter * :iunmap <Leader>ih
augroup END

" Leader
let mapleader=","
" change the mapLeader from \ to ,
nnoremap <Leader>t :TagbarToggle<CR>
" toggles the tagbar with tt
nnoremap <Leader><space> :noh<cr>
" map ,space to clear search results
nnoremap <Leader>q <C-w><C-v><C-w>l :e ~/scratch.vim<cr>
" opens a pad to do macro testing
nnoremap <Leader>Q :so ~/scratch.vim<cr>
" source the macro file
"nnoremap <Leader>v <C-w><C-v><C-w>l:e $MYVIMRC<cr>
nnoremap <Leader>v :e ~/.vimrc<cr>
" open vimrc in another split
nnoremap <Leader>V :silent! so $MYVIMRC<CR>
" source vimrc
nnoremap <Leader>dp :!cp % ~/Dropbox/Public/
" copies current file into dropbox
nnoremap <Leader>wv :vsplit<cr>
nnoremap <Leader>wh :split<cr>
" vertical/horizontal splits
nnoremap <Leader>n :NERDTreeToggle<cr>
" Toggles NerdTree
nnoremap <Leader>k :BD<CR>
" Delete Buffer
nnoremap <Leader>] <C-]>
nnoremap<Leader>[ :pop<cr>
" Indent the whole file and return to original position
nnoremap <Leader>= mzgg=G`z
" Edit file, starting in same directory as current file
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Delete into one register and paste from another.
vnoremap <Leader>v "_dP
" Navigate by indentation.
nnoremap <Leader>x :call search('^'.matchstr(getline('.'),'^\s*').'\S','We')<CR>
" In :Functions:, toggles diffmode of buffer.
nnoremap <silent><Leader>df :call DiffToggle()<CR>
" YouCompleteMe GoTos
nnoremap <Leader>je :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
" Easy Motion Forward and Backwards
nmap s <space>w
nmap S <space>b

" - - - - }}}

" FOLDING - - - - {{{

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
au FileType python,c,cpp,java,ruby,php,css,html,eruby,javascript set foldlevel=3

" Saves cursor position from last time.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

" - - - - }}}

" BUILD & COMPILE - - - - {{{

" Use make in the same directory.
" cabbrev make call UseMakeSameDirForC()<CR>
autocmd FileType c,cpp cabbrev make call UseMakeSameDirForC()<CR><CR>

" Default Make
nnoremap <Leader>mc :make <bar> :cw<cr>
" Compile the current file and open a quickfix on errors.
nnoremap <Leader>mk :make %< <bar> :cw<cr>
" Regular compile with no quickfix.
nnoremap <Leader>mm :make %< <cr>
" Compile SDL programs.
nnoremap <Leader>ms :!g++ % -o %< `sdl-config --cflags --libs`
" Compile > Run > Back to Code, for SDL programs.
nnoremap <Leader>mr :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr><cr>

" C/C++
" These won't run properly if there's a file to be opened since they would be opening files from the directory vim was launched from.
autocmd FileType c,cpp nnoremap <C-c> :!./%<<cr>
" runs c++ files *ctrl-c*
autocmd FileType c,cpp nnoremap <f5> :!g++ % -o %< && ./%< <cr><cr>
autocmd FileType c,cpp nnoremap <f6> :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr><cr>
autocmd FileType c,cpp nnoremap <f7> :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr>

" Java
autocmd FileType java nnoremap <C-c> :!java %<<cr><cr>
autocmd FileType java set makeprg=javac\ %
autocmd FileType java set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd FileType java nnoremap <f5> :make<cr><cr>
autocmd FileType java nnoremap <f6> :!echo %\|awk -F. '{print $1}'\|xargs java<cr><cr>

" Python
if has('mac')
    autocmd FileType python nnoremap <C-c> :!/usr/local/bin/python %<cr>
    " option to use :pyfile % instead
    set ofu=syntaxcomplete#Complete
" windows
elseif has ("win32")
    set makeprg=mingw32-make
    set shell=C:\MinGW\msys\1.0\bin/bash.exe
    " executes python under windows
    autocmd FileType python map <C-p> :!C:\Python27/python %
elseif has('unix')
    " python
    autocmd FileType python nnoremap <Leader>p2 :!/usr/bin/env python2 %
    " runs python 2 files *ctrl-p*
    autocmd FileType python nnoremap <Leader>p3 :!/usr/bin/env python3 %<cr>
endif

" - - - - }}}

" WEB - - - - {{{

"Indentation
autocmd FileType eruby,ruby,html,css,php set autoindent
autocmd FileType eruby,ruby,html,css,php set shiftwidth=2
autocmd FileType eruby,ruby,html,css,php set tabstop=2
autocmd FileType eruby,ruby,html,css,php set sts=2
autocmd FileType eruby,ruby,css,php,python set textwidth=79

" Set the filetype for use with Sparkup
autocmd BufNewFile,BufRead *.xml,*.tpl set ft=html

" HTML in php files.
au BufRead,BufNewFile *.php set ft=php.html

if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif
" - - - - }}}

" PLUGIN - - - - {{{

" Alternate
autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

" CommandT
" nnoremap <C-t> :CommandT<cr>
" nnoremap <C-b> :CommandTBuffer<cr>
" nnoremap<Leader>ctf :CommandTFlush<cr>
" let g:CommandTMaxFiles=10000
" let g:CommandTMaxDepth=5
" let g:CommandTScanDotDirectories=1
" let g:CommandTMaxHeight=20
" let g:CommandTMaxCachedDirectories=2
" let g:CommandTCancelMap=['<C-x>', '<C-c>']

" CtrlP
"nnoremap <Leader>g :CtrlPCurFile<CR>
"nnoremap <Leader>f :CtrlP<CR>
"nnoremap <Leader>b :CtrlPBuffer<CR>
"nnoremap <Leader>r :CtrlPMRU<CR>
"let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
"let g:ctrlp_max_depth = 10 " How many levels to search through.
"let g:ctrlp_mruf_max = 30 " How many files to remember.
"let g:ctrlp_by_filename=0 " Emphasize directories in search.
"let g:ctrlp_use_caching=1 " Cache searches.
"let g:ctrlp_clear_cache_on_exit = 0 " Share cache between sessions.
"let g:ctrlp_cache_dir = $HOME.'/.vim/.cache/ctrlp'
"let g:ctrlp_max_files = 10000
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Easy Motion
let g:EasyMotion_leader_key = '<space>'

" Easytags
let g:easytags_include_members = 1
let g:easytags_python_enabled = 1
let g:easytags_file = '~/.vim/tags/easytags'
let g:easytags_cmd = '/usr/local/bin/ctags'

" Eclim
let g:EclimMenus = 1
let g:EclimCompletionMethod = 'omnifunc'

" Gundo
let g:gundo_close_on_revert=1   " close gundo when reverting

" Jedi
"let g:jedi#goto_command = "<Leader>pg"
"let g:jedi#get_definition_command = "<Leader>pd"
"let g:jedi#rename_command = "<Leader>pr"
"let g:jedi#related_names_command = "<Leader>pn"
"let g:jedi#pydoc = "<Leader>pk"
"let g:jedi#show_function_definition = "1"
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#popup_select_first = 0

" Lusty Explorer
" nnoremap <Leader>f :LustyFilesystemExplorer<cr>
" nnoremap <Leader>b :LustyBufferExplorer<cr>

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

" Powerline
set laststatus=2 " Always show the statusline.
set encoding=utf-8 " Necessary to show unicode glyphs.
let g:Powerline_symbols = 'fancy'
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Python Mode
let g:pymode_breakpoint = 1 " Load breakpoints plugin.
let g:pymode_doc_key = '<Leader>K'
let g:pymode_run_key = '<Leader>R'
let g:pymode_breakpoint_key = '<Leader>B' " Key for set/unset breakpoint.
let g:pymode_rope = 0 " Use Jedi instead of Rope.
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_lint_mccabe_complexity = 16

" Sparkup
" let g:sparkupNextMapping='<c-u>'

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

" Tabular
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a" :Tabularize /"<CR>
vnoremap <Leader>a" :Tabularize /"<CR>

" TagBar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets","UltiSnips"]
let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

augroup UniteAutoCmd
    autocmd!
augroup END

function! s:unite_tabs_and_windows()
    nmap <buffer> <C-h> <C-w>h
    nmap <buffer> <C-j> <C-w>j
    nmap <buffer> <C-k> <C-w>k
    nmap <buffer> <C-l> <C-w>l
    imap <buffer> <C-h> <Esc><C-w>h
    imap <buffer> <C-j> <Esc><C-w>j
    imap <buffer> <C-k> <Esc><C-w>k
    imap <buffer> <C-l> <Esc><C-w>l
    nmap <buffer> H gT
    nmap <buffer> L gt
    nmap <buffer> <leader>x :bd!<CR>
    nmap <buffer> <C-s> <Plug>(unite_redraw)
    imap <buffer> <C-s> <Plug>(unite_redraw)
endfunction

let g:unite_source_process_enable_confirm = 1
let g:unite_source_history_yank_enable = 1
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 10
let g:unite_source_directory_mru_limit = 300
let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_filename_format = ':~:.'

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_rec_max_cache_files=3000
let g:unite_split_rule="botright"
let g:unite_prompt='» '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    "let g:unite_source_grep_default_opts='--no-heading --no-color -a'
    let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
    let g:unite_source_grep_recursive_opt=''
endif

function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> jk <Plug>(unite_insert_leave)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    imap <buffer> <leader> <Esc><leader>
    call s:unite_tabs_and_windows()
endfunction

autocmd FileType unite call s:unite_settings()

"nnoremap [unite] <nop>
"nmap \ [unite]

"nnoremap <silent> [unite]p :<C-u>Unite process -buffer-name=processes -start-insert<CR>
"nnoremap <silent> [unite]b :<C-u>Unite buffer -buffer-name=buffers -start-insert<CR>
"nnoremap <silent> [unite]/ :<C-u>Unite -buffer-name=search grep:.<cr>
"nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=line line<cr>
"nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
"nnoremap <silent> [unite]<space> :<C-u>Unite -buffer-name=files buffer file_mru bookmark file_rec/async<cr>

nnoremap <Leader>, :<C-u>Unite -buffer-name=files buffer file_mru bookmark file_rec/async<cr>
nnoremap <Leader>y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <Leader>l :<C-u>Unite -buffer-name=line line<cr>
nnoremap <Leader>/ :<C-u>Unite -buffer-name=search grep:.<cr>
"nnoremap <Leader>b :<C-u>Unite buffer -buffer-name=buffers -start-insert<CR>
"nnoremap <Leader>f :<C-u>Unite file_rec/async<CR>
"nnoremap <Leader>r :<C-u>Unite file_mru<CR>

"nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <Leader>b :<C-u>Unite -resume buffer -buffer-name=buffers -start-insert<CR>
nnoremap <Leader>f :<C-u>Unite -resume file_rec/async<CR>
nnoremap <Leader>r :<C-u>Unite -resume file_mru<CR>

" View Doc
let g:viewdoc_open='new'
let g:viewdoc_only=1

" Vim Rooter
"let g:rooter_use_lcd = 1


" YouCompleteMe
autocmd VimEnter * call FindYouCompleteMeConf()
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Zencoding
let g:user_zen_Leader_key = '<c-e>'

" - - - - }}}

" COMPLETION - - - - {{{

" Various
set omnifunc=syntaxcomplete#Complete " Default Completion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
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

" - - - - }}}

" FUNCTIONS - - - - {{{

function! DiffToggle()
    if &diff
        echom "diffoff"
        diffoff
    else
        echom "diffon"
        diffthis
    endif
endfunction

" CD to current file's directory, execute make there and then cd back to Root.
function! UseMakeSameDirForC()
    redir => rootPath
        pwd
    redir end
    lcd %:p:h
    make
    cd `=rootPath`
endfunction

function! FindYouCompleteMeConf()
    if &ft == 'c'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.c/ycm_extra_conf.py" 
    elseif &ft == 'objcpp' || &ft == 'objc'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.obj/ycm_extra_conf.py"
    else  
        let g:ycm_global_ycm_extra_conf = "~/.vim/.cpp/ycm_extra_conf.py"
    endif
endfunction

function! XCodeBuild()
    let l:command = 'xcodebuild -sdk iphonesimulator'
    let l:out = system(l:command)
    cexpr l:out
endfunction

" - - - - }}}

