local opts = { noremap = true, silent = true }

-- Utils
local map = function(mode, key, action, options)
	vim.keymap.set(mode, key, action, options)
end

local nmap = function(key, action, options)
	map("n", key, action, options)
end

local vmap = function(key, action, options)
	map("v", key, action, options)
end

local xmap = function(key, action, options)
	map("x", key, action, options)
end

local imap = function(key, action, options)
	map("i", key, action, options)
end

--
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
--
nmap("<C-h>", ":BufferPrevious<CR>", opts)
nmap("<C-j>", "<C-W>j", opts)
nmap("<C-k>", "<C-W>k", opts)
nmap("<C-l>", ":BufferNext<CR>", opts)

nmap("<leader>x", ":BufferClose<CR>")

nmap("<C-u>", "5k", opts)
nmap("<C-d>", "5j", opts)
vmap("<C-u>", "5k", opts)
vmap("<C-d>", "5j", opts)

nmap("<S-l>", ":bnext<CR>", opts)
nmap("<S-h>", ":bprevious<CR>", opts)

nmap("<C-f>", "/", opts)

-- INSERT --

-- VISUAL --
vmap("<A-j>", ":m .+1<CR>==", opts)
vmap("<A-k>", ":m .-2<CR>==", opts)

vmap("<", "<gv", opts)
vmap(">", ">gv", opts)

vmap("p", '"_dP', opts)

-- VISUAL BLOCK --
xmap("J", ":move '>+1<CR>gv-gv", opts)
xmap("K", ":move '>-2<CR>gv-gv", opts)

-- Telescope
nmap("<C-p>", "<CMD>Telescope find_files hidden=true<CR>", opts)
nmap("<C-g>", "<CMD>Telescope live_grep<CR>", opts)

-- Harpoon
nmap("<leader>tm", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
nmap("<leader>ha", "<CMD>lua require('harpoon.mark').add_file()<CR>", opts)
nmap("<leader>a", "<CMD>lua require('harpoon.ui').nav_file(1)<CR>", opts)
nmap("<leader>z", "<CMD>lua require('harpoon.ui').nav_file(2)<CR>", opts)
nmap("<leader>e", "<CMD>lua require('harpoon.ui').nav_file(3)<CR>", opts)
nmap("<leader>r", "<CMD>lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- NvimTree
nmap("<C-n>", ":NvimTreeToggle<CR>", opts)

-- Gitsigns
nmap("<C-b>", ":Gitsigns blame_line<CR>", opts)

-- LSP
nmap("gR", ":lua vim.lsp.buf.rename()<CR>", opts)

-- Trouble
nmap("<C-t>", ":Trouble<CR>", opts)

-- SnipRun
vmap("<leader>sr", ":'<,'>SnipRun")

-- Custom
nmap("<leader>cp", ":lua require('user.custom').cp_path()<CR>", opts) -- copy the currently opened file to clipboard
