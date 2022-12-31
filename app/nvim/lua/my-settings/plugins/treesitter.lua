-- nvim-treesitterを安全にインポート
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- treesitterを設定する
treesitter.setup({
  -- シンタックスハイライトを有効にする
  highlight = {
    enable = true,
  },
  -- インデントを有効にする
  indent = { enable = true },
  -- 自動でタグを有効にする (w/nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- 以下の言語解析をインストールされるようにする
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  -- 自動で上記の言語解析をインストールする
  auto_install = true,
})
