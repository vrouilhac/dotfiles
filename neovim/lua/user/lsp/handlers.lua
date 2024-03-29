local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    {name = "DiagnosticSignError", text = ""},
    {name = "DiagnosticSignWarn", text = ""},
    {name = "DiagnosticSignHint", text = ""},
    {name = "DiagnosticSignInfo", text = ""}
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
  end

  local config = {
    virtual_text = false, -- Disable virtual text, too much of a burden
    signs = {
      -- Show signs
      active = signs
    },
    update_in_insert = true,
    underline = false, -- Disable the underline of diagnostics, burden
    severity_sort = true,
    float = {
      focusable = false,
      severity_sort = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = ""
    }
  }

  vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>ne",
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>pe",
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- 	vim.api.nvim_buf_set_keymap(
  -- 		bufnr,
  -- 		"n",
  -- 		"gl",
  -- 		'<cmd>lua vim.diagnostic.open_float()<CR>',
  -- 		opts
  -- 	)
  -- 	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ timeout_ms = 5000 })' ]]
end

-- -- https://github.com/typescript-language-server/typescript-language-server/issues/216

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
