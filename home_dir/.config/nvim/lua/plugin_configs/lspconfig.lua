local navbuddy = require("nvim-navbuddy")
local lsp = require("lspconfig")
local servers = {
    "clangd",
    "rust_analyzer",
    "pyright",
    "ltex",
    "lua_ls",
}

for _, server in ipairs(servers) do
    lsp[server].setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil -- disable highlighting from the LSP
            vim.diagnostic.config({signs = false;}) -- get rid of the annoying signs on the left
            vim.diagnostic.disable() -- disable diagnostics by default
            navbuddy.attach(client, bufnr)
        end,
    })
end
