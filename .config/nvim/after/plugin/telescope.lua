local builtin = require('telescope.builtin')
local telescope_key = 't'
vim.keymap.set('n', '<leader>' .. telescope_key .. 'f', builtin.find_files, {})
vim.keymap.set('n', '<leader>' .. telescope_key .. 'g', builtin.git_files, {})
vim.keymap.set('n', '<leader>' .. telescope_key .. 's', builtin.live_grep, {})
vim.keymap.set('n', '<leader>' .. telescope_key .. 'b', builtin.buffers, {})
vim.keymap.set('n', '<leader>' .. telescope_key .. 'h', builtin.help_tags, {})
