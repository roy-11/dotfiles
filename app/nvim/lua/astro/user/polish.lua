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
end
