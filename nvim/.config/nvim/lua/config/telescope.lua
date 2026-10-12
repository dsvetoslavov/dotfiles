-- Loaded from the telescope spec's `config` in lua/config/plugins.lua.
-- Keymaps live in that spec's `keys` table so telescope stays lazy-loaded.
require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

-- Load fzf extension
pcall(require('telescope').load_extension, 'fzf')
