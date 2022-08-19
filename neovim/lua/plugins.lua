return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'

	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'

	use 'Shatur/neovim-ayu'

	use 'preservim/nerdtree'

	use 'nvim-lua/plenary.nvim'
	use 'BurntSushi/ripgrep'
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		require = { {'nvim-lua/plenary.nvim'} }
	}

	use 'ThePrimeagen/harpoon'

	use {
		'ms-jpq/coq_nvim',
		branch = 'coq'
	}
	use {
		'ms-jpq/coq.artifacts',
		branch = 'artifacts'
	}

	use 'airblade/vim-gitgutter'
	use 'dense-analysis/ale'

	use 'wakatime/vim-wakatime'
end)
