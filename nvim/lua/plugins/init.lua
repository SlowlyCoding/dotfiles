return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- Commenting
  use 'tpope/vim-commentary'
  -- colorful colorschemes
  use 'morhetz/gruvbox'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- minimal colorschemes
  use 'logico/typewriter-vim'
  use 'nikolvs/vim-sunbather'
end)
