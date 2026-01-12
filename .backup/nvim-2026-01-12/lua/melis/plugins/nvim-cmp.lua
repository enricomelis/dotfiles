return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		-- ADD THIS: Tailwind colorizer for the completion menu
		{ "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local tailwind_colorizer = require("tailwindcss-colorizer-cmp")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			entry_filter = function(entry, ctx)
				local completion_item = entry:get_completion_item()
				if not completion_item then
					return true
				end

				local label = completion_item.label or ""
				local insert_text = completion_item.insertText or ""

				if label:lower():match("^import") or insert_text:lower():match("^import") then
					return false
				end

				if completion_item.kind == 18 or completion_item.kind == 9 then
					return false
				end

				return true
			end,

			formatting = {
				-- This is the modified formatting logic
				format = function(entry, item)
					-- 1. Use tailwind-colorizer to add color swatches
					item = tailwind_colorizer.formatter(entry, item)

					-- 2. Use lspkind to add the usual icons (folders, methods, etc)
					return lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, item)
				end,
			},
		})
	end,
}
