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
  { "ayu-theme/ayu-vim" },

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
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

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
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'html', 'css', 'javascript', 'typescript',
          'tsx', 'jsx', 'json', 'lua', 'vim',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
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
})

-- Theme setup
vim.g.ayucolor = "dark"
vim.cmd("colorscheme desert")

