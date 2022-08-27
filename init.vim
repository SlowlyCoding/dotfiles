call plug#begin('~/.vim/plugged')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " better and faster fuzzy search
" LSP
Plug 'neovim/nvim-lspconfig'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" other useful plugins
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
" colorschemes
Plug 'RRethy/nvim-base16'
Plug 'logico/typewriter-vim'
Plug 'savq/melange'
call plug#end()

set termguicolors
colorscheme typewriter-night
"colorscheme base16-gruvbox-material-dark-hard

" lightline config
" further colorschemes: https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set nowrap
set scrolloff=10
set noshowmode
set relativenumber
set nu
set incsearch
set nohls

inoremap <C-c> <Esc>
" swapping some binds
nnoremap j k
nnoremap k j
vnoremap j k
vnoremap k j
nnoremap 0 ^
nnoremap ^ 0
" pane movement
nnoremap J <C-W><C-K>
nnoremap K <C-W><C-J>
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>
" makes brackets more accessible (swiss keyboard)
inoremap ç !
inoremap è [
inoremap ! ]
inoremap à {
inoremap £ }
vnoremap ç !
vnoremap è [
vnoremap ! ]
vnoremap à {
vnoremap £ }
cnoremap ç !
cnoremap è [
cnoremap ! ]
cnoremap à {
cnoremap £ }
" Telescope mappings
let mapleader =  " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
" LSP mappings
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gT <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gE <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> I <cmd>lua vim.lsp.buf.hover()<CR>

lua << EOF
require('telescope').setup{}
require('telescope').load_extension('fzf')
require('lspconfig').clangd.setup{
  vim.diagnostic.config({
    signs = false; -- get rid of the annoying signs on the left
  }),
  vim.diagnostic.disable() -- disable diagnostics by default
}
-- function to toggle diagnostics using tE (toggle errors)
vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.disable()
    print("diagnostic disabled")
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
    print("diagnostic enabled")
  end
end
vim.api.nvim_set_keymap('n', 'tE', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
-- treesitter config
require('nvim-treesitter.configs').setup {
  -- A list of parser names
  ensure_installed = { "cpp", "cuda", "glsl", "make", "python", "html", "css", "json", "vim", },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
