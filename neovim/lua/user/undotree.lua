local start_ok, ut = pcall(require, "undotree")
if not start_ok then
  return
end

ut.setup({})
