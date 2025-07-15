vim.g.coc_global_extensions = { "coc-tsserver" }

-- CoC keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>h", ":call CocAction('doHover')<CR>", opts)
map("n", "<leader>d", ":CocList diagnostics<CR>", opts)
map("n", "<leader>D", ":call CocAction('showLineDiagnostics')<CR>", opts)
map("n", "[g", "<Plug>(coc-diagnostic-prev)", {})
map("n", "]g", "<Plug>(coc-diagnostic-next)", {})
map("n", "<leader>ac", "<Plug>(coc-codeaction)", {})
map("n", "<leader>qf", "<Plug>(coc-fix-current)", {})

map("n", "gd", "<Plug>(coc-definition)", {})
map("n", "gy", "<Plug>(coc-type-definition)", {})
map("n", "gi", "<Plug>(coc-implementation)", {})
map("n", "gr", "<Plug>(coc-references)", {})

-- Completion (inside insert mode)
vim.cmd([[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
]])
