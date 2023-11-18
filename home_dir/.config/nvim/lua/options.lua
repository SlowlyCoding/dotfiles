------------------------------
-- colors
------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"
-- gruvbox
vim.g.gruvbox_contrast_dark = "hard" 
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, "Visual", { bg='#514f4d' }) -- less bright visual highlighting
vim.api.nvim_set_hl(0, "Pmenu", { bg='#161518' }) -- Navbuddy bg color
vim.o.guifont = "CaskaydiaCove NF:h14"

------------------------------
-- tab settings
------------------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

------------------------------
-- function to toggle diagnostics, mapping in mappings/init.lua
------------------------------
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
