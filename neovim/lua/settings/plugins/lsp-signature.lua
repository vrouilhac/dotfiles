local lspSignatureConfig = {
	bind = true,
	max_height = 10,
	wrap = true,
	close_timeout = 1000,
	hint_enable = false,
	always_trigger = false,
	toggle_key = '<C-i>',
	timer_interval = 50,
	transparency = nil,
}

return {
	config = lspSignatureConfig
}
