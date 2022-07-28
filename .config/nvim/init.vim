set encoding=utf-8
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set ignorecase
set mouse=a
set guicursor=
set number
set relativenumber

colorscheme nord


syntax enable
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
source $HOME/.config/nvim/lotus.vim
source $HOME/.config/nvim/lotusbar.vim

nnoremap ,<space> :CHADopen<CR>
nnoremap <space>x :wq!<CR>

let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '

set noshowmode

hi EndOfBuffer guifg=bg guibg=bg
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=#302d38 guifg=#302d38
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

syntax on


call plug#begin('~/.nvim/autload')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'LunarWatcher/auto-pairs'

call plug#end()
