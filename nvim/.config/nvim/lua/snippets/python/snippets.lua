local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
luasnip.add_snippets("python", {
  s("dbghook", {
    t("from debughook.client import HookClientManager"),
  }),
})
