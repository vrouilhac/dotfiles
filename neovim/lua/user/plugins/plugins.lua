local M = {}

M.init = function(use)
	-- Used by lots of other plugins
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	-- Colorscheme
	use "Shatur/neovim-ayu"
	use { "catppuccin/nvim", as = "catppuccin" }
	use "rebelot/kanagawa.nvim"
	use "nyoom-engineering/oxocarbon.nvim"
	use "rmehri01/onenord.nvim"
	use "marko-cerovac/material.nvim"

	-- tpope VIP section!
	use "tpope/vim-commentary" -- Allow toggle comment section of code
	use "tpope/vim-surround"  -- Allow to swap surrounding characters
	use "tpope/vim-fugitive"  -- Git plugin


	-- ThePrimeagen VIP section!
	use "ThePrimeagen/harpoon" -- Easy jumps on a set of file

	-- NvimTree
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Lualine
	use "nvim-lualine/lualine.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- LSP
	use "neovim/nvim-lspconfig"            -- enable LSP
	use "williamboman/mason.nvim"          -- simple to use language server installer
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
	use 'jose-elias-alvarez/null-ls.nvim'  -- LSP diagnostics and code actions
	use 'mhartington/formatter.nvim'
	use 'averms/black-nvim'

	-- cmp plugins
	use 'hrsh7th/nvim-cmp'        -- The completion plugin
	use 'hrsh7th/cmp-buffer'      -- buffer completions
	use 'hrsh7th/cmp-path'        -- path completions
	use 'hrsh7th/cmp-cmdline'     -- cmdline completions
	use 'hrsh7th/cmp-nvim-lsp'		-- LSP completion
	use 'hrsh7th/cmp-nvim-lua'		-- Lua Nvim completion

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use "nvim-treesitter/nvim-treesitter-context"

	-- Time tracking
	use "wakatime/vim-wakatime"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end

return M
