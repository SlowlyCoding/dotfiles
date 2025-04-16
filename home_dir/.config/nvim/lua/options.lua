------------------------------
-- colors
------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.o.guifont = "CaskaydiaCove NF:h14"
vim.g.gruvbox_contrast_dark = "hard"

-- set initial colorscheme
vim.g.current_color = "gruvbox"

-- store colorscheme configs
local colorschemes = {
    gruvbox = {
        name = "retrobox",
        highlights = {
            Visual = { bg = "#514f4d" }, -- Less bright visual highlighting
            Pmenu = { bg = "#161518" }, -- Navbuddy bg color
        },
        syntax = true,
        treesitter = "enable",
    },
    austere_no_syntax = {
        name = "austere",
        highlights = {},
        syntax = false,
        treesitter = "disable",
    },
    austere = {
        name = "austere",
        highlights = {},
        syntax = true,
        treesitter = "enable",
    }
}

-- function to apply a colorscheme and its config
local function apply_colorscheme(scheme)
    vim.cmd("colorscheme " .. scheme.name)

    if scheme.syntax then
        vim.cmd("syntax on")
    else
        vim.cmd("syntax off")
    end

    if scheme.treesitter == "enable" then
        vim.cmd("TSEnable highlight")
    else
        vim.cmd("TSDisable highlight")
    end

    -- apply any custom highlights
    for group, settings in pairs(scheme.highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

-- function to cycle between colorschemes
function _G.cycle_colors()
    if vim.g.current_color == "gruvbox" then
        vim.g.current_color = "austere_no_syntax"
    elseif vim.g.current_color == "austere_no_syntax" then
        vim.g.current_color = "austere"
    elseif vim.g.current_color == "austere" then
        vim.g.current_color = "gruvbox"
    end
    apply_colorscheme(colorschemes[vim.g.current_color])
end

-- apply the initial colorscheme when nvim starts
apply_colorscheme(colorschemes[vim.g.current_color])


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
    require('nvim-navbuddy').attach(client, args.buf) -- attach navbuddy
  end,
})

------------------------------
-- function to toggle diagnostics, mapping in mappings/init.lua
------------------------------
function _G.toggle_diagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end
