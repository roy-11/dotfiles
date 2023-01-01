local config = {
  lsp = {
    formatting = {
      disabled = {
        "sumneko_lua", -- null-lsのstyluaのフォーマットと競合するためdisabledにする
      },
    },
  },
}
return config
