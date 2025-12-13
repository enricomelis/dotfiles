return {
  "nvim-lualine/lualine.nvim",
  -- Ensure you have web-devicons for filetype icons
  dependencies = { "nvim-tree/nvim-web-devicons" },
  
  -- The core configuration is within the config function
  config = function()
    local lualine = require("lualine")
    -- We need this dependency for the update count component
    local lazy_status = require("lazy.status") 
    
    -- Dynamically load the Tokyo Night color palette
    local colors = require("tokyonight.colors").setup()
    
    -- Define the custom Lualine theme using Tokyo Night colors
    local tokyonight_lualine = {
      -- Normal Mode Colors
      normal = {
        a = { bg = colors.blue, fg = colors.bg_dark, gui = "bold" },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
      
      -- Insert Mode Colors
      insert = {
        a = { bg = colors.green, fg = colors.bg_dark, gui = "bold" },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
      
      -- Visual Mode Colors
      visual = {
        a = { bg = colors.magenta, fg = colors.bg_dark, gui = "bold" },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
      
      -- Command/Replace/Terminal Modes
      command = {
        a = { bg = colors.yellow, fg = colors.bg_dark, gui = "bold" },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
      
      replace = {
        a = { bg = colors.red, fg = colors.bg_dark, gui = "bold" },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
      
      -- Inactive Window Colors
      inactive = {
        a = { bg = colors.bg_dark, fg = colors.fg_dark },
        b = { bg = colors.bg_dark, fg = colors.fg_dark },
        c = { bg = colors.bg_dark, fg = colors.fg_dark },
      },
    }

    -- Lualine Setup
    lualine.setup({
      options = {
        theme = tokyonight_lualine, 
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      
      -- Define which components go into which sections
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        
        lualine_x = { 
          -- 👇 YOUR NEW LAZY STATUS COMPONENT IS ADDED HERE
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            -- Use the Tokyo Night Yellow color for visibility
            color = { fg = colors.yellow }, 
          },
          'filetype', 
          'encoding', 
          'fileformat',
        }, 
        
        lualine_y = { 'progress' }, 
        lualine_z = { 'location' }
      },
      
      -- Empty sections for when a window is inactive
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      
      extensions = {}
    })
  end,
}
