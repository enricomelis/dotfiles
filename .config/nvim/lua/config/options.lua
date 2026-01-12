vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

-- show line numbers and relatives
opt.number = true
opt.relativenumber = true

-- removes mode and ruler (given by lualine)
opt.showmode = false
opt.ruler = false
opt.laststatus = 3

-- indentation: 4 expanded spaces copied from previous line
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- disables line wrapping
opt.wrap = false

-- enables smart case-sensitiveness for search
-- and removes highlights right after the search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- enables line under current line
opt.cursorline = false

-- colorschemes that can be light or dark will be made dark
-- show sign column so that text doesn't shift and removes default "~"
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }

-- allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- use system clipboard as default register
opt.clipboard:append("unnamedplus")

-- enables right and below window splits
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
