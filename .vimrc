syntax on

set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set cursorline
set nu
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set shortmess+=c
set updatetime=300
set termguicolors

call plug#begin()
  Plug 'tpope/vim-commentary'
	Plug 'jiangmiao/auto-pairs'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  Plug 'sbdchd/neoformat'
  Plug 'ParamagicDev/vim-medic_chalk'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'voldikss/vim-floaterm'
  Plug 'mhinz/vim-startify'
  " Typescript setup
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'posva/vim-vue'
  Plug 'Quramy/tsuquyomi'
  Plug 'Quramy/tsuquyomi-vue'
  Plug 'wsdjeg/vim-todo'
call plug#end()

set background=dark
colorscheme gruvbox

autocmd BufNewFile,BufRead *.vue set filetype=vue
let g:tsuquyomi_disable_quickfix = 1

" JAVASCRIPT RULES

let g:typescript_indent_disable = 1

" Coc-config

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_global_extensions = ['coc-tsserver']

let g:user_emmet_leader_key=','

" Nerdtree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Prettier config
let g:neoformat_try_node_exe = 1
autocmd BufWritePre * Neoformat

:let mapleader = "\<space>"
nnoremap <Leader>ff :Files<CR> 
nnoremap <Leader>h :wincmd h<CR>
  nnoremap <Leader>j :wincmd j<CR>
  nnoremap <Leader>k :wincmd k<CR>
  nnoremap <Leader>l :wincmd l<CR>
  " Easy Create new Tabs
  nnoremap <Leader>V :wincmd v<CR> :Ex<CR>
  nnoremap <Leader>H :wincmd s<CR> :Ex<CR>
  " Searching
  nnoremap <Leader>S :%s/\<<C-r><C-w>\>/
  " Resizing
  nnoremap <Leader>+ :vertical resize +25<CR>
  nnoremap <Leader>- :vertical resize -25<CR>
  nnoremap <Leader>* :vertical resize +150<CR>
  nnoremap <Leader>/ :vertical resize -150<CR>
  " File
  nnoremap <Leader>W :w<CR>
  nnoremap <Leader>E :Ex<CR>
  nnoremap <Leader>Q :q<CR>
  nnoremap <Leader>QQ :q!
  nnoremap <Leader>WE :w<CR> :Ex<CR>
  nnoremap <Leader>WQ :w<CR> :q<CR>

  nnoremap <Leader>F :vsp %
