-- Set the focus on undotree window when it's toggled
vim.g.undotree_SetFocusWhenToggle = 1

local UNDO_TREE_KEY = "u"
vim.keymap.set('n', '<leader>' .. UNDO_TREE_KEY, vim.cmd.UndotreeToggle)
