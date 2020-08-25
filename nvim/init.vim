"MARK: Plug
call plug#begin()
"Version control
Plug 'tpope/vim-fugitive'

"Lint
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install -g prettier',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
Plug 'dense-analysis/ale'

"Interface
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

"Navigation
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'

"Look and feel
Plug 'flazz/vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'

"Editor
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

"MARK: Editor

" <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:indent_guides_enable_on_vim_startup = 1

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutBackInsert = '<M-b>'
" Does not work correctly w/ python lists/dicts
let g:AutoPairsMapCR = 0

inoremap jj <Esc>
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

set mouse=a
set mousehide " When typing

syntax on
filetype plugin on
colorscheme jellybeans

set relativenumber
set ruler
set colorcolumn=80
set showmatch " Matching brace highlight

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set smartindent

set shiftwidth=4
set softtabstop=4
set expandtab

set nobackup
set noswapfile

"MARK: Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__,*.pyc,requirements.txt,LICENSE
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|.ycm_confirm_extra_conf.py)$'

"MARK: Lint
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['prettier', 'eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \
  \    'python': ['yapf']
\}

let g:ale_fix_on_save = 1
nmap <leader>p :ALEFix<CR>

"MARK: Python
let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'

"MARK: Navigation
nmap <silent> <leader>f <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-rename)
nnoremap <silent> <leader>x :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:ctrlp_use_caching = 0 

" f{char}{char} to move to {char}{char}
nmap f <Plug>(easymotion-overwin-f2)
nmap <S-f> <Plug>(easymotion-overwin-line)

map <C-n> :NERDTreeToggle<CR>

