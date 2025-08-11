require("telescope").setup()
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics)

vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
  desc = "LSP: Show diagnostic (float)",
  buffer = bufnr,
})

