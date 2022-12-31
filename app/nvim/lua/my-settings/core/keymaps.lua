local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

keymap.set("i", "jk", "<ESC>") -- jkで挿入モードから出る
keymap.set("i", "jj", "<ESC>") -- jjで挿入モードから出る
keymap.set("n", "<leader>nh", ":nohl<CR>") -- 検索のハイライトを消す
keymap.set("n", "x", '"_x') -- xで1文字削除する際にレジスタに登録しない
keymap.set("n", "<leader>+", "<C-a>") -- インクリメント
keymap.set("n", "<leader>-", "<C-x>") -- デクリメント

keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直方向にウインドウを分割
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平方向にウインドウを分割
keymap.set("n", "<leader>se", "<C-w>=") -- 各ウインドウを均等の高さと幅にする
keymap.set("n", "<leader>sx", ":close<CR>") -- ウインドウを閉じる

keymap.set("n", "<leader>to", ":tabnew<CR>") -- 新しいタブを開く
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- 現在のタブを閉じる
keymap.set("n", "<leader>tn", ":tabn<CR>") --  次のタブに移動する
keymap.set("n", "<leader>tp", ":tabp<CR>") --  前のタブに移動する

keymap.set("n", "<C-w><left>", "<C-w><") -- ウインドウを左に広げる
keymap.set("n", "<C-w><right>", "<C-w>>") -- ウインドウを右に広げる
keymap.set("n", "<C-w><up>", "<C-w>+") -- ウインドウを上に広げる
keymap.set("n", "<C-w><down>", "<C-w>-") -- ウインドウを下に広げる

keymap.set("n", "˚", ":m .-2<CR>==") -- 選択した行を一行上にずらす
keymap.set("n", "∆", ":m .+1<CR>==") -- 選択した行を一行下にずらす
keymap.set("v", "˚", ":m '<-2<CR>gv-gv") -- 選択した行を一行下にずらす
keymap.set("v", "∆", ":m '>+1<CR>gv-gv") -- 選択した行を一行下にずらす

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- ウインドウのサイズを最大化・戻す

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- ファイルエクスプローラを開く閉じる

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- .gitignoreを尊重して、現在の作業ディレクトリ内のファイルを検索
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- 現在の作業ディレクトリ内のファイル内の単語を見つける
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- カーソル下の文字列を現在の作業ディレクトリから探す(曖昧検索)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- 現在のneovimインスタンスで開いているバッファのリストを表示
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- ヘルプタグをリストアップする

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- 全ての git コミットをリストアップ
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- 現在のファイル/バッファの git コミットをリストアップ
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- gitブランチをリストアップ
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- ファイルごとの現在の変更点を差分表示

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- lspを再起動させる

-- multi-cursor
keymap.set("<C-k>", "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>") -- 一行上にマルチカーソルを作成
keymap.set("<C-j>", "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>") -- 一行下にマルチカーソルを作成
