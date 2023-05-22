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
		use 'Mofiqul/dracula.nvim'
		--

		-- Folder tree
		use 'kyazdani42/nvim-web-devicons'
		use {
			'kyazdani42/nvim-tree.lua',
			require = {
				'kyazdani42/nvim-web-devicons'
			}
		}
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}

		use "preservim/nerdtree"

		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		use "nvim-lua/plenary.nvim"
		use "BurntSushi/ripgrep"
		use {
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			require = { { "nvim-lua/plenary.nvim" } }
		}

		use "ray-x/lsp_signature.nvim"

		use "ThePrimeagen/harpoon"
		use { 'kevinhwang91/nvim-bqf' }
		use {
			"cbochs/grapple.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		}
		use {
			"FeiyouG/command_center.nvim",
			requires = { "nvim-telescope/telescope.nvim" }
		}

		use {
			'VonHeikemen/fine-cmdline.nvim',
			requires = {
				{ 'MunifTanjim/nui.nvim' }
			}
		}

		use {
			'rmagatti/goto-preview',
			config = function()
				require('goto-preview').setup {}
			end
		}
		use 'nvim-telescope/telescope-project.nvim'
		use {
			"nvim-telescope/telescope-file-browser.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
		}

		-- use {
		-- 	"ms-jpq/coq_nvim",
		-- 	branch = "coq"
		-- }
		-- use {
		-- 	"ms-jpq/coq.artifacts",
		-- 	branch = "artifacts"
		-- }

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
		use "akinsho/git-conflict.nvim"
		use "f-person/git-blame.nvim"
		-- use 'dense-analysis/ale'

		-- use 'ellisonleao/glow.nvim'

		use "mbbill/undotree"

		use "wakatime/vim-wakatime"

		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-cmdline"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-path"
		use "hrsh7th/nvim-cmp"
		-- Motor de snippets
		use "L3MON4D3/LuaSnip"
		use "saadparwaiz1/cmp_luasnip"
		use "hrsh7th/cmp-nvim-lsp"

		use "~/Documents/perso/projects/nvim-zettelkasten"
	end
)
