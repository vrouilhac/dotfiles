local utils = require("utils")

local nmap = utils.nmap

-- Command Center
nmap("<leader>fc", "<CMD>Telescope command_center<CR>")

local cmd_opts = { noremap = true, silent = true }
local cmd_center_mappings = {
	-- Telescope
	{
		desc = "Open Search File",
		cmd = "<CMD>Telescope find_files hidden=true<CR>",
		keys = {
			{ "n", "<C-P>", cmd_opts }
		},
		category = "search"
	},
	{
		desc = "Open Global Search",
		cmd = "<CMD>Telescope live_grep<CR>",
		keys = {
			{ "n", "<leader>g", cmd_opts }
		},
		category = "search"
	},
	{
		desc = "Open Search Commit",
		cmd = "<CMD>Telescope git_commits<CR>",
		keys = {
			{ "n", "<leader>c", cmd_opts }
		},
		category = "search"
	},
	-- Nvim Tree
	{
		desc = "Open File Tree",
		cmd = "<CMD>NvimTreeToggle<CR>",
		keys = {
			{ "n", "<C-N>", cmd_opts }
		},
		category = "utilities"
	},
	-- Git Blame
	{
		desc = "Open Git Blame",
		cmd = "<CMD>GitBlameToggle<CR>",
		keys = {
			{ "n", "<C-B>", cmd_opts }
		},
		category = "git"
	},
	-- UndoTree
	{
		desc = "Open Undo Tree Panel",
		cmd = vim.cmd.UndotreeToggle,
		keys = {
			{ "n", "<C-U>", cmd_opts }
		},
		category = "utilities"
	},
	-- Grapple
	-- {
	-- 	desc = "Open Grapple??",
	-- 	cmd = require("grapple").toggle,
	-- 	keys = {
	-- 		{ "n", "<leader>m", cmd_opts }
	-- 	},
	-- 	category = "utilities"
	-- }
	-- Harpoon
	{
		desc = "Open Harpoon Window",
		cmd = "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
		keys = {
			{ "n", "<leader>t", cmd_opts }
		},
		category = "harpoon"
	},
	{
		desc = "Add File to Harpoon",
		cmd = "<CMD>lua require('harpoon.mark').add_file()<CR>",
		keys = {
			{ "n", "<leader>fa", cmd_opts }
		},
		category = "harpoon"
	},
	{
		desc = "Go to File 1 (Harpoon)",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(1)<CR>",
		keys = {
			{ "n", "<leader>h", cmd_opts }
		},
		category = "harpoon"
	},
	{
		desc = "Go to File 2 (Harpoon)",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(2)<CR>",
		keys = {
			{ "n", "<leader>j", cmd_opts }
		},
		category = "harpoon"
	},
	{
		desc = "Go to File 3 (Harpoon)",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(3)<CR>",
		keys = {
			{ "n", "<leader>k", cmd_opts }
		},
		category = "harpoon"
	},
	{
		desc = "Go to File 4 (Harpoon)",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(4)<CR>",
		keys = {
			{ "n", "<leader>l", cmd_opts }
		},
		category = "harpoon"
	},
	-- Fine CMD
	{
		desc = "Open the Command Line",
		cmd = "<CMD>FineCmdline<CR>",
		keys = {
			{ "n", "<CR>", cmd_opts },
			{ "n", ":", cmd_opts },
		},
		category = "harpoon"
	},
	{
		desc = "Open the Command Line",
		cmd = "<CMD>FineCmdline '<,'><CR>",
		keys = {
			{ "v", ":", cmd_opts },
		},
		category = "harpoon"
	},
	-- Telescope Project
	{
		desc = "Open Telescope Project Extension",
		cmd = "<CMD>Telescope project<CR>",
		keys = {
			{ "n", "<leader>w", cmd_opts },
		},
		category = "search"
	},
	{
		desc = "Open Telescope File Browser",
		cmd = "<CMD>Telescope file_browser<CR>",
		keys = {
			{ "n", "<leader>fb", cmd_opts },
		},
		category = "search"
	},
}

return {
	cmd_center_mappings = cmd_center_mappings
}
