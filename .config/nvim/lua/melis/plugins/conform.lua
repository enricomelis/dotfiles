return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.format({
			formatters = { "clangd_format" },
			timeout_ms = 1000,
		})
	end,
}
