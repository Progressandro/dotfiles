-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons', opt = true 
    }
  }
  use 'vimpostor/vim-tpipeline'
  use 'mbbill/undotree'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
        'folke/trouble.nvim',
        requires = {
            { 'nvim-tree/nvim-web-devicons' },
        },
  }
end)
