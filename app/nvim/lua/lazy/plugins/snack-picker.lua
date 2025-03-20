return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.formatters = opts.picker.formatters or {}
    opts.picker.formatters.file = opts.picker.formatters.file or {}
    opts.picker.formatters.file.truncate = 200 -- 表示されるパスを省略しない

    opts.picker.win = opts.picker.win or {}
    opts.picker.win.input = opts.picker.win.input or {}
    opts.picker.win.input.keys = opts.picker.win.input.keys or {}
    opts.picker.win.input.keys["<M-v>"] = "toggle_hidden" -- "<M-v>"で隠しファイルの表示/非表示をトグル

    -- 他の既存設定をそのまま利用
    return opts
  end,
}
