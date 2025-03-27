return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				lua = { "stylua" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
