-- telescope actionsを安全にインポート
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

return {
  -- カスタムマッピングを設定
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- 前の結果に移動
        ["<C-j>"] = actions.move_selection_next, -- 後の結果に移動
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- 選択したものをquickfixlistに送信する
      },
    },
  },
}
