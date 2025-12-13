return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")
    local map = vim.keymap.set

    nvimtree.setup({
      view = {
        width = 30,
        relativenumber = true,
        signcolumn = "yes",
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
        highlight_git = true,
      },
      git = {
        enable = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true, 
        },
      },
      filters = {
        custom = { ".DS_Store", "node_modules", "vendor" },
      },
      diagnostics = {
        enable = true,
      },
    })

    map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

  end,
}
