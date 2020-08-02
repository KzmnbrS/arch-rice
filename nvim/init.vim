"MARK: Plug
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Vimjas/vim-python-pep8-indent'
" Doc utility
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

autocmd BufWritePre *.py 0,$!yapf

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#completions_enabled = 0

" Unite/ref and pydoc are more useful.
let g:jedi#auto_close_doc = 1

let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'

let g:deoplete#enable_at_startup = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:ctrlp_use_caching = 0 

let g:indent_guides_enable_on_vim_startup = 1

let g:AutoPairsFlyMode = 1

"MARK: Binds
let g:jedi#goto_command = "<leader>f"
let g:jedi#usages_command = '<Leader>u'
let g:jedi#rename_command = '<Leader>r'
let g:jedi#documentation_command = '<Leader>d'
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
let g:AutoPairsShortcutBackInsert = '<M-b>'
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap jj <Esc>
" f{char}{char} to move to {char}{char}
nmap f <Plug>(easymotion-overwin-f2)
nmap <S-f> <Plug>(easymotion-overwin-line)
map <C-n> :NERDTreeToggle<CR>

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
"Does not work correctly w/ python lists/dicts
let g:AutoPairsMapCR = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__,*.pyc,requirements.txt,LICENSE
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|.ycm_confirm_extra_conf.py)$'

"MARK: Editor
syntax on
filetype plugin on
colorscheme jellybeans

set relativenumber
set ruler
set colorcolumn=80
set showmatch "Matching brace highlight

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

