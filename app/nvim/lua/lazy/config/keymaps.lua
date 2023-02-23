-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -- zen-mode
-- keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>") -- 全ての git コミットをリストアップ
--
-- -- quickrun
-- keymap.set("n", "<leader>qr", "<cmd>QuickRun<cr>") -- ファイルを実行
--
-- -- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- ウインドウのサイズを最大化・戻す
--
-- -- multi-cursor
-- keymap.set("", "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>") -- 一行上にマルチカーソルを作成
-- keymap.set("Ô", "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>") -- 一行下にマルチカーソルを作成

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "x", "_x", { desc = "x but not register" })
map("n", "PP", '"0p', { desc = "paste the last y yunk" })
map("n", "<Space><CR>", "O<ESC>", { desc = "create new line" })
