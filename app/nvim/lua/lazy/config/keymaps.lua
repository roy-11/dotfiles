-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  -- local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  -- if not keys.active[keys.parse({ lhs, mode = mode }).id] then
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
  -- end
end

---------------------
-- General Keymaps
---------------------

map("n", "x", '"_x', { desc = "x but not register" })
map("n", "PP", '"0p', { desc = "paste the last y yunk" })
map("n", "<Space><CR>", "O<ESC>", { desc = "create new line" })

----------------------
-- Plugin Keybinds
----------------------

map("n", "<Space>r", "<cmd>QuickRun<CR>", { desc = "run this file" })

map("n", "<leader>;", function()
  return require("debugprint").debugprint({ variable = true })
end, {
  expr = true,
  desc = "print a variable",
})
