set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamedplus
set number
set mouse=a
syntax on

call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' "ファイラー
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtreeにgit statusを追加
Plug 'ryanoasis/vim-devicons' "プラグインにアイコン追加
Plug 'tmsvg/pear-tree' "括弧補完
Plug 'terryma/vim-multiple-cursors' "複数選択・マルチカーソル
Plug 'airblade/vim-gitgutter' "左端の差分表示
Plug 'tpope/vim-fugitive' "vimコマンドのgit機能
Plug 'junegunn/goyo.vim'
call plug#end()

"" fzf
nnoremap <C-p> :FZF<CR>

"" vim-airline
let g:airline#extensions#tabline#enabled = 1 "tabを有効にする
let g:airline#extensions#tabline#buffer_idx_mode = 1 "タブに番号を表示
nmap gT <Plug>AirlineSelectPrevTab
nmap gt <Plug>AirlineSelectNextTab

"" vim-code-dark(テーマ)
colorscheme codedark
let g:airline_theme = 'codedark'

"" vim-gitgutter(左端の差分表示)
set signcolumn=yes "常に表示
set updatetime=100 "100ms更新
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3 
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

""NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1 "追加したgit statusにアイコンを使用

"" fern(ファイラー)
" Plug 'lambdalisue/fern.vim'
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * ++nested Fern -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"" スニペット設定
" 手動vimコマンド: CocInstall coc-snippets
" https://github.com/neoclide/coc-snippets
" python3 -m pip install --user --upgrade pynvim
" https://github.com/neoclide/coc-snippets/issues/196
