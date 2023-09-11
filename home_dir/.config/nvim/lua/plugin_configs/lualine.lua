require('lualine').setup{
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '|',
        globalstatus = true,
        refresh = { statusline = 50 }
    },
    sections = {
        lualine_b = {
            {'tabs', mode = 1}
        },
        lualine_c = {'diagnostics'},
        lualine_x = {'diff'},
        lualine_y = {'progress'},
        lualine_z = {'g:diagnostics_active'}
    }
}

