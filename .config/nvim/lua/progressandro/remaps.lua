vim.g.mapleader = " "
-- Move current line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Open file explorer
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
-- Center on cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center on found text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Soft escape
vim.keymap.set("i", "<C-c>", "<Esc>")
