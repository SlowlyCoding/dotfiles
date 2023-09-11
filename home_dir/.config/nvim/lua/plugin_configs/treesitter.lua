require('nvim-treesitter.configs').setup {
    -- A list of parser names
    ensure_installed = { "c", "cpp", "cuda", "glsl", "make", "python", "html", "css", "json", "vim", "lua", "rust", "latex", },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
        enable = true,
    },
}
