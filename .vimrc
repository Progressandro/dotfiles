set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set hidden
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()
colorscheme codedark 
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-e> :copen<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
