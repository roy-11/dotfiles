-- gitsignsを安全にインポートする
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- gitsignsを有効にする
gitsigns.setup()
