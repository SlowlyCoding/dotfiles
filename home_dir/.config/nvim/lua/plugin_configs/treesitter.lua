local ts = require('nvim-treesitter.config')

ts.setup {
    sync_install = false,
    auto_install = true,
}

local parsers_to_install = {
    "c", "cpp", "cuda", "glsl", "make", "python",
    "html", "css", "json", "vim", "lua", "rust", "latex"
}

require("nvim-treesitter").install(parsers_to_install)
