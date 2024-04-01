-- :help options
local options = {
	-- Backup, swap, undo files
	backup = false,								-- Avoid creating a backup file on save (ending with ~)

	-- Appearance
	cmdheight = 2,								-- Increase the default CMD height
	hlsearch = true,							-- Highlight the search matching pattern
	number = true,								-- Shows the lines number on column
	showtabline = 0,							-- Avoid showing tab with filename (like other editors, not to mention VSCode)
	relativenumber = true,				-- Lines number are relative to cursor easier for jump
	cursorline = true,						-- Highlight the current line for visibility
	signcolumn = "yes:2",					-- Always show sign columns with width 2
	showmode = false,							-- Don't show the Insert, Normal, Visual mode

	-- Cursor behaviour
	scrolloff = 10,								-- Number of padding lines before scroll starts
	sidescrolloff = 6,						-- Lines padding for horizontal scroll
	
	-- Other behaviour
	clipboard = "unnamedplus",		-- Enable the use of clipboard
	ignorecase = true,						-- Ignore case while searching
	fileencoding = "utf-8",				-- Set the file encoding to UTF-8
	foldlevelstart = 20,					-- Define the default foldlevel when a buffer is open

	-- Dev clues
	colorcolumn = "80",




	-- TODO
	completeopt = { "menuone", "noselect" }, -- ?
	conceallevel = 0,							-- ?
	--termguicolors = true,				-- Enable more colors
	foldmethod = "indent",				-- ?
	shiftwidth = 2,								-- ?

	-- I do not like the burden of this column hiding/showing
	smartcase = true,							-- ?
	smartindent = true,						-- ?
	softtabstop = 2,							-- ?
	swapfile = false,							-- Disable the use of additional swap files
	tabstop = 2,									-- ?
	undodir = os.getenv("HOME") .. "/./vim/undodir",
	updatetime = 2000,						-- Use for swapfile and CursorHold
	undofile = true,							-- ?
	wrap = false,									-- Avoid wrapping lines on small windows
	writebackup = false,					-- 
}


-- k = backup, v = false
-- vim.opt.backup = false
for k, v in pairs(options) do
	vim.opt[k] = v
end
