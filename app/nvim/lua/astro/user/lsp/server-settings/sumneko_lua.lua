-- cmp-nvim-lspを安全にインポートする
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

return {
  capabilities = capabilities,
  settings = {
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
}
