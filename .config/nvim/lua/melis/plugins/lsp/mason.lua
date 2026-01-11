return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"vtsls",
				"vue_ls",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"eslint",
				"clangd",
				"tailwindcss",
			},
			-- 	automatic_enable = {
			-- 		exclude = {
			-- 			"jdtls",
			-- 		},
			-- 	},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"vue-language-server", -- Vue language server package (used by vue_ls)
				"vtsls", -- TypeScript language server with Vue plugin support
				"ocamlformat", -- ocaml formatter
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
