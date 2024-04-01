function setup()
  vim.cmd [[
		augroup FiletypesHighlights
			autocmd!
			autocmd BufNewFile,BufRead *.ejs set filetype=html
		augroup END
	]]
end

setup()
