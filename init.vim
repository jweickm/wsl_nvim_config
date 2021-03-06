""" Jakob's Neovim init.vim
" PLUGINS ------------------------------------------ {{{
call plug#begin(stdpath('config') . '/plugged')

" Aesthetics - Status Line
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'

" Aesthetics - Additional
" Fancy Startpage for vim
Plug 'mhinz/vim-startify'
"color name highlighter
Plug 'ap/vim-css-color'

" COLORSCHEMES
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'rafi/awesome-vim-colorschemes'

" Git Plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim Terminal
Plug 'tc50cal/vim-terminal'

" NERDTREE plugin for easier file browsing
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" CODE STUFF
" Comment stuff out with gcc
Plug 'tpope/vim-commentary'
" Surround stuff with ys
Plug 'tpope/vim-surround'
" Auto pair the brackets
Plug 'windwp/nvim-autopairs'
" Plug 'vim-scripts/auto-pairs-gentle'
" Rainbow brackets
Plug 'frazrepo/vim-rainbow'
" Better code highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" Easymotion plug
" Plug 'easymotion/vim-easymotion'
Plug 'phaazon/hop.nvim'

" Make Easymotion work with dot repeat
Plug 'tpope/vim-repeat'

" Better registers
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim' " Auto Completion (requires some more setup)
Plug 'preservim/tagbar' " Add a tagbar to neovim (Toggle with F8)

" Fuzzy search with Telescope
Plug 'nvim-lua/plenary.nvim' " required dependency
Plug 'nvim-telescope/telescope.nvim'

" Smooth Scrolling
Plug 'psliwka/vim-smoothie'

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

call plug#end()
" }}}

" SETTINGS ----------------------------------------- {{{
set number relativenumber
filetype plugin indent on

set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab

set splitbelow
set splitright

set mouse=a
set scrolloff=20
set showcmd " show command in status line
set wildmenu

" Search 
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

set history=1000

" }}}

" MAPPINGS ----------------------------------------- {{{
" Set the space as the leader key. Must be set before other leader key combos!
let mapleader = " "

" " Map easymotion to only leader (after setting the mapleader!)
" map <Leader> <Plug>(easymotion-prefix)
" " map  <Leader>f <Plug>(easymotion-bd-f)
" " nmap <Leader>f <Plug>(easymotion-overwin-f)
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
" " Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" HOP EASYMOTION
" setup and use colemak keys
lua require'hop'.setup { keys = 'arstdwfpluyhneio', jump_on_sole_occurence = false }
map <Leader>f :HopChar1<CR>
map <Leader>s :HopChar2<CR>
map <Leader>w :HopWord<CR>
map <Leader>l :HopLine<CR>
map <Leader>h :HopLineStart<CR>

" open nerdtree with F1
nnoremap <F1> :NERDTreeToggle<CR>
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Open the Tagbar with F8
nmap <F8> :TagbarToggle<CR>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing ALT+H, ALT+J, ALT+K, or ALT+L.
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l

" FOR TELESCOPE FINDER
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader><leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader><leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader><leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader><leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" }}}

" COLORSCHEMES ------------------------------------- {{{
" let g:gruvbox_baby_transparent_mode = 1 
" colorscheme gruvbox-baby
"
" }}}

" VIMSCRIPT ---------------------------------------- {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

au Filetype c call rainbow#load()
" let g:rainbow_active = 1 " to enable globally
" }}}

" STATUS LINE -------------------------------------- {{{
" }}}
