return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			markdown = { "prettier" },
			lua = { "stylua" },
			javascript = { "prettier", "eslint_d" },
		},

		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
			async = false, -- Synchronous is often safer for BufWritePre
		},

		formatters = {
			clangd_format = {
				args = { "--style", "file" },
			},
		},
	},

	config = function()
		require("conform").setup()
	end,
}
