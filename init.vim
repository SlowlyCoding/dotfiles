" automatically install plug.vim if not there yet
" and install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
" Telescope
let mapleader =  " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
