return function(config)
  config[1] = {
    hl = { fg = "fg", bg = "bg" },
    astronvim.status.component.mode({ mode_text = { padding = { left = 3, right = 3 } } }),
    astronvim.status.component.git_branch(),
    astronvim.status.component.file_info(),
    astronvim.status.component.git_diff(),
    astronvim.status.component.diagnostics(),
    astronvim.status.component.fill(),
    astronvim.status.component.lsp(),
    astronvim.status.component.treesitter(),
    astronvim.status.component.nav(),
  }
  return config
end
