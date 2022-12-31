-- nvim-treeを安全にインポートする
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- nvim-treeドキュメンテーションの推奨設定
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ツリーの矢印の色を修正する
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- nvim-treeを設定する
nvimtree.setup({
	-- 矢印アイコンを変更
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- フォルダを閉じてる時
					arrow_open = "", -- フォルダを開いている時
				},
			},
		},
	},
	-- エクスプローラがウィンドウ分割でうまく動作するように window_picker を無効化
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
