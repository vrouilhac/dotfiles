local start_ok, luasnip = pcall(require, "luasnip")
if not start_ok then
  return
end

luasnip.setup({})
