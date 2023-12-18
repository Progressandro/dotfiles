local telescope = require("telescope")
local builtin = require("telescope.builtin")
telescope.setup()
telescope.load_extension("file_browser")
local telescope_key = "t"
vim.keymap.set("n", "<leader>" .. telescope_key .. "f", builtin.find_files, {})
vim.keymap.set("n", "<leader>" .. telescope_key .. "g", builtin.git_files, {})
vim.keymap.set(
	"n",
	"<leader>" .. telescope_key .. "s",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{}
)
vim.keymap.set("n", "<leader>" .. telescope_key .. "b", builtin.buffers, {})
vim.keymap.set("n", "<leader>" .. telescope_key .. "h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>" .. telescope_key .. "b", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
