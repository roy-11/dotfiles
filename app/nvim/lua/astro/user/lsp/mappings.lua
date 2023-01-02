return {
  n = {
    -- lspsaga
    -- 重複la ["<leader>ca"] = { "<cmd>:Lspsaga code_action<cr>" }  -- 利用可能なコードアクションを見る
    -- 重複lr ["<leader>rn"] = { "<cmd>:Lspsaga rename<cr>" }  -- リネームする
    -- 重複[d ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>" }  -- バッファ内の前の診断にジャンプ
    -- 重複]d ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>" }  -- バッファ内の次の診断にジャンプ
    -- 重複K ["K"] = { "<cmd>:Lspsaga hover_doc<cr>" }  -- カーソルの下にあるもののドキュメントを表示
    -- 重複lS ["<leader>o"] = { "<cmd>:Lspsaga outline<cr>" }  -- 右側にアウトラインを表示
    -- 重複ld ["<leader>d"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>" }  -- カーソルに関する診断を表示
    ["<leader>ld"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "● Show line diagnostics" }, -- <leader>Dから変更し、行の診断を上書き（場所も表示されるため） 行の診断を表示する
    ["<leader>lgf"] = { "<cmd>Lspsaga lsp_finder<CR>", desc = "● Show definition and reference" }, -- gfから変更 定義とリファレンスの表示
    ["<leader>lgD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "● Get declaration" }, -- gDから変更 宣言まで取得
    ["<leader>lgd"] = {
      "<cmd>Lspsaga peek_definition<CR>",
      desc = "● Peek definition",
    }, -- gdから変更 ウィンドウ内で定義を見て編集を行う
    ["<leader>lgi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "● Move to implementation" }, -- giから変更 実装へ移動

    -- typescript
    -- TypeScript固有のキーマップ（ファイル名の変更、インポートの更新など）
    ["<leader>rf"] = {
      ":TypescriptRenameFile<CR>",
      desc = "● Typescript rename file",
    }, -- ファイルの名前を変更し、import を更新する
    ["<leader>ri"] = { ":TypescriptOrganizeImports<CR>", desc = "● Typescript organize imports" }, -- import を整理
    ["<leader>ru"] = { ":TypescriptRemoveUnused<CR>", desc = "● Typescript remove unused variables" }, -- 未使用の変数を削除
  },
}
