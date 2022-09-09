return require("packer").startup(
	function(use)
		use "wbthomason/packer.nvim"
		use "neovim/nvim-lspconfig"

		use "tpope/vim-commentary"
		use "tpope/vim-surround"

		-- use "rstacruz/vim-closer"

		-- colorscheme
		use { "catppuccin/nvim", as = "catppuccin" }
		use "EdenEast/nightfox.nvim"
		use 'tanvirtin/monokai.nvim'
		use "Shatur/neovim-ayu"
		use 'marko-cerovac/material.nvim'
		use 'kvrohit/rasmus.nvim'
		use 'folke/tokyonight.nvim'
		use { 'Everblush/everblush.nvim', as = 'everblush' }
		--

		use "preservim/nerdtree"

		use {
			'nvim-treesitter/nvim-treesitter',
			run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		}

		use "nvim-lua/plenary.nvim"
		use "BurntSushi/ripgrep"
		use {
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			require = { { "nvim-lua/plenary.nvim" } }
		}

		use "ray-x/lsp_signature.nvim"

		use "ThePrimeagen/harpoon"

		use {
			"ms-jpq/coq_nvim",
			branch = "coq"
		}
		use {
			"ms-jpq/coq.artifacts",
			branch = "artifacts"
		}

		-- use({
		-- 	"andythigpen/nvim-coverage",
		-- 	requires = "nvim-lua/plenary.nvim",
		-- 	config = function()
		-- 		require("user.coverage")
		-- 	end,
		-- })

		-- use({
		-- 	"Pocco81/true-zen.nvim",
		-- 	config = function()
		-- 		 require("true-zen").setup {
		-- 			-- your config goes here
		-- 			-- or just leave it empty :)
		-- 		 }
		-- 	end,
		-- })

		use "airblade/vim-gitgutter"
		-- use 'dense-analysis/ale'

		-- use 'ellisonleao/glow.nvim'

		use "wakatime/vim-wakatime"
	end
)
