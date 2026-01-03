return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", "eslint_d", stop_after_first = false },
			typescript = { "prettierd", "prettier", "eslint_d", stop_after_first = false },
			vue = { "prettierd", "prettier", "eslint_d", stop_after_first = false },
			markdown = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
		},

		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 1000,
			async = false,
		},

		formatters = {
			prettierd = {
				condition = function(self, ctx)
					return vim.loop.fs_stat(ctx.filename) ~= nil
				end,
			},
		},
	},
	config = function()
		require("conform").setup()
	end,
}
