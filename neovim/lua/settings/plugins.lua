local cmd_center = require("command_center")
local telescope = require("telescope")
local lspSignature = require("settings.plugins.lsp-signature")
local cmd_center_mappings = require("mappings.plugins").cmd_center_mappings
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

-- git-blame
g.gitblame_enabled = 0

-- undotree
g.undotree_WindowLayout = 2

-- format on save
-- js ts tsx
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.tsx', '*.ts', '*.js' }, -- if needed .jsx
	command = 'silent! EslintFixAll',
	group = vim.api.nvim_create_augroup("CustomFormatting", {})
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.py' },
	command = 'silent! lua vim.lsp.buf.format()',
	group = vim.api.nvim_create_augroup("CustomPythonFormatting", {})
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.lua', '*.rs' },
	command = 'silent! lua vim.lsp.buf.formatting_sync()',
	group = vim.api.nvim_create_augroup("CustomOtherFormatting", {})
})

vim.diagnostic.config({
	virtual_text = {
		-- source = "always",  -- Or "if_many"
		prefix = '●', -- Could be '■', '▎', 'x'
	},
	severity_sort = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

-- colorscheme
-- require("material").setup()

require("everblush").setup({
	transparent_background = true
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "rust", "go", "javascript", "bash", "css", "dockerfile", "make", "markdown", "tsx",
		"yaml", "python" },
	sync_install = false,
	highlight = {
		enable = true
	}
})

require("nvim-web-devicons").setup({})
require("nvim-tree").setup({})

require("lualine").setup({})

require("git-conflict").setup({})

-- LSP Signature
require("lsp_signature").setup(lspSignature.config)

cmd_center.add(cmd_center_mappings, cmd_center.mode.ADD_SET)

telescope.setup({
	extensions = {
		command_center = {
			components = {
				cmd_center.component.DESC,
				cmd_center.component.KEYS,
				cmd_center.component.CATEGORY,
			},
			sort_by = {
				cmd_center.component.DESC,
				cmd_center.component.KEYS,
				cmd_center.component.CATEGORY,
			},
			auto_replace_desc_with_cmd = false,
		}
	}
})
telescope.load_extension("command_center")
telescope.load_extension("project")
require("goto-preview").setup({
	default_mappings = true
})
