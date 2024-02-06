require("copilot").setup({
    filetypes = {
        markdown = false,
    },
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = '<leader><Tab>',
        },
    }
})
