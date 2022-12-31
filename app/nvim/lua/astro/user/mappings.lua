return {
  n = {
    -- 重複<leader>h ["<leader>nh"] = { "<cmd>nohl<CR>" }, -- 検索のハイライトを消す
    -- 重複<C-w>v["<leader>sv"] = { "<C-w>v" }, -- 垂直方向にウインドウを分割
    -- 重複<C-w>s["<leader>sh"] = { "<C-w>s" }, -- 水平方向にウインドウを分割
    -- 重複<C-w>=["<leader>se"] = { "<C-w>=" }, -- 各ウインドウを均等の高さと幅にする
    -- 重複<leader>x ["<leader>sx"] = { "<cmd>close<CR>" }, -- ウインドウを閉じる
    ["<Space><CR>"] = { "O<ESC>", desc = "カーソルのある行で改行する" },
    ["PP"] = { '"0p', desc = "Space Pで最後にヤンクした文字列をペーストさせる" },
    ["x"] = { '"_x', desc = "xで1文字削除する際にレジスタに登録しない" },
    ["<leader>+"] = { "<C-a>", desc = "インクリメント" },
    ["<leader>-"] = { "<C-x>", desc = "デクリメント" },
    ["<C-w><left>"] = { "<C-w>>", desc = "ウインドウを左に広げる" },
    ["<C-w><right>"] = { "<C-w><", desc = "ウインドウを右に広げる" },
    ["<C-w><up>"] = { "<C-w>+", desc = "ウインドウを上に広げる" },
    ["<C-w><down>"] = { "<C-w>-", desc = "ウインドウを下に広げる" },
    ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "新しいタブを開く" },
    ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "現在のタブを閉じる" },
    ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "次のタブに移動する" }, -- toggle nodeに上書き
    ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "前のタブに移動する" },
    ["˚"] = { ":m .-2<CR>==", desc = "選択した行を一行上にずらす" },
    ["∆"] = { ":m .+1<CR>==", desc = "選択した行を一行下にずらす" },

    -- bufferline
    ["<Tab>"] = { "<Cmd>BufferLineCycleNext<CR>", desc = "タブキーで次のバッファに移動" },
    ["<S-Tab>"] = { "<Cmd>BufferLineCyclePrev<CR>", desc = "タブキーで前のバッファに移動" },

    -- multi-cursor
    ["<C-k>"] = {
      "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>",
      desc = "一行上にマルチカーソルを作成",
    },
    ["<C-j>"] = {
      "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>",
      desc = "一行下にマルチカーソルを作成",
    },

    -- vim-maximizer
    ["<leader>sm"] = { ":MaximizerToggle<CR>", desc = "ウインドウのサイズを最大化・戻す" },

    -- telescope
    -- 重複<leader>ff ["<leader>ff] = { "<cmd>Telescope find_files<cr>") -- .gitignoreを尊重して、現在の作業ディレクトリ内のファイルを検索
    -- 重複<leader>fw ["<leader>fs"] = { "<cmd>Telescope live_grep<cr>" }, -- 現在の作業ディレクトリ内のファイル内の単語を見つける
    -- 重複<leader>fc ["<leader>fc"] = { "<cmd>Telescope grep_string<cr>" }, -- カーソル下の文字列を現在の作業ディレクトリから探す(曖昧検索)
    -- 重複<leader>fb ["<leader>fb"] = { "<cmd>Telescope buffers<cr>" }, -- 現在のneovimインスタンスで開いているバッファのリストを表示
    -- 重複<leader>ff ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>" }, -- ヘルプタグをリストアップする
    -- 重複<leader>gc ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>" }, -- 全ての git コミットをリストアップ
    -- 重複<leader>gb ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>" }, -- gitブランチをリストアップ
    -- 重複<leader>gt ["<leader>gs"] = { "<cmd>Telescope git_status<cr>" }, -- ファイルごとの現在の変更点を差分表示
    ["<leader>gfc"] = {
      "<cmd>Telescope git_bcommits<cr>",
      desc = "現在のファイル/バッファの git コミットをリストアップ",
    },

    -- lsp
    ["<leader>rs"] = { ":LspRestart<cr>", desc = "LSPサーバーを再起動させる" },

    -- lsp attach
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
  },
  i = {
    -- 重複jk ["jk"] = { "<ESC>" }, -- jkで挿入モードから出る
    -- 重複jk ["jj"] = { "<ESC>" }, -- jjで挿入モードから出る
  },
  v = {
    ["˚"] = { ":m '<-2<CR>gv-gv", desc = "選択した行を一行上にずらす" },
    ["∆"] = { ":m '>+1<CR>gv-gv", desc = "選択した行を一行下にずらす" },
  },
}
