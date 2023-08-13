-- :help options
local options = {
	backup = false,           -- Avoid creating a backup file on save
	clipboard = "unnamedplus", -- Enable the use of clipboard
	cmdheight = 2,            -- Increase the default CMD height
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,         -- ?
	cursorline = true,        -- Highlight the current line for visibility
	fileencoding = "utf-8",
	foldlevelstart = 20,       -- Define the default foldlevel when a buffer is open
	--termguicolors = true,     -- Enable more colors
	foldmethod = "indent",
	hlsearch = true,
	ignorecase = true,
	number = true,        -- Shows the lines number on column
	relativenumber = true, -- Lines number are relative to cursor easier for jump
	scrolloff = 10,       -- Number of padding lines before scroll starts
	sidescrolloff = 4,    -- Lines padding for horizontal scroll
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,

	-- I do not like the burden of this column hiding/showing
	signcolumn = "yes:2", -- Always show sign columns with width 2
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	swapfile = false, -- Disable the use of additional swap files
	tabstop = 2,
	undodir = os.getenv("HOME") .. "/./vim/undodir",
	updatetime = 2000, -- Use for swapfile and CursorHold
	undofile = true,
	wrap = false,     -- Avoid wrapping lines on small windows
	writebackup = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
