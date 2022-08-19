local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.scrolloff = 10
opt.guicursor = ''
opt.signcolumn = 'yes'
opt.foldlevelstart = 20
opt.wrap = false
opt.foldmethod = 'indent'
opt.hlsearch = false
opt.swapfile = false
opt.cursorline = true
opt.updatetime = 100

-- Basic
g.mapleader = " "

-- GitGutter
g.gitgutter_map_keys = 0

-- NERDTree
g.NERDTreeShowHidden = 1
