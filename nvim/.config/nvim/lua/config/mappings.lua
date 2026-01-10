vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>pv", ":Vex<CR>", opts)
map("n", "<leader>o", "o<esc>", opts)
map("n", "<leader>O", "O<esc>", opts)
map("n", "<leader><CR>", ":so $MYVIMRC<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<C-p>", ":Files<CR>", opts)
map("i", "jk", "<esc>", opts)

vim.keymap.set("n", "<leader>gf", ":!gofmt -w %<CR>:e<CR>", { desc = "Run gofmt" })
vim.keymap.set("n", "<leader>pf", ":!black %<CR>:e<CR>", { desc = "Run black formatter" })

