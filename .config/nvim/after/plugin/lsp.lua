local lsp_zero = require("lsp-zero")

lsp_zero.configure("lua_ls", {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end)
lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		tsserver = function()
			require("lspconfig").tsserver.setup({
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})
		end,
	},
})

local null_ls = require("null-ls")

local null_opts = lsp_zero.build_options("null-ls", {
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ name = 'null-ls' })")
		end
	end,
})
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		-- formatting
		formatting.prettierd, -- JavaScript / TypeScript
		formatting.stylua, -- Lua

		-- linting
		lint.eslint_d, -- JavaScript / TypeScript

		-- code actions
		action.eslint_d, -- JavaScript / TypeScript
	},
})

lsp_zero.setup()

require("mason").setup({})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})

lsp_zero.format_mapping("<F3>", {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua" },
	},
})
