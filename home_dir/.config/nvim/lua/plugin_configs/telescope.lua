require('telescope').setup{
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
require('telescope').load_extension('fzf')
