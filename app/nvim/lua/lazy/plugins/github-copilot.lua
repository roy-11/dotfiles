return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = true, -- 常にゴースト文字を有効化（vim.g.ai_cmpの値に関係なく）
        keymap = {
          accept = "<Tab>", -- Tabで受け入れ
          accept_word = false,
          accept_line = false,
          next = "<S-Tab>", -- Shift+Tabで次の候補
        },
      },
    },
  },
}
