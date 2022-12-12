-- colorscheme
vim.opt.termguicolors = true
vim.g.catppuccin_flavour = "mocha"
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")

-- tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.cmd("autocmd FileType python setlocal tabstop=2")
-- vim.cmd("autocmd FileType python setlocal shiftwidth=2")

-- other vim settings
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.showmode = false
vim.opt.relativenumber = false
vim.opt.nu = false
vim.opt.hls = false

-- lualine settings
require('lualine').setup{
  options = { 
    theme = 'auto',
    section_separators = '', 
    component_separators = '|'},
  sections = { 
    lualine_b = {'diagnostics'},
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'g:diagnostics_active'} }
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
require("grammar-guard").init()
require("lspconfig")['grammar_guard'].setup({
  cmd = { '/usr/bin/ltex-ls' }, -- add this if you install ltex-ls yourself
})

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
  ensure_installed = { "cpp", "cuda", "glsl", "make", "python", "html", "css", "json", "vim", "lua", "rust", },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
  },
}
