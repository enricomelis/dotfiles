return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Gruvbox Palette
    local colors = {
      blue        = "#83a598",
      green       = "#b8bb26",
      violet      = "#d3869b",
      yellow      = "#fabd2f",
      red         = "#fb4934",
      fg          = "#ebdbb2",
      bg          = "#3c3836", -- Statusline BG (slightly lighter than main window)
      inactive_bg = "#282828", -- Matches main window background
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.fg, fg = colors.bg, gui = "bold" }, -- Gruvbox style: Dark text on Light FG
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" }, -- Visual mode is usually Orange/Yellow in Gruvbox
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = "#928374", gui = "bold" }, -- Gray text
        b = { bg = colors.inactive_bg, fg = "#928374" },
        c = { bg = colors.inactive_bg, fg = "#928374" },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#fe8019" }, -- Gruvbox Orange for updates
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
