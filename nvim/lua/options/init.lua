-- colorscheme
vim.opt.termguicolors = true
vim.g.catppuccin_flavour = "mocha"
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- other vim settings
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hls = false
vim.opt.mouse = ""

-- lualine settings
require('lualine').setup{
  options = { 
    theme = 'auto',
    section_separators = '', 
    component_separators = '|',
    refresh = { statusline = 50 }
  },
  sections = { 
    lualine_b = { 
      {'tabs', mode = 1} 
    },
    lualine_c = {'diagnostics'},
    lualine_x = {'diff'},
    lualine_y = {'progress'},
    lualine_z = {'g:diagnostics_active'} 
  }
}

-- telescope setup
require('telescope').setup{}
require('telescope').load_extension('fzf')

-- lsp config
require('lspconfig')['clangd'].setup{
  vim.diagnostic.config({signs = false;}), -- get rid of the annoying signs on the left
  vim.diagnostic.disable(), -- disable diagnostics by default
}
require('lspconfig')['rust_analyzer'].setup{
  vim.diagnostic.config({signs = false;}),
  vim.diagnostic.disable(),
}

-- function to toggle diagnostics, mapping in mappings/init.lua
vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

-- treesitter config
require('nvim-treesitter.configs').setup {
  -- A list of parser names
  ensure_installed = { "c", "cpp", "cuda", "glsl", "make", "python", "html", "css", "json", "vim", "lua", "rust", },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
  },
}
