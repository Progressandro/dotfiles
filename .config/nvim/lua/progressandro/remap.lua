vim.g.mapleader = " "
-- Navigation
vim.keymap.set("i", "jj", "<Esc>")
-- Move current line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
-- Center on cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center on found text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Tmux navigation
vim.keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateRight<CR>", { silent = true, buffer = 0 })

-- Trouble.nvim
vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end, { remap = true })
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, { remap = true })
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, { remap = true })
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, { remap = true })
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, { remap = true })
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end, { remap = true })

-- netrw mappings
local function netrw_mapping()
    local bufmap = function(lhs, rhs)
        local opts = { buffer = true, remap = true }
        vim.keymap.set('n', lhs, rhs, opts)
    end

    bufmap('<C-l>', ':<C-U>TmuxNavigateLeft<cr>')
end

local user_cmds = vim.api.nvim_create_augroup('user_cmds', { clear = true })
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    group = user_cmds,
    desc = 'Keybindings for netrw',
    callback = netrw_mapping
})
