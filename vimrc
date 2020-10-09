" Show hybrid numbers
set number relativenumber
set nu rnu

" Encoding
set encoding=utf-8

" Show syntax
syntax on

" indentation
set tabstop=2
set shiftwidth=2
set expandtab

" Colorscheme
colorschem gruvbox
set background=dark

set t_Co=256
set term=screen-256color

" Textwidth
set textwidth=1000

" Search Highlighting
set incsearch

" Key mappings
" Switch j and k
nnoremap j k
nnoremap k j
vnoremap j k
vnoremap k j
" Change 0 and ^
nnoremap 0 ^
nnoremap ^ 0
" Bind yk to Escape 
inoremap yk <Esc>
inoremap YK <Esc>

" template file
:autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
