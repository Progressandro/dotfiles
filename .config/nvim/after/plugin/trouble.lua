local TROUBLE_KEY = "x"
vim.keymap.set("n", "<leader>" .. TROUBLE_KEY .. "x", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>" .. TROUBLE_KEY .. "D", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>" .. TROUBLE_KEY .. "d", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>" .. TROUBLE_KEY .. "q", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>" .. TROUBLE_KEY .. "l", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
