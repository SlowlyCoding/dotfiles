
"  sudo apt insatll ccls

" automatically install plug.vim if not there yet
" and install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " better and faster fuzzy search
" LSP
Plug 'neovim/nvim-lspconfig'
" other useful plugins
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'Mangeshrex/uwu.vim'
call plug#end()

"colorscheme gruvbox
colorscheme uwu

" lightline config
" further colorschemes: https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
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
" Telescope mappings
let mapleader =  " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>bff <cmd>Telescope current_buffer_fuzzy_find<cr>
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
require('lspconfig').ccls.setup{}
EOF
