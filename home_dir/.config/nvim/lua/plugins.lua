-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -------------------------
    -- Colorschemes
    -------------------------
    {'morhetz/gruvbox', lazy = false}, -- main
    {'catppuccin/nvim', name = 'catppuccin', lazy = true },
    {'rebelot/kanagawa.nvim', lazy = true },
    {'CreaturePhil/vim-handmade-hero', lazy = true },
    {'TheNiteCoder/mountaineer.vim', lazy = true },
    {'logico/typewriter-vim', lazy = true },
    {'nikolvs/vim-sunbather', lazy = true },

    --------------------
    -- tree-sitter
    --------------------
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
        lazy = false,
        config = function() require('plugin_configs.treesitter') end,
    },

    -------------------------
    -- Statusline (lualine)
    -------------------------
    { 
        'nvim-lualine/lualine.nvim', 
        lazy = false, 
        config = function() require('plugin_configs.lualine') end,
    },

    --------------------
    -- Telescope
    --------------------
    {
        'nvim-telescope/telescope.nvim', 
        dependencies = {
            'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
        cmd = "Telescope",
        config = function() require('plugin_configs.telescope') end,
    },

    -------------------------
    -- Oil (filetree as a buffer)
    -------------------------
    {
        'stevearc/oil.nvim',
        cmd = 'Oil',
        config = function() require('plugin_configs.oil') end,
        -- dependencies = { "nvim-tree/nvim-web-devicons"  },
    },

    --------------------
    -- LSP
    --------------------
    {
        'neovim/nvim-lspconfig', 
        ft = {"c", "cpp", "py", "tex"}, -- only start on these filestypes
        config = function() require('plugin_configs.lspconfig') end,
        dependencies = {
            -------------
            -- NavBuddy
            -------------
            'SmiteshP/nvim-navbuddy', 
            dependencies = {
                'neovim/nvim-lspconfig',
                'SmiteshP/nvim-navic',
                'MunifTanjim/nui.nvim',
            },
            config = function() require('plugin_configs.navbuddy') end,
        };
    },

    --------------------
    -- toggle comments 
    --------------------
    'tpope/vim-commentary',

    --------------------
    -- Autopairs
    --------------------
    {
        'altermo/ultimate-autopair.nvim',
        event = {'InsertEnter','CmdlineEnter'},
        enabled = true,
        branch='v0.6',
        dependencies = {
            "kylechui/nvim-surround",
            version = "*", -- Use for stability; omit to use `main` branch for the latest features
            event = "VeryLazy",
        },
        config = function() require('ultimate-autopair').setup() end, 
    },

    --------------------
    -- Dressing
    --------------------
    'stevearc/dressing.nvim',

    --------------------
    -- LaTeX support
    --------------------
    {
        'lervag/vimtex', 
        ft = "tex",
        config = function() require('plugin_configs.vimtex') end,
    },
})
