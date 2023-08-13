local fn = vim.fn

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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Something's wrong")
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	use "Shatur/neovim-ayu"     -- Colorscheme

	use "tpope/vim-commentary"  -- Allow toggle comment section of code
	use "tpope/vim-surround"    -- Allow to swap surrounding characters
	use "tpope/vim-fugitive"

	-- cmp plugins
	use "hrsh7th/nvim-cmp"        -- The completion plugin
	use "hrsh7th/cmp-buffer"      -- buffer completions
	use "hrsh7th/cmp-path"        -- path completions
	use "hrsh7th/cmp-cmdline"     -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- Snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/LuaSnip"            -- Snippet engine
	use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig"            -- enable LSP
	use "williamboman/mason.nvim"          -- simple to use language server installer
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
	use 'jose-elias-alvarez/null-ls.nvim'  -- LSP diagnostics and code actions

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	use "nvim-treesitter/nvim-treesitter-context"

	-- use 'romgrk/barbar.nvim'  -- Use of tabs

	use "ThePrimeagen/harpoon" -- Easy jumps on a set of file

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- NvimTree
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

	-- Lualine
	use "nvim-lualine/lualine.nvim"

	-- Code Runner
	use "rcarriga/nvim-notify"
	use { 'michaelb/sniprun', run = 'sh ./install.sh' }

	-- Utilities
	use "folke/trouble.nvim"

	-- Show indent lines
	use "lukas-reineke/indent-blankline.nvim"

	-- Time tracking
	use "wakatime/vim-wakatime"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
