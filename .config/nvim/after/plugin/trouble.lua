local builtin = require('trouble')
vim.keymap.set("n", "<leader>xx", function() builtin.open() end, { remap = true })
vim.keymap.set("n", "<leader>xw", function() builtin.open("workspace_diagnostics") end, { remap = true })
vim.keymap.set("n", "<leader>xd", function() builtin.open("document_diagnostics") end, { remap = true })
vim.keymap.set("n", "<leader>xq", function() builtin.open("quickfix") end, { remap = true })
vim.keymap.set("n", "<leader>xl", function() builtin.open("loclist") end, { remap = true })
vim.keymap.set("n", "gR", function() builtin.open("lsp_references") end, { remap = true })

