set shiftwidth=2 "インデント文字数
set tabstop=2 "タブの大きさ
set expandtab "タブをスペースに変換
set textwidth=0 "自動改行しない
set autoindent "改行時に自動インデント（現在行のインデントキープ）
set hlsearch "検索結果をハイライト
set clipboard=unnamedplus "コピー内容をクリップボードと連携
set number "行数を表示
set mouse=a "マウスでカーソル移動
syntax on

call plug#begin()
Plug 'tomasiser/vim-code-dark' "テーマ
Plug 'junegunn/fzf.vim' "fzfをvimで使用
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzfをvimで使用
Plug 'neoclide/coc.nvim', {'branch': 'release'} "LSPプラグイン
Plug 'vim-airline/vim-airline' "ステータスバー
Plug 'vim-airline/vim-airline-themes' "vim-airlineのテーマ
Plug 'preservim/nerdtree' "ファイラー
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtreeにgit statusを追加
Plug 'ryanoasis/vim-devicons' "プラグインにアイコン追加
Plug 'tmsvg/pear-tree' "括弧補完
Plug 'terryma/vim-multiple-cursors' "複数選択・マルチカーソル
Plug 'airblade/vim-gitgutter' "左端の差分表示
Plug 'tpope/vim-fugitive' "vimコマンドのgit機能
Plug 'junegunn/goyo.vim' "zenモード
Plug 'editorconfig/editorconfig-vim' "Editorconfigプラグイン
Plug 'tpope/vim-commentary' " gccでコメント
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] } " フォーマット
call plug#end()

"" space+enterで空行を追加する
noremap <Space><CR> O<ESC>

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
let NERDTreeShowHidden=1 "dotfileを表示する
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

" prettier フォーマット ファイルが保存される前 
augroup fmt
autocmd!
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
augroup END

" 挿入モードから離れたときに入力モードを切り替える
autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC
