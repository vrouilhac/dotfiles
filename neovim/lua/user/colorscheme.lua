-- local colorscheme = "ayu-mirage"
local colorscheme = "catppuccin-frappe"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.api.nvim_set_hl(0, "Comment", { fg = "#71797E", italic = true })
