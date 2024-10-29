return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = {
      "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({ paths = "./lua/snippets/python/snippets.lua" })
  end,
}
