return {
  -- masonがインストールするフォーマッターとリンター
  ensure_installed = {
    "prettier", -- ts/jsのフォーマッター
    "stylua", -- luaのフォーマッター
    "eslint_d", -- ts/jsのリンター
  },
  -- 設定されたフォーマッターとリンターを自動インストール（null-ls使用時）
  automatic_installation = true,
}
