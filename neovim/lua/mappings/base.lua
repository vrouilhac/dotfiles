local utils = require("utils")

local nmap = utils.nmap
local vmap = utils.vmap

-- Move
nmap("<C-H>", "^")
nmap("<C-L>", "$")
nmap("<leader>y", '"+y')
nmap("<leader>pa", '"+p')
vmap("<leader>y", '"+y')
vmap("<leader>pa", '"+p')
nmap("<C-J>", "8j")
nmap("<C-k>", "8k")
vmap("<C-J>", "8j")
vmap("<C-k>", "8k")
vmap("J", ":m '>+1<CR>gv=gv'")
vmap("K", ":m '<-2<CR>gv=gv'")

-- Edit Config
nmap("<leader>so", ":source $MYVIMRC<CR>")
nmap("<leader>si", ":e $MYVIMRC<CR>")

nmap("<C-Q>n", ":cnext<CR>")
nmap("<C-Q>p", ":cprev<CR>")

-- Others
nmap("<C-F>", "/")
nmap("<leader>u", "~")
vmap("<leader>u", "~")
nmap("zz", "za")
nmap("ZZ", "zA")
nmap("<leader>P", "\"_dP")

-- diagnostic
local diagnostic_opts = { noremap = true, silent = true }
local diag = vim.diagnostic

nmap(']d', diag.goto_next, diagnostic_opts)
nmap('[d', diag.goto_prev, diagnostic_opts)
nmap('<leader>d', diag.open_float, diagnostic_opts)
nmap('<leader>e', vim.diagnostic.open_float, diagnostic_opts)
nmap('<leader>ne', vim.diagnostic.goto_next, diagnostic_opts)
nmap('<leader>pe', vim.diagnostic.goto_prev, diagnostic_opts)
nmap('<leader>dd', '<cmd>Telescope diagnostics<CR>', diagnostic_opts)
