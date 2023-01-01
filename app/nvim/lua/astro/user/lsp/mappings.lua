return {
  n = {
    -- lspsaga
    -- 重複la ["<leader>ca"] = { "<cmd>:Lspsaga code_action<cr>", desc = "利用可能なコードアクションを見る" },
    -- 重複lr ["<leader>rn"] = { "<cmd>:Lspsaga rename<cr>", desc = "リネームする" },
    -- 重複[d ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "バッファ内の前の診断にジャンプ" },
    -- 重複]d ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "バッファ内の次の診断にジャンプ" },
    -- 重複K ["K"] = { "<cmd>:Lspsaga hover_doc<cr>", desc = "カーソルの下にあるもののドキュメントを表示" },
    -- 重複lS ["<leader>o"] = { "<cmd>:Lspsaga outline<cr>", desc = "右側にアウトラインを表示" },
    -- 重複ld ["<leader>d"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "カーソルに関する診断を表示" },
    ["<leader>ld"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "行の診断を表示する" }, -- <leader>Dから変更し、行の診断を上書き（場所も表示されるため）
    ["<leader>lgf"] = { "<cmd>Lspsaga lsp_finder<CR>", desc = "定義とリファレンスの表示" }, -- gfから変更
    ["<leader>lgD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "宣言まで取得" }, -- gDから変更
    ["<leader>lgd"] = {
      "<cmd>Lspsaga peek_definition<CR>",
      desc = "ウィンドウ内で定義を見て編集を行う",
    }, -- gdから変更
    ["<leader>lgi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "実装へ移動" }, -- giから変更

    -- typescript
    -- TypeScript固有のキーマップ（ファイル名の変更、インポートの更新など）
    ["<leader>rf"] = {
      ":TypescriptRenameFile<CR>",
      desc = "ファイルの名前を変更し、import を更新する",
    },
    ["<leader>ri"] = { ":TypescriptOrganizeImports<CR>", desc = "import を整理" },
    ["<leader>ru"] = { ":TypescriptRemoveUnused<CR>", desc = "未使用の変数を削除" },
  },
}
