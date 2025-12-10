return {
	-- Command to start the server
	cmd = {
		"clangd",
		"--offset-encoding=utf-16", -- Prevents "multiple different client offset_encodings" warning
	},
	on_attach = function(client, bufnr)
		-- Set indentation to 4 spaces specifically for C/C++ files
		vim.bo[bufnr].tabstop = 4
		vim.bo[bufnr].shiftwidth = 4
		vim.bo[bufnr].softtabstop = 4
		vim.bo[bufnr].expandtab = true
	end,
}
