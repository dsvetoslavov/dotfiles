-- ~/.config/nvim/lua/config/lsp.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("gopls", {  
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    -- Rename variable
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
      desc = "LSP: Rename Symbol"
    }))

    -- Optional: go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- Optional: hover docs
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})
vim.lsp.enable({ "gopls" })
