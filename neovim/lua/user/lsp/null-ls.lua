local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local options = {
	border = nil,
	cmd = { "nvim" },
	debounce = 150,
	debug = false,
	default_timeout = 5000,
	diagnostic_config = {},
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log_level = "warn",
	notify_format = "[null-ls] %s",
	on_attach = nil,
	on_init = nil,
	on_exit = nil,
	root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
	should_attach = nil,
	sources = {
		formatting.eslint,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
	},
	temp_dir = nil,
	update_in_insert = false,
}

null_ls.setup(options)
