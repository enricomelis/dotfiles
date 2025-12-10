return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- ensure icons are available
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 1. Set the Header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- 2. Define Menu Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>AutoSession restore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- 3. Set Footer (Random Quote or simple text)
    local function footer()
      -- You can replace this with a random quote plugin if you have one
      return "  Code is Poetry  "
    end
    dashboard.section.footer.val = footer()

    -- 4. Apply Gruvbox Specific Highlights
    -- We define specific Alpha groups and link them to Gruvbox colors
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Apply specific colors for the shortcuts (the key text)
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    -- Define the Highlight Groups 
    -- Note: We use 'User' event or immediate execution to ensure colorscheme is loaded first
    local set_hl = vim.api.nvim_set_hl
    
    -- GRUVBOX PALETTE MAPPING
    -- Header -> Orange (Classic Gruvbox look)
    set_hl(0, "AlphaHeader", { link = "GruvboxOrange" })
    -- Buttons -> Foreground / White
    set_hl(0, "AlphaButtons", { link = "GruvboxFg1" }) 
    -- Shortcuts -> Aqua (Provides nice contrast)
    set_hl(0, "AlphaShortcut", { link = "GruvboxAqua" })
    -- Footer -> Gray (Subtle)
    set_hl(0, "AlphaFooter", { link = "GruvboxGray" })

    -- Fallback: If Gruvbox highlights aren't found (e.g., different theme loaded), 
    -- these links map to standard Vim groups so it doesn't break.
    if vim.fn.hlexists("GruvboxOrange") == 0 then
      set_hl(0, "AlphaHeader", { link = "Type" })
      set_hl(0, "AlphaShortcut", { link = "Function" })
      set_hl(0, "AlphaFooter", { link = "Comment" })
    end

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
