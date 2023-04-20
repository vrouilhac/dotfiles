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
opt.cursorline = true
opt.updatetime = 100
opt.termguicolors = true
opt.completeopt = "menu"
opt.cmdheight = 2

opt.smartindent = true

opt.undodir = os.getenv("HOME") .. "/./vim/undodir"
opt.undofile = true
opt.backup = false
opt.swapfile = false

g.mapleader = " "
