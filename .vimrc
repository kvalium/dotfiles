source ~/.vimrc

" map leader
" let g:mapleader = ','
let mapleader = " "

" To enable persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" save shortcut
nnoremap <leader>w :w<CR>
" quit shortcut
nnoremap <leader>q :q<CR>
" autosave current buffer

" copy to clipboard
vnoremap <leader>y "+y

call plug#begin()
Plug 'mhinz/vim-startify' " startup Plugin
Plug 'vim-airline/vim-airline' " statusbar
Plug 'preservim/nerdcommenter' " comments
Plug 'kshenoy/vim-signature' " marks
Plug 'tpope/vim-surround' " quotes & parenthesis
Plug 'tpope/vim-endwise' " automatically add end block
Plug 'terryma/vim-multiple-cursors' " edit multiple occ in file

" Zellij integration
Plug 'https://github.com/fresh2dev/zellij.vim.git'

" Git
Plug 'tpope/vim-fugitive' " GIT
Plug 'airblade/vim-gitgutter' " GIT gutters
Plug 'ruanyl/vim-gh-line'

" Global search
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" NERDTree
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree' " file explorer
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" RUBY / RoR
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'https://github.com/tpope/vim-rails.git'

" HTML / JS / TS / React
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'othree/html5.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ALE - Linter
Plug 'dense-analysis/ale'

" Copilot
Plug 'github/copilot.vim'

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

"######################
"     NERDTree        #
"######################
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" shortcut for NERDTreeFind
nnoremap <leader>nf :NERDTreeFind<CR>

"###########################
"     NERDCommenter        #
"###########################
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"######################
"     Startify        #
"######################
" returns all modified files of the current git repo
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = [ {'b': '~/repos/benefits-gift-fr'}, {'f': '~/repos/benefits-framework'} ]

let g:startify_lists = [
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

"######################
"    GIT gutters      #
"######################
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


"######################
"      Fugitive       #
"######################
" Fugitive Conflict Resolution
" nnoremap <leader>gd :Gvdiff<CR>
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>

"######################
"         COC         #
"######################
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"######################
"         ALE         #
"######################
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1

" change background color
" highlight ALEWarning ctermbg=lightgrey cterm=underline
" let g:ale_fixers = {
" \   'javascript': ['prettier', 'eslint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'javascriptreact': ['prettier', 'eslint'],
" \   'typescriptreact': ['prettier', 'eslint'],
" \}


" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1

"######################
"     Telescope       #
"######################
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"######################
"     Copilot         #
"######################
" :Copilot enable

"######################
"       MISC          #
"######################
" override background color on selection
hi! link NormalFloat Normal

"######################
"   HTML / JS / TS    #
"   React / Svelte    #
"######################

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

