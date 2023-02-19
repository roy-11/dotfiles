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

call plug#begin('~/.config/nvim.vscode/plugged')
Plug 'tpope/vim-commentary' " gccでコメント
Plug 'tpope/vim-surround'
call plug#end()

"" space+enterで空行を追加する
noremap <Space><CR> O<ESC>

" Space Pで最後にヤンクした文字列をペースト
" nnoremap <silent> <C-p> "0p<CR>
noremap PP "0p

" 挿入モードから離れたときに入力モードを切り替える
autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC
