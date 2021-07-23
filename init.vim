" automatically install plug.vim if not there yet
" and install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

colorscheme gruvbox

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

let mapleader =  " " 
nnoremap j k
nnoremap k j
vnoremap j k
vnoremap k j
nnoremap 0 ^
nnoremap ^ 0

inoremap yk <Esc>
inoremap YK <Esc>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
