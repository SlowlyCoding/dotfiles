------------------------------
-- colors
------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.o.guifont = "CaskaydiaCove NF:h14"

vim.cmd("colorscheme retrobox")

local custom_highlights = {
  Visual = { bg = "#514f4d" },  -- Less bright visual highlighting
  Pmenu  = { bg = "#161518" },  -- Navbuddy bg color
}
for group, settings in pairs(custom_highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end

------------------------------
-- tab settings
------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

------------------------------
-- general vim settings
------------------------------
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hls = false
vim.opt.mouse = ""
vim.opt.signcolumn = "yes"
vim.opt.winborder = 'rounded'

------------------------------
-- tree-sitter auto-start hook
------------------------------
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-auto-start', { clear = true }),
  callback = function()
    -- pcall (protected call) safely attempts to start Treesitter. 
    -- If you don't have the parser installed for the current language, 
    -- it gracefully fails and falls back to standard Vim regex highlighting.
    pcall(vim.treesitter.start)
  end,
})

------------------------------
-- lsp settings
------------------------------
vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp' },
}
vim.lsp.config.luals = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
}
vim.lsp.config.pyright = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
}

vim.lsp.enable({'clangd', 'luals', 'pyright'})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.diagnostic.enable(false) -- disable diagnostics by default (toggled using tE)
    vim.diagnostic.config({
      signs = false, -- get rid of the annoying signs on the left
      virtual_text = true
    })
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- client.server_capabilities.semanticTokensProvider = nil
    require('nvim-navbuddy').attach(client, args.buf) -- attach navbuddy
  end,
})

------------------------------
-- function to toggle diagnostics, mapping in mappings/init.lua
------------------------------
function _G.toggle_diagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end
