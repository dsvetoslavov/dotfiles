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

  -- Autocomplete
  { "neoclide/coc.nvim", branch = "release" },

  -- Status line
  { "vim-airline/vim-airline" },

  -- Comments
  { "preservim/nerdcommenter" },
})

-- Theme setup
vim.g.ayucolor = "dark"
vim.cmd("colorscheme ayu")

