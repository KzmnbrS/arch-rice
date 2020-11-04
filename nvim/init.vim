call plug#begin()
"Version control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"General purpose lint
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kamykn/spelunker.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install -g prettier',
  \ 'for': ['javascript', 'typescript',
  \         'css', 'less', 'scss',
  \         'json', 'graphql',
  \         'markdown', 'yaml', 'html'
  \ ]
\ }

"Interface
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'
Plug 'preservim/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'pgavlin/pulumi.vim'
Plug 'vimwiki/vimwiki'

"Navigation
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Editor
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-eunuch'
Plug 'metakirby5/codi.vim'
Plug 'sheerun/vim-polyglot'
Plug 'matze/vim-move'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'joom/vim-commentary' 
Plug 'ervandew/supertab'
Plug 'Vimjas/vim-python-pep8-indent'

"Go
":GoImpl is fucking neat
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Goes well with gopls completions in vim-go
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"gS - split, gJ - join
Plug 'AndrewRadev/splitjoin.vim'
"https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets
Plug 'SirVer/ultisnips'
call plug#end()

syntax on
filetype plugin on
filetype indent on

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

set nocompatible

set ruler
set colorcolumn=80

set background=dark
colorscheme pulumi

set showmatch " Braces

set mouse=a
set mousehide " When typing

set smartcase
set incsearch

set updatetime=100

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let g:SuperTabDefaultCompletionType = "<c-n>"

"Files
set noswapfile
set nobackup

set autoread
au FocusGained,BufEnter * checktime

"nvim will create automatically - vim will not
set undodir=~/.config/nvim/undodir
set undofile

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__,*.pyc,requirements.txt,LICENSE

let g:rooter_patterns = ['.git',  'LICENSE']

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'~',
                \ 'Staged'    :'+',
                \ 'Untracked' :'&',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'x',
                \ 'Dirty'     :'D',
                \ 'Ignored'   :'',
                \ 'Clean'     :'^',
                \ 'Unknown'   :'?',
                \ }

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Locale
set keymap=russian-jcukenwin
set spelllang=en_us,ru_yo
set viewoptions=folds,cursor
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview
autocmd BufRead *.* silent setlocal iminsert=0

"Lint and complete
let g:AutoPairsFlyMode = 1

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['prettier', 'eslint'],
\   'Dockerfile': ['hadolint'],
\}

let g:ale_fixers = {
  \    'javascript': ['prettier', 'eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \
  \    'python': ['yapf'],
\}

let g:coc_global_extensions = [
    \ 'coc-emoji', 'coc-eslint', 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-css', 'coc-json', 'coc-yaml',
    \ 'coc-python',
\ ]

let g:ale_fix_on_save = 1

"Mappings
let mapleader = " "
imap jj <Esc>
"System layout must be EN all the time
imap kk <C-^>
"Search fields etc.
cmap kk <C-^>

nnoremap <silent> H :wincmd h<cr>
nnoremap <silent> L :wincmd l<cr>

imap ;; <Esc>:GFiles<cr>
imap ;f <Esc>:Rg<cr>
nmap ; :GFiles<cr>

nmap <leader>w :w!<cr>

let g:AutoPairsShortcutBackInsert = '<M-z>'

let g:move_key_modifier = 'С'

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
endif

let g:user_emmet_leader_key = ','

nmap <Leader>f <Plug>(easymotion-overwin-f2)

map <C-n> :NERDTreeToggle<CR>

nmap <C-f> :TagbarToggle<CR>
