-- nvim-autopairsの補完機能を安全にインポート
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end

-- nvim-cmpプラグインを安全にインポートする（補完プラグイン）
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- 自動ペアリングと補完を連動させる
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

return {
  check_ts = true, -- treesitterを有効にする
  ts_config = {
    lua = { "string" }, -- lua string treesitter nodesのペアを追加しない
    javascript = { "template_string" }, -- javscript template_string treesitter nodesのペアを追加しない
    java = false, -- javaでtreesitterをチェックしない
  },
}
