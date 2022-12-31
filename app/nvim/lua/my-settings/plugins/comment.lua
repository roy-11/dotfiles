-- commentを安全にインポート
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- commentを有効にする
comment.setup()
