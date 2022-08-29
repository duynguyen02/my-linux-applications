:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

"vim-plug==================================

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tc50cal/vim-terminal'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'techtuner/aura-neovim'
Plug 'https://github.com/preservim/tagbar'

call plug#end()

"==========================================
colorscheme aura
set termguicolors
nmap <F8> :TagbarToggle<CR>

"Configure for vim-airline=================

let g:airline_theme='deus'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
  
"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'ln'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr='col'"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#branch#enabled = 1

"==========================================

"Configure open files browser==============

"Press Ctrl+B if you want to open files browser
"inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
"nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:DevIconsEnableFoldersOpenClose = 1

"==========================================


"Configure for search======================

"" Map short cut Ctrl + P
nnoremap <silent> <C-S-p> :Files<CR>

"" Ignore Modules
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"==========================================


"Configure nvim-coc========================

"Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#autoformat = 1

"==========================================


"nnoremap <c-m> <Esc>:TerminalSplit zsh<cr>
"inoremap <c-m> <Esc>:TerminalSplit zsh<cr>


set encoding=UTF-8


