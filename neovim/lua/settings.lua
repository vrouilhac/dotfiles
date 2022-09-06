local utils = require('utils')
local nmap = utils.nmap

local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.scrolloff = 10
opt.guicursor = ""
opt.signcolumn = "yes"
opt.foldlevelstart = 20
opt.wrap = false
opt.foldmethod = "indent"
opt.hlsearch = false
opt.swapfile = false
opt.cursorline = true
opt.updatetime = 100
opt.termguicolors = true

-- Basic
g.mapleader = " "

-- GitGutter
g.gitgutter_map_keys = 0

-- NERDTree
g.NERDTreeShowHidden = 1

-- diagnostic
local diagnostic_opts = { noremap = true, silent = true}
nmap(']d', vim.diagnostic.goto_next, diagnostic_opts)
nmap('[d', vim.diagnostic.goto_prev, diagnostic_opts)
nmap('<leader>d', vim.diagnostic.open_float, diagnostic_opts)

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.tsx', '*.ts' }, -- TODO: if needed add .js and .jsx
	command = 'silent! EslintFixAll',
	group = vim.api.nvim_create_augroup("CustomFormatting", {})
})

-- lsp-config
local on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		require("lsp_signature").on_attach({}, bufnr)

    local bufops = {noremap = true, silent = true, buffer = bufnr}
		nmap('gd', vim.lsp.buf.definition, bufopts)
		nmap('gi', vim.lsp.buf.implementation, bufopts)
		nmap('<leader>i', vim.lsp.buf.hover, bufopts)
		nmap('<C-S>', vim.lsp.buf.signature_help, bufopts)
		nmap('<leader>D', vim.lsp.buf.type_definition, bufopts)
		nmap('<leader>rn', vim.lsp.buf.rename, bufopts)
		nmap('gr', vim.lsp.buf.references, bufopts)
		nmap('<leader>f', vim.lsp.buf.formatting, bufopts) -- TODO: may be useless as i use format on save
end

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({ -- typescript
	on_attach = on_attach
})

lspconfig.rust_analyzer.setup({ -- rust
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {}
	}
})

lspconfig.cssls.setup({ -- css scss less
	on_attach = on_attach
})

lspconfig.bashls.setup({}) -- bash
lspconfig.sumneko_lua.setup({
	on_attach = on_attach
})
lspconfig.eslint.setup({})

-- popup hover information border
-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- TODO: may be useful https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssmodules_ls

-- Ale
-- g.ale_fix_on_save = 1
-- g.ale_fixers = {
--     javascript = "prettier",
--     typescript = "prettier",
--     javascriptreact = "prettier",
--     typescriptreact = "prettier",
--     rust = "rustfmt",
--     css = "prettier",
--     lua = "luafmt",
--     html = "prettier",
--     ejs = "prettier"
-- }

-- COQ
-- g.coq_settings = {
--     auto_start = false,
--     keymap = {
--         pre_select = true,
--         recommended = false
--     }
-- }

-- local on_attach = function(client, bufnr)
--     local bufopts = {noremap = true, silent = true, buffer = bufnr}
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
--     vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, bufopts)
--     vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, bufopts)
--     vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, bufopts)
-- end

-- local lsp_flags = {
--     debounce_text_changes = 150
-- }

-- local coq = require("coq")
-- local lspconfig = require("lspconfig")

-- lspconfig.tsserver.setup(
--     coq.lsp_ensure_capabilities(
--         {
--             on_attach = on_attach,
--             flags = lsp_flags,
--             handlers = {
--                 ["textDocument/definition"] = function(_, result, params)
--                     if params == nil or vim.tbl_isempty(result) then
--                         local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
--                         return nil
--                     end

--                     if vim.tbl_islist(result) then
--                         vim.lsp.util.jump_to_location(result[1])
--                         if #result > 1 then
--                             local isReactDTs = false
--                             for key, value in pairs(result) do
--                                 if string.match(value.uri, "react/index.d.ts") then
--                                     isReactDTs = true
--                                     break
--                                 end
--                             end
--                             if not isReactDTs then
--                                 vim.lsp.util.set_qflist(util.locations_to_items(result))
--                                 vim.api.nvim_command("copen")
--                                 vim.api.api.nvim_command("wincmd p")
--                             end
--                         end
--                     else
--                         vim.lsp.util.jump_to_location(result)
--                     end
--                 end
--             }
--         }
--     )
-- )

-- lspconfig.rust_analyzer.setup(
--     coq.lsp_ensure_capabilities(
--         {
--             on_attach = on_attach,
--             flags = lsp_flags
--         }
--     )
-- )

-- is this useful ?
-- require("coverage").setup()
