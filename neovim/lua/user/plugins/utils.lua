local M = {}

local fn = vim.fn

M.auto_install_packer = function()
	-- Automatically install packer
	local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system {
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		}
		print "Installing packer close and reopen Neovim..."
		vim.cmd [[packadd packer.nvim]]
	end
end

M.setup_auto_reload = function()
	-- Autocommand that reloads neovim whenever you save the plugins.lua file
	vim.cmd [[
		augroup packer_user_config
			autocmd!
			autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]]
end

return M
