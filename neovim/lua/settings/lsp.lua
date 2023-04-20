local lspconfig = require("lspconfig")
local vimutil = require("vim.lsp.util")
local lsp_signature = require("lsp_signature")
local lspSignatureConfig = require("settings.plugins.lsp-signature")
local utils = require("utils")

local nmap = utils.nmap

local on_attach = function(_, bufnr)
	-- autocomplete
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	lsp_signature.on_attach(lspSignatureConfig.config, bufnr)

	local bufops = { noremap = true, silent = true, buffer = bufnr }
	nmap('gd', vim.lsp.buf.definition, bufops)
	nmap('gi', vim.lsp.buf.implementation, bufops)
	nmap('<leader>i', vim.lsp.buf.hover, bufops)
	nmap('<C-S>', vim.lsp.buf.signature_help, bufops)
	nmap('<leader>D', vim.lsp.buf.type_definition, bufops)
	nmap('<leader>rn', vim.lsp.buf.rename, bufops)
	nmap('gr', vim.lsp.buf.references, bufops)
	nmap('<leader>f', vim.lsp.buf.formatting, bufops) -- TODO: may be useless as i use format on save
end

-- typescript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	handlers = {
		["textDocument/definition"] = function(_, result, params) -- avoid quickfix on qd
			if params == nil or vim.tbl_isempty(result) then
				local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
				return nil
			end

			if vim.tbl_islist(result) then
				vim.lsp.util.jump_to_location(result[1], "utf-8")
				if #result > 1 then
					local isReactDTs = false
					for _, value in pairs(result) do
						if string.match(value.uri, "react/index.d.ts") then
							isReactDTs = true
							break
						end
					end
					if not isReactDTs then
						vim.lsp.util.set_qflist(vimutil.locations_to_items(result))
						vim.api.nvim_command("copen")
						vim.api.api.nvim_command("wincmd p")
					end
				end
			else
				vim.lsp.util.jump_to_location(result, "utf-8")
			end
		end
	}
})

-- rust
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {}
	}
})

-- css scss less (WIP)
lspconfig.cssls.setup({
	on_attach = on_attach
})

-- bash (WIP)
lspconfig.bashls.setup({})

-- lua
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' } -- remove warning of vim being undefined in nvim config
			}
		}
	}
})

-- Python
lspconfig.pylsp.setup({
	on_attack = on_attach,
	settings = {
		pylsp = {
			configurationSources = "flake8",
			plugins = {
				pydocstyle = {
					enabled = true
				},
				flake8 = {
					enabled = true,
					maxLineLength = 100,
				},
				black = {
					enabled = true,
					maxLineLength = 100,
				}
			}
		}
	}
})

-- eslint (WIP)
lspconfig.eslint.setup({})

-- tailwindcss
lspconfig.tailwindcss.setup({
	on_attach = on_attach
})

-- popup hover information border
-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
