require('oil').setup({
    view_options = {
        show_hidden = true,
        sort = {
            { "type", "asc"  }, -- first sort by type
            { "mtime", "desc" }, -- then by last modified time
        },
    },

    float = {
        max_width = 50,
        max_height = 28,
    },

    keymaps = {
        ["q"] = "actions.close",
    },
})

