vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<leader>net", ":Ex<CR>")

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close current buffer" })

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
-- increment and decrement numbers

-- map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- window split management (i don't use them)

-- map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
-- map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
-- map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
-- map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
-- map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- tab management

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- now J and K move up and down (with indentation) while in visual mode

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- <C-d> and <C-U> also keep the cursor centered

map("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy UI" })
map("n", "<leader>bf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format current buffer " })


