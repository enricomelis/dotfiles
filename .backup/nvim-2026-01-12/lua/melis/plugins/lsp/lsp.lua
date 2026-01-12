return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Configure vtsls with Vue TypeScript plugin for TypeScript support in Vue files
    local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }

    vim.lsp.config("vtsls", {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })

    -- Enable vue_ls for Vue template/style sections
    vim.lsp.config("vue_ls", {
      filetypes = { 'vue' },
    })

    -- Enable tailwindcss LSP for Tailwind CSS IntelliSense
    vim.lsp.config("tailwindcss", {
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
      settings = {
        tailwindCSS = {
          validate = true,
          lint = {
            invalidApply = 'error',
            invalidVariant = 'warning',
            invalidConfigPath = 'error',
            invalidTailwindDirective = 'error',
            recommendedVariantOrder = 'warning',
          },
        },
      },
    })

    -- Enable ocamllsp for OCaml support
    vim.lsp.config("ocamllsp", {
      filetypes = { 'ocaml', 'ocamlinterface', 'ocamllex', 'ocamlyacc' },
      cmd = { vim.fn.expand("~/.opam/default/bin/ocamllsp") },
    })

    -- Enable the servers
    vim.lsp.enable("vtsls")
    vim.lsp.enable("vue_ls")
    vim.lsp.enable("tailwindcss")
    vim.lsp.enable("ocamllsp")
  end,
}
