local cmp = require("cmp")

local ok_snip, luasnip = pcall(require, "luasnip")
if ok_snip then
  require("luasnip.loaders.from_vscode").lazy_load()
  luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
  })
end

cmp.setup({
  snippet = {
    expand = function(args)
      if ok_snip then luasnip.lsp_expand(args.body) end
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),

    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        -- INSERT behavior avoids “clears and jumps” glitches
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        return
      end
      fallback()
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }
local ok_pairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if ok_pairs then
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
