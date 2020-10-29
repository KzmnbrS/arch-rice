"SECTION: Plug-in
call plug#begin()
"Version control
Plug 'tpope/vim-fugitive'

"Lint
Plug 'dense-analysis/ale'

"Interface
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sebdah/vim-delve'

"Navigation
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Look and feel
Plug 'pgavlin/pulumi.vim'
Plug 'nathanaelkane/vim-indent-guides'

"Editor
Plug 'tpope/vim-eunuch'
Plug 'kshenoy/vim-signature'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'joom/vim-commentary' "gcc {count} || gc (visual)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

"SECTION: General
syntax on
filetype plugin on
filetype indent on

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set t_Co=256

set tabstop=2 softtabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

set ruler
set colorcolumn=80

colorscheme pulumi
set background=dark

set showmatch " Braces

set mouse=a
set mousehide " When typing

set smartcase
set incsearch

set noswapfile
set nobackup

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let g:indent_guides_enable_on_vim_startup = 1

let g:AutoPairsFlyMode = 1

"SECTION: Files
set autoread
au FocusGained,BufEnter * checktime

"nvim will create automatically - vim will not
set undodir=~/.config/nvim/undodir
set undofile

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__,*.pyc,requirements.txt,LICENSE

let g:rooter_patterns = ['.git', 'LICENSE']

"SECTION: Locale
set keymap=russian-jcukenwin
set spell spelllang=ru_yo,en_us

"SECTION: Lint and complete
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['golint', 'go vet']
\}

let g:ale_fixers = {
  \    'python': ['yapf'],
  \    'go': ['gofmt', 'goimports']
\}

let g:coc_global_extensions = [
    \ 'coc-emoji',
    \ 'coc-python',
    \ 'coc-go', 
\ ]

let g:ale_fix_on_save = 1

"SECTION: Bindings
let mapleader = " "
imap jj <Esc>
"System layout must be EN all the time
imap kk <C-^>
"Search fields etc.
cmap kk <C-^>
let g:AutoPairsShortcutBackInsert = '<M-b>'
"Fast saving
nmap <leader>w :w!<cr>

imap ;; <Esc>:Files<cr>
nmap ; :Files<cr>

"Tab completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"<CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap f <Plug>(easymotion-overwin-f2)
nmap <S-f> <Plug>(easymotion-overwin-line)

map <C-n> :NERDTreeToggle<CR>

nnoremap <silent> <leader>x :call <SID>show_documentation()<CR>
nmap <silent> <leader>f <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-rename)

"SECTION: Support

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
