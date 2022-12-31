return function()
  vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "ノーマルモードに戻るとき英数入力にする",
    pattern = "*",
    command = ":silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC",
  })
end
