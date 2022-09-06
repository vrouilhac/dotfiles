local map = function(m, k, v, b)
    vim.keymap.set(m, k, v, b)
end

local nmap = function(k, v, b)
    map("n", k, v, b)
end

local vmap = function(k, v)
    map("v", k, v)
end

return {
	nmap = nmap,
	vmap = vmap,
}
