" General settings 
syntax on
set number
set tabstop=2
set shiftwidth=2
set relativenumber

" Remaps
let mapleader = " "     

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-p> :Files<CR>
inoremap jk <esc>

" Plugins 
call plug#begin()

" side bar 
Plug 'preservim/nerdtree'

" Theme to look amazing
Plug 'ayu-theme/ayu-vim' 

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Js
Plug 'pangloss/vim-javascript'
" Ts
Plug 'leafgarland/typescript-vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" comments
Plug 'preservim/nerdcommenter'

" Status bar 
Plug 'vim-airline/vim-airline'

call plug#end()

" Coc Plugin 
let g:coc_global_extensions = ['coc-tsserver']

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Hover
nmap <leader>h :call CocAction('doHover')<CR>

" Show diagnostics
nmap <leader>d :CocList diagnostics<CR>
"
" Show line diagnostics
nnoremap <leader>D :call CocAction('showLineDiagnostics')<CR>
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Theme
set termguicolors  
let ayucolor="dark" 
colorscheme ayu
