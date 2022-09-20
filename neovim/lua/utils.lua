local map = function(mode, key, action, options)
	vim.keymap.set(mode, key, action, options)
end

local nmap = function(key, action, options)
	map("n", key, action, options)
end

local vmap = function(key, action)
	map("v", key, action)
end

local nnoremap = function(key, action)
	local noremap_opts = { noremap = true }
	nmap(key, action, noremap_opts)
end

return {
	nmap = nmap,
	vmap = vmap,
	nnoremap = nnoremap
}
