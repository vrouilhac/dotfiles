local M = {}

M.cp_path = function()
	local path = vim.fn.expand("%")
	vim.cmd("call setreg('+', '" .. path .. "')")
	print("Path (" .. path .. ") copied to clipboard!")
end

return M
