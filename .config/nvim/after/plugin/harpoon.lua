local harpoon = require("harpoon")

harpoon:setup()

-- keybindings
vim.keymap.set("n", "<leader>" .. "a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>" .. "h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<Tab>", function()
	harpoon:list():next()
end)
vim.keymap.set("n", "<S-Tab>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>" .. "q", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>" .. "w", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>" .. "e", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>" .. "r", function()
	harpoon:list():select(4)
end)
