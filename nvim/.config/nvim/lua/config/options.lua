vim.filetype.add({
  extension = { gohtml = "html" },
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.updatetime = 300
vim.opt.termguicolors = true

-- Cursor visibility improvements
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"

-- Folding (treesitter foldexpr is set per-buffer in plugins.lua)
vim.opt.foldlevelstart = 99    -- Open files fully unfolded
vim.opt.foldtext = ""          -- Show folded line with its normal highlighting

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

