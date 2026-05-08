require('telescope').setup{
  pickers = {
    find_files = {
      hidden = true
    },
    colorscheme = {
      enable_preview = true
    }
  }
}
require('telescope').load_extension('fzf')
