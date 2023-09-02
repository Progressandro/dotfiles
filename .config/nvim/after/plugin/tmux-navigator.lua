vim.keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateRight<CR>", { silent = true, buffer = 0 })

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
