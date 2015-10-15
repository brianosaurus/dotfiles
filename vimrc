source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

"- for vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle/
call vundle#begin()

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'gmarik/vundle'
Plugin 'lukaszkorecki/CoffeeTags' " ctags for coffeescript
Plugin 'kchmck/vim-coffee-script' " CoffeeCompile, CoffeeLint, etc...
Plugin 'mustache/vim-mustache-handlebars' 
Plugin 'vim-scripts/scratch.vim' " scratchpad
Plugin 'vim-scripts/YankRing.vim' " multiple yank buffers
Plugin 'airblade/vim-gitgutter' " dynamically shows what lines were edited
Plugin 'wavded/vim-stylus' 
Plugin 'tpope/vim-fugitive' " git plugin
Plugin 'tpope/vim-unimpaired' " keybindings for that work with ][ 
Plugin 'tpope/vim-dispatch' " nice way to interface with make
Plugin 'tpope/vim-commentary' " comments and uncomments 
Plugin 'tpope/vim-surround' " cs, cd, ys for changing surroundings
Plugin 'tpope/vim-repeat' " makes '.' work for non-native commands
Plugin 'tpope/vim-rails' " rails movement
Plugin 'tpope/vim-projectionist.git' " project file navigation
Plugin 'tpope/vim-leiningen.git' " len integration
Plugin 'tpope/vim-fireplace' " closure  
"Plugin 'guns/vim-sexp' " sexp-editing
Plugin 'tpope/vim-sexp-mappings-for-regular-people' " movement, paredit like 
Plugin 'geekjuice/vim-spec' " to run mocha and rspec
Plugin 'majutsushi/tagbar' " nice interface to show tags for current file
Plugin 'slim-template/vim-slim'
Plugin 'rking/ag.vim' " super fast searching
Plugin 'ervandew/supertab' " super tab completion
Plugin 'kien/ctrlp.vim' " like command-t
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'chip/vim-fat-finger'  " loads abbreviations for mispellings
Plugin 'bling/vim-airline' " fancy status bar
Plugin 'kien/rainbow_parentheses.vim' " shows matching parens in rainbows

" All of your Plugins must be added before the following line
call vundle#end()  
filetype plugin on

filetype plugin indent on
syntax on
syntax enable
"set mouse=a
set completeopt=menu,menuone
set backspace=indent,eol,start whichwrap+=<,>,[,]

set undolevels=1000
set nobackup
set undodir=~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap

set ts=2
set shiftwidth=2
set expandtab
set showcmd
set showfulltag
set showmatch
set smartcase
set ignorecase
set incsearch
set autoindent
set smartindent
set cin
set smarttab
set autowrite
set ruler
set nohlsearch
"set switchbuf+=usetab,newtab
set hidden
set wildmenu
set wildmode=list:longest,full
set laststatus=2
set formatoptions=qrn1
set clipboard=unnamed
set shortmess=atI
set splitbelow
set splitright

nnoremap ; :

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

nnoremap <leader><leader> :b#<cr> "<Leader><Leader> goes back to last buffer

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

autocmd BufReadPost fugitive://* set bufhidden=delete

" doesn't work for coffee files for some reason
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>

" C-c send enter in insert mode
inoremap <C-c> <Esc>

" remove search highlighting
nnoremap <leader>h :noh<cr>

" Complete till longest common string.
" When more than one match exists, list them all.
set wildmenu
set wildmode=longest,list

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore node modules
set wildignore+=node_modules/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Disable osx index files
set wildignore+=.DS_Store

set t_Co=256
if $TERM_PROGRAM == "Apple_Terminal"
  "colorscheme lucius
  colorscheme hemisu
  "let g:airline_theme='solarized'
  let g:airline_theme='sol'
  highlight ColorColumn ctermbg=5
else
  set background=dark
  colorscheme jellybeans
  let g:airline_theme='jellybeans'
  "highlight ColorColumn ctermbg=8
endif

let g:ackprg = '/usr/local/bin/ag --nogroup --column'

let mapleader=","
" Map ; to :
nnoremap ; :

