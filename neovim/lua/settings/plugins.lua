local g = vim.g

-- GitGutter
g.gitgutter_map_keys = 0

-- NERDTree
g.NERDTreeShowHidden = 1

-- nvim-tree
g.loaded = 1
g.loaded_netrwPlugin = 1

-- colorscheme
-- g.material_style = "darker"
g.catppuccin_flavour = "mocha"
-- g.rasmus_variant = "monochrome"

-- format on save
-- js ts tsx
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.tsx', '*.ts', '*.js' }, -- if needed .jsx
	command = 'silent! EslintFixAll',
	group = vim.api.nvim_create_augroup("CustomFormatting", {})
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.lua', '*.rs' },
	command = 'silent! lua vim.lsp.buf.formatting_sync()',
	group = vim.api.nvim_create_augroup("CustomOtherFormatting", {})
})

-- colorscheme
-- require("material").setup()

require("everblush").setup({
	transparent_background = true
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "rust", "go" },
	sync_install = false,
	highlight = {
		enable = true
	}
})

require("nvim-web-devicons").setup({})
require("nvim-tree").setup({})

require("lualine").setup({})

require("git-conflict").setup({})
