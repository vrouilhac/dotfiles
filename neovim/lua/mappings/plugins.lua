local utils = require("utils")

local nmap = utils.nmap

-- NERDTree
-- nmap("<C-N>", ":NERDTreeToggle<CR>")

-- Telescope
nmap("<C-P>", "<CMD>Telescope find_files hidden=true<CR>")
nmap("<leader>g", "<CMD>Telescope live_grep<CR>")
nmap("<leader>c", "<CMD>Telescope git_commits<CR>")

-- Harpoon
nmap("<leader>fa", ':lua require("harpoon.mark").add_file()<CR>')
nmap("<leader>h", ':lua require("harpoon.ui").nav_file(1)<CR>')
nmap("<leader>j", ':lua require("harpoon.ui").nav_file(2)<CR>')
nmap("<leader>k", ':lua require("harpoon.ui").nav_file(3)<CR>')
nmap("<leader>l", ':lua require("harpoon.ui").nav_file(4)<CR>')
nmap("<leader>t", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- Nvim tree
nmap("<C-N>", ":NvimTreeToggle<CR>")

-- Git blame
nmap("<C-B>", ":GitBlameToggle<CR>")


-- See other mapping on settings.lsp
