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

-- Edit Config
nmap("<leader>so", ":source $MYVIMRC<CR>")
nmap("<leader>si", ":e $MYVIMRC<CR>")

-- Others
nmap("<C-F>", "/")
nmap("<leader>u", "~")
vmap("<leader>u", "~")
nmap("zz", "za")
nmap("ZZ", "zA")

-- diagnostic
local diagnostic_opts = { noremap = true, silent = true }
local diag = vim.diagnostic

nmap(']d', diag.goto_next, diagnostic_opts)
nmap('[d', diag.goto_prev, diagnostic_opts)
nmap('<leader>d', diag.open_float, diagnostic_opts)
