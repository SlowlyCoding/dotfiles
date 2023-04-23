return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Navbuddy
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
        }
    }
    -- statusline
    use 'nvim-lualine/lualine.nvim'
    -- Commenting
    use 'tpope/vim-commentary'
    -- colorful colorschemes
    use 'morhetz/gruvbox'
    use { "catppuccin/nvim", as = "catppuccin" }
    -- minimal colorschemes
    use 'CreaturePhil/vim-handmade-hero'
    use 'TheNiteCoder/mountaineer.vim'
    use 'logico/typewriter-vim'
    use 'nikolvs/vim-sunbather'
end)

