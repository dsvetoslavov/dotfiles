-- ~/.config/nvim/lua/config/plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
        integrations = {
          cmp = true,
          treesitter = true,
          telescope = { enabled = true },
          neotest = false,
        },
      })
    end,
  },

  -- File tree
  { "preservim/nerdtree" },

  -- Fuzzy finder
  { "junegunn/fzf", build = ":call fzf#install()" },
  { "junegunn/fzf.vim" },

  -- JavaScript/TypeScript
  { "pangloss/vim-javascript" },
  { "leafgarland/typescript-vim" },

  -- Status line
  { "vim-airline/vim-airline" },

  -- Comments
  { "preservim/nerdcommenter" },

  -- LSP support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.lsp")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    }
  },

  -- Completion engine
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "windwp/nvim-autopairs",
    },
  },

  -- Treesitter 
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      local ensure_installed = {
        'html', 'css', 'javascript', 'typescript', 'json', 'lua', 'vim', 'python', 'svelte', 'go'
      }
      local already_installed = require('nvim-treesitter.config').get_installed()
      local to_install = vim.iter(ensure_installed):filter(function(p)
        return not vim.tbl_contains(already_installed, p)
      end):totable()

      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function()
          pcall(vim.treesitter.start)
          
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
    config = function()
      require('nvim-treesitter').setup()
    end,
  },

  -- Auto-close and auto-rename HTML tags
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'html', 'javascript', 'typescript', 'svelte', 'xml', 'markdown',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Surround text objects
  {
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  {
    'mattn/emmet-vim',
    ft = {
      'html', 'css', 'svelte'
    },
    init = function()
      vim.g.user_emmet_leader_key = '<C-z>' -- Trigger with Ctrl+z,
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function() require("conform").format({ async = true }) end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
})

-- Theme setup
vim.cmd("colorscheme catppuccin")

