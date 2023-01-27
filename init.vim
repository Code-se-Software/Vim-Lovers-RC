syntax on
set encoding=UTF-8
set guicursor=
set hidden
set hlsearch
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
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
set colorcolumn=80
set tags=tags
set path=.
set nowrap

call plug#begin()
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'dense-analysis/ale'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  " Polyglot Package
  Plug 'sheerun/vim-polyglot'
  Plug 'sheerun/vimrc'
  " LSP
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Aesthetics
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
  Plug 'chrisbra/Colorizer'
  Plug 'craigemery/vim-autotag'
  Plug 'ryanoasis/vim-devicons'
  " To do lists
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'

  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/grep.vim'
  Plug 'hiroakis/cyberspace.vim'

  "Test
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'folke/trouble.nvim'  
  Plug 'folke/lsp-colors.nvim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

call plug#end()

colorscheme nord

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

:let mapleader = "\<space>"
nnoremap <Leader>h :wincmd h<CR>
  nnoremap <Leader>j :wincmd j<CR>
  nnoremap <Leader>k :wincmd k<CR>
  nnoremap <Leader>l :wincmd l<CR>
  " Easy Create new Tabs
  nnoremap <Leader>V :wincmd v<CR> :Ex<CR>
  nnoremap <Leader>H :wincmd s<CR> :Ex<CR>
  " Replace Under Cursor
  nnoremap <Leader>S :%s/\<<C-r><C-w>\>/
  " Resizing
  nnoremap <Leader>+ :vertical resize +25<CR>
  nnoremap <Leader>- :vertical resize -25<CR>
  nnoremap <Leader>* :vertical resize +150<CR>
  nnoremap <Leader>/ :vertical resize -150<CR>
  " File
  nnoremap <Leader>W :w<CR>
  nnoremap <Leader>E :NERDTreeToggle<CR>
  nnoremap <Leader>Q :q<CR>
  nnoremap <Leader>QQ :q!
  nnoremap <Leader>WE :w<CR> :Ex<CR>
  nnoremap <Leader>WQ :w<CR> :q<CR>
  " Search
  nnoremap <Leader>F :vsp %
  " Language Server Protocol
  " Comentary
  nnoremap <leader>cc :Commentary<CR>
  vnoremap <leader>cc :Commentary<CR>
  
  " Vim Git (Fugitive)
  nnoremap <leader>gg :Git<CR>
  nnoremap <leader>gc :Git commit<CR>
  nnoremap <leader>gd :Git diff<CR>
  nnoremap <leader>gb :Git blame<CR>
  nnoremap <leader>gm :Git mergetool<CR>
  nnoremap <leader>gs :Gdiffsplit<CR>
  nnoremap <leader>gr :Gread<CR>

  " Vim TODO
  nnoremap <leader>xx <cmd>TroubleToggle<cr>
  nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
  nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
  nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
  nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
  nnoremap gR <cmd>TroubleToggle lsp_references<cr>

  " Vim LSP
  nnoremap <leader>dd :LspDefinition<cr>
  nnoremap <leader>dn :LspNextDiagnostic<cr>
  nnoremap <leader>dp :LspPreviousDiagnostic<cr>
  nnoremap <leader>df :LspReferences<cr>
  nnoremap <leader>dr :LspRename<cr>
  nnoremap <leader>ds :LspStopServer<cr>
  nnoremap <leader>dp :LspPeekDefinition<cr>
  nnoremap <leader>da :LspCodeAction<cr>
  nnoremap <leader>dh :LspHover<cr>
  nnoremap <leader>df :LspDocumentFormat<cr>

  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr
