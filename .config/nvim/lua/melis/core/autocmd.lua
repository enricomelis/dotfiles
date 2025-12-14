vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	-- Exclude md, but include all others that have a formatter.
	callback = function(args)
		if vim.bo[args.buf].filetype ~= "markdown" then
			vim.lsp.buf.format({ async = true })
		end
	end,
})
