vim.g.mapleader = " "
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { silent = true })
-- Navigation
vim.keymap.set("i", "jj", "<Esc>")
-- Move current line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
-- Center on cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center on found text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
