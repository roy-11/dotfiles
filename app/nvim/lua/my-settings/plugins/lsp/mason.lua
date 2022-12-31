-- masonを安全にインポートする
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- mason-lspconfigを安全にインポートする
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- mason-null-lsを安全にインポートする
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- masonを有効にする
mason.setup()

mason_lspconfig.setup({
	-- masonがインストールするサーバーのリスト
	sure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"sumneko_lua",
		"emmet_ls",
	},
	-- 設定されたサーバを自動インストール（lspconfig使用時）
	automatic_installation = true,
})

mason_null_ls.setup({
	-- masonがインストールするフォーマッターとリンター
	ensure_installed = {
		"prettier", -- ts/jsのフォーマッター
		"stylua", -- luaのフォーマッター
		"eslint_d", -- ts/jsのリンター
	},
	-- 設定されたフォーマッターとリンターを自動インストール（null-ls使用時）
	automatic_installation = true,
})
