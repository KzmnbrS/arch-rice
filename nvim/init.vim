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
Plug 'preservim/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'pgavlin/pulumi.vim'
Plug 'vimwiki/vimwiki'
Plug 'romainl/vim-cool'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify/'

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
"Motion
""General
"j, k, h, l - std

""Between windows
nmap <C-w> :wincmd h<CR>
nmap <C-e> :wincmd l<CR> 
imap <C-w> <Esc><C-w>
imap <C-e> <Esc><C-e>

""Overline
"0, $ - std
let g:qs_highlight_on_keys = ['f', 'F']
"`;` / ',' - repeat last search forward / backward

""Overwin
"H, M, L, %, g; (last edit jump) - std
"C-d, C-u, /, *, n, N - std
nmap t <Plug>(easymotion-overwin-f2)
nmap T <Plug>(easymotion-overwin-line)

""Overfile
"G, gg, <lineno>g - std
"m<markname>, '<markname>, m<space> (delete all) - std
nmap <S-j> 5j
nmap <S-k> 5k
nmap <C-f> :TagbarToggle<CR>

""Project scope
nmap <C-n> :NERDTreeToggle<CR>
imap <C-n> <Esc>:NERDTreeToggle<CR>

nmap sf :GFiles<CR>
nmap SF :Buffers<CR>
nmap SG :GGrep<CR>

"Misc
let mapleader = " "
imap jj <Esc>
"System layout must be EN all the time
imap kk <C-^>
"Search fields etc.
cmap kk <C-^>
let g:AutoPairsShortcutBackInsert = 'kj'

nmap <leader>w :w!<cr>

let g:move_key_modifier = 'C'

hi Search cterm=NONE ctermfg=black ctermbg=yellow

"Close Vim if nothing but NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"FZF bat preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

"FZF git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


"Startify
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ ]

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
