-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.number = true
opt.relativenumber = true
-- show line numbers and relatives

opt.showmode = false
opt.ruler = false
opt.laststatus = 3
-- removes mode and ruler (given by lualine)

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
-- indentation: 4 expanded spaces copied from previous line

opt.wrap = false
-- disables line wrapping

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
-- enables smart case-sensitiveness for search
-- and removes highlights right after the search

opt.cursorline = true
-- enables line under current line

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
-- colorschemes that can be light or dark will be made dark
-- show sign column so that text doesn't shift and removes default "~"

opt.backspace = "indent,eol,start"
-- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus")
-- use system clipboard as default register

opt.splitright = true
opt.splitbelow = true
-- enables right and below window splits

opt.swapfile = false
-- turn off swapfile
