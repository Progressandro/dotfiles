local HARPOON_KEY = 'h'
vim.keymap.set('n', '<leader>' .. HARPOON_KEY .. 'm', ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<leader>' .. HARPOON_KEY .. 'h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<leader>' .. HARPOON_KEY .. 'n', ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', '<leader>' .. HARPOON_KEY .. 'p', ':lua require("harpoon.ui").nav_prev()<CR>')
