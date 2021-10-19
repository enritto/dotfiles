" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_dracula'
autocmd VimEnter * set nu
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
