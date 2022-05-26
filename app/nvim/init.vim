set shiftwidth=4
set tabstop=4
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamedplus
set number
syntax on

call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" vim-airline
let g:airline#extensions#tabline#enabled = 1

"" vim-code-dark(テーマ)
colorscheme codedark
let g:airline_theme = 'codedark'

"" fern(ファイラー)
" Plug 'lambdalisue/fern.vim'
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * ++nested Fern -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif
