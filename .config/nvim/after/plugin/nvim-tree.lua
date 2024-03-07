local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function grep_at_current_tree_node()
		local node = require("nvim-tree.lib").get_node_at_cursor()
		if not node then
			return
		end
		require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<leader>ts", grep_at_current_tree_node, opts("grep at current tree node"))
end

-- pass to setup along with your other options
require("nvim-tree").setup({
	---
	on_attach = my_on_attach,
	update_focused_file = {
		enable = true,
	},
	---
})

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, { desc = "nvim-tree: toggle" })
