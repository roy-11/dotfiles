local opt = {}
opt.shiftwidth = 2 -- インデント時のスペース文字数
opt.tabstop = 2 -- タブのスペース数
opt.expandtab = true -- タブをスペースにする
opt.textwidth = 0 -- 指定した桁幅で自動で改行させる（0は改行させない）
opt.autoindent = true -- 改行時に自動インデント（現在のインデントをキープする）
opt.hlsearch = true -- 検索結果をハイライトさせる
opt.number = true -- 行数を表示させる
opt.relativenumber = true -- 行数を現在の行から相対的にする
opt.mouse = "a" -- マウスのサポートを有効にする
opt.clipboard = "unnamedplus" -- コピー内容をシステムクリップボードと連携
opt.wrap = false -- ウィンドウの幅より長い行の折り返しを無効にする
opt.ignorecase = true -- 検索時に小文字と大文字を区別しない
opt.smartcase = true -- 大文字で検索するときは小文字と区別させる
opt.termguicolors = true -- 24ビットRGBカラーを使用可能にする
opt.background = "dark" -- 値が "dark" のときは、Vimは暗い背景によく合う色を使わせる
opt.signcolumn = "yes" -- 行数箇所に印を表示させる(git機能など)
opt.backspace = "indent,eol,start" -- バックスペースでインデントと行末をバックスペースで削除可能・挿入の開始点を超えて削除可能
opt.splitright = true -- 水平方向の新しいウィンドウを右側に作らせる
opt.splitbelow = true -- 垂直方向の新しいウィンドウを下側に作らせる
opt.iskeyword = vim.opt.iskeyword:append("-") -- 「-」を単語扱いする
opt.completeopt = "menu,menuone,noselect" -- menuで補完候補を表示し、menuoneで対象が1件しかなくても常に補完ウィンドウを表示・noinsertで補完ウィンドウから選択しない限り挿入しない

local g = {}
g.mapleader = " "

return {
  opt = opt,
  g = g,
}
