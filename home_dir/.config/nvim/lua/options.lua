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
    jellybeans = {
        name = "jellybeans",
        highlights = {},
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
        vim.g.current_color = "jellybeans"
    elseif vim.g.current_color == "jellybeans" then
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
vim.opt.signcolumn = "yes"

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
