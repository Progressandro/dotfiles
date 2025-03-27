local mason_dir = vim.fn.stdpath("data") .. "/mason/bin/"
local util = require("config.util")
return {
	init_options = { hostInfo = "neovim" },
	cmd = { mason_dir .. "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(bufnr, done_callback)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		done_callback(util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname))
	end,
}
