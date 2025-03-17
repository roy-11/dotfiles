return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.formatters = opts.picker.formatters or {}
    opts.picker.formatters.file = opts.picker.formatters.file or {}
    opts.picker.formatters.file.truncate = 200

    -- 他の既存設定をそのまま利用
    return opts
  end,
}
