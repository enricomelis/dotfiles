vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})


vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })')
