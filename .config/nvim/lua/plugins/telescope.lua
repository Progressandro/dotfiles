return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      -- install the latest stable version
      version = "*",
    }
  },
  config = function()
    local builtin = require('telescope.builtin')
    require("telescope").load_extension "frecency"
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fr', ':Telescope frecency workspace=CWD<CR>', { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    require "config.telescope.multigrep".setup()
  end,
}
