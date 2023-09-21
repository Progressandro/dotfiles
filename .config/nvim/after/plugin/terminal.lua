local TERMINAL_KEY = "`"

vim.keymap.set("n", TERMINAL_KEY .. "1", ':1ToggleTerm dir=git_dir direction="float"<CR>')
vim.keymap.set("n", TERMINAL_KEY .. "2", ':2ToggleTerm dir=git_dir direction="float"<CR>')
vim.keymap.set("n", TERMINAL_KEY .. "3", ':3ToggleTerm dir=git_dir direction="float"<CR>')
vim.keymap.set("t", TERMINAL_KEY .. TERMINAL_KEY, "<C-\\><C-n>:ToggleTerm<CR>")

local augroup_term_insert = vim.api.nvim_create_augroup("Term-Insert", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter", "TermOpen", "TermEnter" }, {
	group = augroup_term_insert,
	pattern = "term://*",
	command = "startinsert",
})
