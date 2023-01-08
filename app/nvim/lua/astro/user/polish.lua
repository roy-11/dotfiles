return function()
  -- 記号列（ガター）のDiagnosticシンボルを変更
  local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- ノーマルモードに戻るとき英数入力にする
  vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "ノーマルモードに戻るとき英数入力にする",
    pattern = "*",
    command = ":silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC",
  })

  -- keymappingで動作しないためdebugprintの機能をpolishで定義
  vim.keymap.set("n", "<leader>;", function()
    return require("debugprint").debugprint({ variable = true })
  end, {
    expr = true,
  })
  vim.keymap.set("n", "g?d", function()
    return require("debugprint").deleteprints()
  end)
end
