return {
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
    "bash",
    "html",
    "css",
    "scss",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "rust",
    "lua",
    "markdown",
    "python",
    "toml",
    "vim",
    "yaml",
    "hcl",
    "graphql",
    "help",
    "graphql",
    "dockerfile",
    "gitignore",
  },
  -- 自動で上記の言語解析をインストールする
  auto_install = true,
}
