-- cmp-nvim-lspを安全にインポートする
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- オートコンプリートを有効にするために使用（すべてのLSPサーバー設定に割り当て）
local capabilities = cmp_nvim_lsp.default_capabilities()

-- typescriptプラグインを安全にインポートする
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

return function(server, opts)
  require("lspconfig")[server].setup(opts)
  require("lspconfig")["emmet_ls"].setup({
    capabilities = capabilities,
    filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
    },
  })
  -- プラグインでtypescriptサーバを設定
  typescript.setup({
    server = {
      capabilities = capabilities,
    },
  })
end
