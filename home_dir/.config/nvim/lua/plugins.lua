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
    {'morhetz/gruvbox', lazy = false },
    {'lurst/austere.vim', lazy = false }, -- minimal b&w
    { "wtfox/jellybeans.nvim", lazy = false },
    {'HoNamDuong/hybrid.nvim', lazy = false },
    {'projekt0n/github-nvim-theme', lazy = false },
    {'catppuccin/nvim', name = 'catppuccin', lazy = false },
    {'Mofiqul/vscode.nvim', lazy = false },
    {'rebelot/kanagawa.nvim', lazy = true },
    {'nikolvs/vim-sunbather', lazy = true },
    { "rose-pine/neovim", name = "rose-pine", lazy = true },

    -- Transparency (:TransaprentEnable)
    'xiyaowong/transparent.nvim',

    --------------------
    -- Icons
    --------------------
    {'nvim-tree/nvim-web-devicons'},

    --------------------
    -- tree-sitter
    --------------------
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        -- version = '0.9.2',
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
            'ahmedkhalf/project.nvim',
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
    },

    --------------------
    -- Scrollbar
    --------------------
    {
        'petertriho/nvim-scrollbar',
        config = function() require('scrollbar').setup({}) end,
    },

    --------------------
    -- GitSigns
    --------------------
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end,
    },

    --------------------
    -- NavBuddy
    --------------------
    {
        'SmiteshP/nvim-navbuddy',
        dependencies = {
            -- 'neovim/nvim-lspconfig',
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim',
        },
        config = function() require('plugin_configs.navbuddy') end,
    },

    --------------------
    -- toggle comments 
    --------------------
    'tpope/vim-commentary',

    --------------------
    -- Dressing
    --------------------
    'stevearc/dressing.nvim',

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
    -- Trouble
    --------------------
    {
        'folke/trouble.nvim',
        cmd = "Trouble",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            action_keys = {
                hover = "I",
                next = 'k',
                previous = 'j',
            }
        },
    },

    --------------------
    -- Fun Stuff
    --------------------
    {
        'eandrju/cellular-automaton.nvim',
        event = "VeryLazy",
    },
})
