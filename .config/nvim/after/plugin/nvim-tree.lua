require("nvim-tree").setup({})
local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>tt", function()
	api.tree.toggle({ find_file = true })
end, { noremap = true, silent = true })
