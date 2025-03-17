return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = opts.completion.list.selection or {}
    opts.completion.list.selection.auto_insert = false

    opts.keymap = {
      preset = "enter",
      ["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
    }

    -- 他の既存設定をそのまま利用
    return opts
  end,
}
