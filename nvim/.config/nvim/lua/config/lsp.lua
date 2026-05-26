-- ~/.config/nvim/lua/config/lsp.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename Symbol" }))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      }
    }
  }
})

vim.lsp.config("html", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("svelte", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("eslint", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.enable({ "gopls", "pyright", "html", "ts_ls", "svelte", "eslint" })