" Git Status toggle
map <Leader>g :Gstatus<CR>
 
" NerdTree Toggle
map <Leader>n :NERDTreeToggle<cr>
 
" YankRing Setup
let g:yankring_history_dir=$HOME.'/.vim/tmp/yankring/'
nnoremap <Leader>y :YRShow<cr>

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" turn off autocomments
au FileType * setl fo-=cro

set suffixesadd+=.hbs,.rb,.yaml,.coffee

" to find ember templates
set path+=/Users/brian/projects/adstage-ember/app/templates

" for our unique directory hierarchy
set path+=/Users/brian/projects/adstage-platform-v2/app/models/**
set path+=/Users/brian/projects/adstage-platform-v2/app/workers
set path+=/Users/brian/projects/adstage-platform-v2/app/workers/**
set path+=/Users/brian/projects/adstage-platform-v2/app/controllers/**

set tags=/Users/brian/.vim/tags

" use normal tag lookup for ^] and vim -t
set nocst

" Removes trailing whitespace on all files
autocmd BufWritePre *.clj,*.coffee,*.rb,*.hbs,*.slim,*.haml,*.js,*.styl :%s/\s\+$//e

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1


augroup rainbow_parentheses
  au!
  au BufEnter *.clj RainbowParenthesesActivate
  au BufEnter *.clj RainbowParenthesesLoadRound
  au BufEnter *.clj RainbowParenthesesLoadSquare
  au BufEnter *.clj RainbowParenthesesLoadBraces
augroup END

" Turn off syntastic for html files
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
" Don't autohighlight tags
let g:easytags_auto_highlight = 0

" if executable('coffeetags')
"   let g:tagbar_type_coffee = {
"     \ 'ctagsbin' : 'coffeetags',
"     \ 'ctagsargs' : '',
"     \ 'kinds' : [
"     \ 'f:functions',
"     \ 'o:object',
"     \ ],
"     \ 'sro' : ".",
"     \ 'kind2scope' : {
"     \ 'f' : 'object',
"     \ 'o' : 'object',
"     \ }
"     \ }
" endif

"hi def link CtrlPMatch CursorLine
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
nnoremap <Leader>b :CtrlPBuffer<cr>
" CtrlP Delete
call ctrlp_bdelete#init()
" CtrlP Funky .. so I can find methods in open buffers
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
map <C-P> :CtrlPMixed<CR>

map <Leader>f :Ag <C-R><C-W><CR>
map <Leader>c :Commentary<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>C :CoffeeCompile<CR>
map <Leader>w :cclose<CR>
map <Leader>T :call RunCurrentSpecFile()<CR>

let g:CoffeeAutoTagFile='/Users/brian/.tags'

"let g:airline#extensions#tagbar#enabled=0
let g:airline_powerline_fonts = 1

let g:mustache_abbreviations = 1

let g:mocha_coffee_command = "!mocha {spec}"
let g:rspec_command = "!bundle exec rspec -f d -c {spec}"

set colorcolumn=80

function! CdAndClear(dir)
  execute 'cd' a:dir
  call ctrlp#clr()
endfunction

ca ecd call CdAndClear('/Users/brian/projects/adstage-ember')
ca pcd call CdAndClear('/Users/brian/projects/adstage-platform-v2')
ca mcd call CdAndClear('/Users/brian/projects/adstage-metrics-v3')

" prevent Ag from jumping to the fist match automatically
ca Ag Ag!
ca ag Ag!

" make fugitive's Glog silent
ca Glog silent! Glog

" make quickfix open after a git log
autocmd QuickFixCmdPost *grep* cwindow

" remove quickfix window from list of buffers when cycling through buffers
augroup QFix
  autocmd!
  autocmd FileType qf setlocal nobuflisted
augroup END

let coffee_linter='./node_modules/.bin/coffeelint'
let coffee_lint_options='--rules ./tools/coffeelint/rules/* -f coffeelint.json'
autocmd QuickFixCmdPost *coffeelint* cwindow
map <Leader>l :CoffeeLint<CR>:cwindow<CR>

let g:gitgutter_max_signs=1000
