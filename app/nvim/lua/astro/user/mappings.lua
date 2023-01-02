return {
  n = {
    ---------------------
    -- General Keymaps
    ---------------------
    -- インクリメントデクリメント
    ["<leader>+"] = { "<C-a>", desc = "● Increment" }, -- インクリメント
    ["<leader>-"] = { "<C-x>", desc = "● Decrement" }, -- デクリメント

    -- ウインドウ操作
    -- 重複<C-w>v["<leader>sv"] = { "<C-w>v" }, -- 垂直方向にウインドウを分割
    -- 重複<C-w>s["<leader>sh"] = { "<C-w>s" }, -- 水平方向にウインドウを分割
    -- 重複<C-w>=["<leader>se"] = { "<C-w>=" }, -- 各ウインドウを均等の高さと幅にする
    -- 重複<leader>x ["<leader>sx"] = { "<cmd>close<CR>" }, -- ウインドウを閉じる

    -- ウインドウを広げる
    ["<C-w><left>"] = { "<C-w>>", desc = "● Expand window to the left" }, -- ウインドウを左に広げる
    ["<C-w><right>"] = { "<C-w><", desc = "● Expand window to the right" }, -- ウインドウを右に広げる
    ["<C-w><up>"] = { "<C-w>+", desc = "● Expand window to the up" }, -- ウインドウを上に広げる
    ["<C-w><down>"] = { "<C-w>-", desc = "● Expand window to the down" }, -- ウインドウを下に広げる

    -- タブ操作
    ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "● open new tab" }, -- 新しいタブを開く
    ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "● Close current tab" }, -- 現在のタブを閉じる
    ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "● Move to next tab" }, -- toggle nodeに上書き、次のタブに移動する
    ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "● Move to previous tab" }, -- 前のタブに移動する

    -- 行を移動
    ["˚"] = { ":m .-2<CR>==", desc = "● Shift the selected line up" }, -- option + k 選択した行を一行上にずらす
    ["∆"] = { ":m .+1<CR>==", desc = "● Shift the selected line down" }, -- option + j 選択した行を一行下にずらす

    -- その他
    ["<Space><CR>"] = { "O<ESC>", desc = "● New line" }, -- カーソルのある行で改行する
    ["PP"] = { '"0p', desc = "● Paste the last yanked strings by Space + p" }, -- Space Pで最後にヤンクした文字列をペーストさせる
    ["x"] = { '"_x', desc = "● Do not register one character with x deleting" }, -- xで1文字削除する際にレジスタに登録しない
    -- 重複<leader>h ["<leader>nh"] = { "<cmd>nohl<CR>" }, -- 検索のハイライトを消す

    ----------------------
    -- Plugin Keybinds
    ----------------------
    -- quickrun
    ["<leader>rq"] = { "<cmd>QuickRun<CR>", desc = "● Quick Run File" },

    -- bufferline
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", desc = "● Move to next buffer by Tab key" }, -- タブキーで次のバッファに移動
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", desc = "● Move to next buffer by Tab key" }, -- タブキーで前のバッファに移動

    -- multi-cursor(shift + opition + jk), vim-tmux-navigatorとの競合のためCtrl-j,kは使用できない
    [""] = {
      "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>",
      desc = "● Create multi-cursor up",
    }, -- 一行上にマルチカーソルを作成
    ["Ô"] = {
      "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>",
      desc = "● Create multi-cursor down",
    }, -- 一行下にマルチカーソルを作成

    -- vim-maximizer
    ["<leader>sm"] = { ":MaximizerToggle<CR>", desc = "● Maximize window" }, -- ウインドウのサイズを最大化・戻す

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
      desc = "● List git commits for current file/buffer",
    }, -- 現在のファイル/バッファの git コミットをリストアップ

    -- lsp
    ["<leader>rs"] = { ":LspRestart<cr>", desc = "● Restart Lsp" }, -- LSPサーバーを再起動させる

    -- zen-mode
    ["<leader>z"] = { ":ZenMode<cr>", desc = "● Zen mode" }, -- Zenモード
  },

  i = {
    -- 重複jk ["jk"] = { "<ESC>" }, -- jkで挿入モードから出る
    -- 重複jk ["jj"] = { "<ESC>" }, -- jjで挿入モードから出る
  },

  v = {
    ["˚"] = { ":m '<-2<CR>gv-gv", desc = "● Shift the selected line up" }, -- option + k 選択した行を一行上にずらす
    ["∆"] = { ":m '>+1<CR>gv-gv", desc = "● Shift the selected line down" }, -- option + j 選択した行を一行下にずらす
    ["PP"] = { '"0p', desc = "● Paste the last yanked strings by Space + p" }, -- Space Pで最後にヤンクした文字列をペーストさせる
  },
}
