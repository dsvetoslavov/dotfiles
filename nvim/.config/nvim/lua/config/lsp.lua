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

    -- Code actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

-- Python LSP (pyright)
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
      desc = "LSP: Rename Symbol"
    }))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
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
})

vim.lsp.enable({ "gopls", "pyright", "html" })
