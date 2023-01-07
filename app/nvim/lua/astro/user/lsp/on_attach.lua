return function(_, bufnr)
  -- vim.keymap.del("n", "gr", { buffer = bufnr }) -- ReplaceWithRegisterと競合するため
end
