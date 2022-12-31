-- lspconfigを安全にインポートする
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- cmp-nvim-lspを安全にインポートする
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- typescriptプラグインを安全にインポートする
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap

-- LSPサーバーが有効の時にだけキーバインドを有効にする
local on_attach = function(client, bufnr)
  -- キーバインドオプション
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- キーバインドを設定
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- 定義とリファレンスの表示
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- 宣言まで取得
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- ウィンドウ内で定義を見て編集を行う
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- 実装へ移動
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- 利用可能なコードアクションを見る
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- スマートリネーム
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- 行の診断を表示する
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- カーソルに関する診断を表示
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- バッファ内の前の診断にジャンプ
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- バッファ内の次の診断にジャンプ
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- カーソルの下にあるもののドキュメントを表示
  keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- 右側にアウトラインを表示

  -- TypeScript固有のキーマップ（ファイル名の変更、インポートの更新など）
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- ファイルの名前を変更し、import を更新する
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- import を整理
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- 未使用の変数を削除
  end
end

-- オートコンプリートを有効にするために使用（すべてのLSPサーバー設定に割り当て）
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 記号列（ガター）のDiagnosticシンボルを変更
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- htmlサーバーの設定
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- プラグインでtypescriptサーバを設定
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- cssサーバーを設定
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- tailwindcssサーバーを設定
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- emmet言語サーバーの設定
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- luaサーバーの設定（特殊設定）
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- luaのカスタム設定
    Lua = {
      -- 言語サーバーが "vim "をグローバルに認識するようにする
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- 言語サーバにランタイムファイルを認識させる
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
