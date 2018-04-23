" -----------------------
"   Plugins
" -----------------------
call plug#begin('~/.config/nvim/plugins')

Plug 'erikzaadi/vim-ansible-yaml'
Plug 'justinmk/vim-sneak'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
" Colors
Plug 'chrisbra/Colorizer'
Plug 'joshdick/onedark.vim'

Plug 'tomasiser/vim-code-dark'
Plug 'ajmwagar/vim-deus'
Plug 'baskerville/bubblegum'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
" Displays trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" Utilities for opening files
" Plug 'ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
" Extension to % functionality
Plug 'tmhedberg/matchit'
" Autocompletion
"Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py'}
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'https://github.com/artur-shaik/vim-javacomplete2'
" Error checking/linting
" Plug 'neomake/neomake', { 'on':  'Neomake' }
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" LaTeX builder
Plug 'lervag/vimtex'
" Distraction free writing
Plug 'junegunn/goyo.vim'
" Markdown preview
Plug 'davinche/godown-vim'
" Better python syntax highlighting
Plug 'hdima/python-syntax'
" Statusline
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'alfredodeza/pytest.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/es.next.syntax.vim'
Plug 'terryma/vim-smooth-scroll'
Plug '1995eaton/vim-better-javascript-completion'
"Plug 'nvie/vim-flake8'
Plug 'Raimondi/delimitMate'

Plug 'crusoexia/vim-monokai'

" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'alexbyk/vim-ultisnips-react'
Plug 'junegunn/vim-peekaboo'

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/python-support.nvim'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/ncm-flow',  {'do': 'npm install'}


call plug#end()
" -----------------------
"   NERDtree
" -----------------------
map <silent> <F3> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '—'
" -----------------------
"   Syntastic
" -----------------------
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_aggregate_errors = 1
" -----------------------
"   Neomake
" -----------------------
"autocmd! BufWritePost * Neomake
" -----------------------
"   Vimtex
" -----------------------
let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_mupdf_send_keys = 'r'
"autocmd CursorMoved *.tex silent :w
"autocmd CursorMovedI *.tex silent :w
autocmd CursorHold *.tex silent :w
autocmd CursorHoldI *.tex silent :w
autocmd FileType tex set textwidth=80
autocmd FileType tex set spell
" -----------------------
"    Android
" -----------------------
autocmd FileType java set omnifunc=javacomplete#Complete
let g:JavaComplete_Home = $HOME . '/.vim/bundle/vim-javacomplete2'
let $CLASSPATH .= '.:' . $HOME . '/.vim/bundle/vim-javacomplete2/lib/javavi/target/classes'
let path = split(system("git rev-parse --show-toplevel"), "\n")[0]
if split(path)[0] != 'fatal:'
    let g:JavaComplete_SourcesPath = "target/generated-sources/r"
    let g:syntastic_java_javac_classpath = path . "/**/app/build/intermediates/**/:$ANDROID_HOME/platforms/android-*/*.jar:$ANDROID_HOME/extras/android/support/**/*.jar"
endif
" -----------------------
"    NeoVim
" -----------------------
let g:python_host_prog = '/usr/bin/python3'
tnoremap <Esc> <C-\><C-n>
"noremap <leader>y "+y
"noremap <leader>Y "+y$
"nmap <leader>p "+p
" -----------------------
"    Editor
" -----------------------
set relativenumber
set number
set autoread
set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
set numberwidth=2
set expandtab
set autoindent

colorscheme onedark
set background=dark

" -----------------------
"   Tmp & Backup
" -----------------------
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set backupcopy=yes

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" -----------------------
"   Airline
" -----------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='codedark'
" -----------------------
"   Custom mappings
" -----------------------
let g:godown_browser='google-chrome-stable'
" automatically reload vimrc when it's saved
au BufWritePost init.vim so ~/.config/nvim/init.vim

" center search result
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
" incremental search
set smartcase

set incsearch

" repeatable indent
vnoremap < <gv
vnoremap > >gv

command! W w
command! Bn bn
command! Bp bp
set pastetoggle=<f2>

" -----------------------
"   Custom mappings
" -----------------------
" autocmd FileType python setlocal completeopt-=preview

" -----------------------
"   python-mode
" -----------------------
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_error_symbol = ''
"let g:pymode_lint_options_pep8 = {'max_line_length': 119 }
let g:pymode_options_max_line_length = 119
let g:pymode_virtualenv = 1
let g:pymode_rope = 0

" -----------------------
"   ALE
" -----------------------
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}
" let g:ale_linters = {'scss': ['sass-lint'], 'sass': ['sass-lint']}

let g:jsx_ext_required = 0

set splitright
set backupcopy=yes

let g:ycm_autoclose_preview_window_after_completion=1

" Easier page navigation
nnoremap <C-e> <C-u>
nnoremap <C-u> <C-e>

set mouse=a
let g:javascript_plugin_flow = 1


noremap <silent> <c-e> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1


" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" for python completions
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" language specific completions on markdown file
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

" utils, optional
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')
let g:python_support_python2_require = 0


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set autochdir

set nobackup
set noswapfile
