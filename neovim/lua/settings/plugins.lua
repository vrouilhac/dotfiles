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
	command = 'silent! lua vim.lsp.buf.formatting_sync()',
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
local fb_actions = require "telescope".extensions.file_browser.actions
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
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			git_status = true,
			mappings = {
				["i"] = {
					["<C-a>"] = fb_actions.create,
					["<C-r>"] = fb_actions.rename,
					["<C-d>"] = fb_actions.remove
				}
			}
		},
	}
})
telescope.load_extension("command_center")
telescope.load_extension("project")
telescope.load_extension("file_browser")
require("goto-preview").setup({
	default_mappings = true
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

vim.g.python3_host_prog = '~/.local/venv/nvim/bin/python'

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.flake8,
	},
})
