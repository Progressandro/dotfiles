-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP/Autocompletion plugins
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin" }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Undo plugin
    use('mbbill/undotree')

    -- Git plugin
    use('tpope/vim-fugitive')

    -- tmux plugin
    use('christoomey/vim-tmux-navigator')
    -- Copilot plugin
    use('github/copilot.vim')

    -- Trouble
    use {
        'folke/trouble.nvim',
        requires = {
            { 'nvim-tree/nvim-web-devicons' },
        },
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'NeogitOrg/neogit',
        requires = {
            { "nvim-lua/plenary.nvim" },       -- required
            { "nvim-telescope/telescope.nvim" }, -- optional
            { "sindrets/diffview.nvim" },      -- optional
            { "ibhagwan/fzf-lua" },            -- optional
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('vimpostor/vim-tpipeline')
end)
