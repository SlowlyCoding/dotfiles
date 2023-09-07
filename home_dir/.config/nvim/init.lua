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

vim.g.mapleader = ' '

-- plugin list
require("lazy").setup({
    {'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'neovim/nvim-lspconfig',
    {
        'SmiteshP/nvim-navbuddy', 
        dependencies = {
            'neovim/nvim-lspconfig',
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim',}
    },
    'nvim-lualine/lualine.nvim',
    'tpope/vim-commentary',
    'lervag/vimtex',
    -- colorschemes
    'morhetz/gruvbox',
    {'catppuccin/nvim', name = 'catppuccin', enabled = false },
    {'rebelot/kanagawa.nvim', enabled = false },
    {'CreaturePhil/vim-handmade-hero', enabled = false },
    {'TheNiteCoder/mountaineer.vim', enabled = false },
    {'logico/typewriter-vim', enabled = false },
    {'nikolvs/vim-sunbather', enabled = false },
})

require('options')
require('mappings')
