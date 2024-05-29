local telescope = require("telescope")
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")
telescope.setup({
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-S-K>"] = lga_actions.quote_prompt(),
					["<C-S-I>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					-- freeze the current list and start a fuzzy search in the frozen list
					["<C-space>"] = lga_actions.to_fuzzy_refine,
				},
			},
			-- ... also accepts theme settings, for example:
			-- theme = "dropdown", -- use dropdown theme
			-- theme = { }, -- use own theme spec
			-- layout_config = { mirror=true }, -- mirror preview pane
		},
	},
})
telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")
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
