-- Utils
local map = function(m, k, v)
	vim.keymap.set(m,k,v)
end

local nmap = function(k, v)
	map('n', k, v)
end

local vmap = function(k, v)
	map('v', k, v)
end

-- Basics

-- Move
nmap('<C-H>', '^')
nmap('<C-L>', '$')
nmap('<leader>y', '"+y')
nmap('<leader>pa', '"+p')
vmap('<leader>y', '"+y')
vmap('<leader>pa', '"+p')
nmap('<C-J>', '8j')
nmap('<C-k>', '8k')
vmap('<C-J>', '8j')
vmap('<C-k>', '8k')

-- Edit Config
nmap('<leader>so', ':source $MYVIMRC<CR>')
nmap('<leader>si', ':e $MYVIMRC<CR>')

-- Others
nmap('<C-F>', '/')
nmap('<leader>u', '~')
vmap('<leader>u', '~')
nmap('zz', 'za')
nmap('ZZ', 'zA')

-- ~## Plugins ##~

-- NERDTree
nmap('<C-N>', ':NERDTreeToggle<CR>')

-- Telescope
nmap('<C-P>', '<CMD>Telescope find_files hidden=true<CR>')
nmap('<leader>g', '<CMD>Telescope live_grep<CR>')

-- Harpoon
nmap('<leader>fa', ':lua require("harpoon.mark").add_file()<CR>')
nmap('<leader>h', ':lua require("harpoon.ui").nav_file(1)<CR>')
nmap('<leader>j', ':lua require("harpoon.ui").nav_file(2)<CR>')
nmap('<leader>k', ':lua require("harpoon.ui").nav_file(3)<CR>')
nmap('<leader>l', ':lua require("harpoon.ui").nav_file(4)<CR>')
nmap('<leader>fm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
