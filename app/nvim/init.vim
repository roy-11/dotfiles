set shiftwidth=2
set tabstop=2
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
Plug 'tmsvg/pear-tree' "括弧補完
Plug 'terryma/vim-multiple-cursors' "複数選択・マルチカーソル
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

"" スニペット設定
" 手動vimコマンド: CocInstall coc-snippets
" https://github.com/neoclide/coc-snippets
" python3 -m pip install --user --upgrade pynvim
" https://github.com/neoclide/coc-snippets/issues/196
