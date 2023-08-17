local M = {}

M.config = function()
	return {
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		}
	}
end

return M
