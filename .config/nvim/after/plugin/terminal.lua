local TERMINAL_KEY = "`"

vim.keymap.set("n", TERMINAL_KEY .. "1", ':1ToggleTerm dir=git_dir direction="float"<CR>i')
vim.keymap.set("n", TERMINAL_KEY .. "2", ':2ToggleTerm dir=git_dir direction="float"<CR>i')
vim.keymap.set("n", TERMINAL_KEY .. "3", ':3ToggleTerm dir=git_dir direction="float"<CR>i')
vim.keymap.set("t", TERMINAL_KEY .. TERMINAL_KEY, "<C-\\><C-n>:ToggleTerm<CR>")
