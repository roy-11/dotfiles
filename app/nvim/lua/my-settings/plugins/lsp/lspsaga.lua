-- lspsagaを安全にインポートする
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.init_lsp_saga({
  -- ウィンドウのナビゲーション用キーバインド
  move_in_saga = { prev = "<C-k>", next = "<C-j>" },
  -- ファインダーでファイルを開くにはEnterキーを使用
  finder_action_keys = {
    open = "<CR>",
  },
  -- 定義プレビューでファイルを開くにはEnterキーを使用
  definition_action_keys = {
    edit = "<CR>",
  },
})
