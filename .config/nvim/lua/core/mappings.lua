vim.g.mapleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>e", "<CMD>:Oil --float<CR>")
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })

-- LSP
vim.keymap.set("n", "<leader>gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>gr", "<CMD>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>cr", "<CMD>lua vim.lsp.buf.rename()<CR>")

-- Persistence
vim.keymap.set("n", "<leader>sl", function()
	require("persistence").load({ last = true })
end)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.keymap.set("i", "<C-S>", "<Plug>(copilot-accept-line)", {})
vim.keymap.set("i", "<C-D>", "<Plug>(copilot-accept-word)", {})
vim.keymap.set("i", "<C-F>", "<Plug>(copilot-next)", {})

-- Open references without focusing on quickfix list
vim.keymap.set("n", "grr", function()
	local win = vim.api.nvim_get_current_win()
	vim.lsp.buf.references(nil, {
		on_list = function(items, title)
			vim.fn.setqflist({}, " ", items)
			vim.cmd.copen()
			vim.api.nvim_set_current_win(win)
		end,
	})
end)

-- Toggle quickfix list
vim.keymap.set("n", "<leader>q", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd("botright " .. action)
end, noremap_silent)

-- Center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>H", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

-- Open current file and line in devtools
vim.keymap.set("n", "<leader>oc", function()
	local filenameAndLine = vim.fn.expand("%:t") .. ":" .. vim.fn.line(".")
	local script = [[
    tell application "Google Chrome"
      activate
      tell application "System Events"
        keystroke "i" using {command down, option down}
        delay 0.5
        keystroke "p" using command down
        delay 1
        keystroke "<<filenameAndLine>>"
      end tell
    end tell
  ]]
	script = script:gsub("<<filenameAndLine>>", filenameAndLine)
	vim.print("Running script: " .. script)
	vim.system({
		"osascript",
		"-e",
		script,
	})
end, { desc = 'Open chrome dev tools and run "open file" with current file and line' })
