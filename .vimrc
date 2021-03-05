set nocompatible " be iMproved, required
filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame

Plug 'tpope/vim-endwise'          " Autocomplete end after a do
Plug 'mileszs/ack.vim'            " Use ack in Vim

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

Plug 'vim-airline/vim-airline'    " Vim powerline

Plug 'kaicataldo/material.vim'    " material theme

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-jest'

Plug 'scrooloose/nerdtree'          " Tree view
Plug 'Xuyuanp/nerdtree-git-plugin'  " GIT support
Plug 'jistr/vim-nerdtree-tabs'      " Tabs support

Plug 'kien/ctrlp.vim'             " Global search utility

Plug 'scrooloose/nerdcommenter'     " Comment shortcuts

" Plug 'w0rp/ale'

" MISC
" Plug 'scrooloose/syntastic'
" Plug 'chiel92/vim-autoformat'
" Plug 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required
filetype plugin on

" Leader key is SPACE, I find it the best
let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

" move text
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Material theme config
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
colorscheme material
let g:airline_theme = 'material'

" Numbers
set number
set numberwidth=4
set ruler

" paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

" Treat long lines as break lines
map j gj
map k gk

" Indentation
set autoindent
set cindent
set smartindent

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Delete empty space from the end of lines on every save
" autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" save undo tree in files
set undofile
set undodir=~/.vim/undo

" number of undos
set undolevels=10000
" Disable backups and swap files
"set nobackup
"set nowritebackup
"set noswapfile

" Searches
set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

" Delete characters outside of insert area
set backspace=indent,eol,start

" ACK setup
let g:ackprg = 'ag --vimgrep'

" CtrlP config ignores
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules\|git\|build\|dist\|lib',
    \ 'file': '\v\.(exe|so|dll|lock|html)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" NERDTree auto launch
autocmd vimenter * NERDTreeTabsToggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" NERDTree auto reveal open file START
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()
" NERDTree auto reveal open file END


" +++ Shortcuts +++
" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Open test file for a current file
nnoremap <silent><leader>s :A<CR>
" Open test file for a current file in a vertical window
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>/ :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>

" +++ fzf +++
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag<Cr>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-Left> <c-w>h
nnoremap <c-Down> <c-w>j
nnoremap <c-Up> <c-w>k
nnoremap <c-Right> <c-w>l

" Switch between buffers
:nnoremap <C-d> :bdelete<CR>

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-prettier']
let g:coc_disable_startup_warning = 1

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" NERDTree tabs Switch
map  <C-l> :tabn<CR>     " next tab
map  <C-h> :tabp<CR>     " previous tab
map  <C-n> :tabnew<CR>   " new tab

" ========== AIRLINE FONT FIXES

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
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
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
