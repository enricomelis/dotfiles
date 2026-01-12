vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<leader>net", ":Ex<CR>")

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- increment and decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- now J and K move up and down (with indentation) while in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- <C-d> and <C-U> also keep the cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
