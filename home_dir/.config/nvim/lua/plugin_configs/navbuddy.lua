local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")
navbuddy.setup {
    window = {
        border = "rounded",
        size = "60%",
    },
    use_default_mappings = true,
    mappings = {
        ["k"] = actions.next_sibling(),     -- down
        ["j"] = actions.previous_sibling(), -- up
    },
}
