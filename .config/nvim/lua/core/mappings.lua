vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', '<CMD>:Oil --float<CR>')

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
end
)

-- Toggle quickfix list
vim.keymap.set('n', '<leader>q', function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and 'cclose' or 'copen'
  vim.cmd('botright ' .. action)
end, noremap_silent)


-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>H", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

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
end, { desc = "Open chrome dev tools and run \"open file\" with current file and line" })
